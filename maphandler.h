#ifndef MAPHANDLER_H
#define MAPHANDLER_H

#include <QXmlStreamReader>
#include <QList>
#include "tileset.h"

class MapHandler
{
public:
    MapHandler();
    void readInTmxFile(QString tmxFile);

private:
    QXmlStreamReader *mMapReader;
    QList<TileSet> mTilesets;
    int mMapWidth;
    int mMapHeight;
    int mTilesetWidth;
    int mTilesetHeight;
};

#endif // MAPHANDLER_H
