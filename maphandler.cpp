#include "maphandler.h"
#include <QFile>
#include <QFileInfo>
#include <iostream>

MapHandler::MapHandler()
{

}

void MapHandler::readInTmxFile(QString tmxFile)
{
    QFile* file = new QFile(tmxFile);


    if (!file->open(QIODevice::ReadOnly | QIODevice::Text))
    {
        std::cout <<"Cannot open file with map";
    }


    mMapReader = new QXmlStreamReader(file);

    while(!mMapReader->atEnd() && !mMapReader->hasError())
    {
        QXmlStreamReader::TokenType token = mMapReader->readNext();

        if(token == QXmlStreamReader::StartDocument)
        {
            continue;
        }

        if(token == QXmlStreamReader::StartElement)
        {
             if(mMapReader->name() == "tileset")
             {
                 TileSet tileset;

                 tileset.setFirstgid(mMapReader->attributes().value("firstgid").toInt());
                 tileset.setName(mMapReader->attributes().value("name").toString());
                 tileset.setTileWidth(mMapReader->attributes().value("tilewidth").toInt());
                 tileset.setTileHeight(mMapReader->attributes().value("tileheight").toInt());

                 mMapReader->readNext();
                 while(!(mMapReader->tokenType() == QXmlStreamReader::StartElement
                       && mMapReader->name() == "image"))
                 {
                     mMapReader->readNext();

                     tileset.setSource(mMapReader->attributes().value("source").toString());
                     tileset.setImageWidth(mMapReader->attributes().value("width").toInt());
                     tileset.setImageHeight(mMapReader->attributes().value("height").toInt());

                 }

                 tileset.setLastgid();
                 tileset.setTileAmountWidth();

                 mTilesets.append(tileset);

             }
             if(mMapReader->name() == "map")
             {

                 mMapWidth = mMapReader->attributes().value("width").toInt();
                 mMapHeight = mMapReader->attributes().value("height").toInt();
                 mTilesetWidth = mMapReader->attributes().value("tilewidth").toInt();
                 mTilesetHeight = mMapReader->attributes().value("tileheight").toInt();

             }


        }
    }
}
