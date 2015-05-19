#include <QtMath>
#include "tileset.h"

TileSet::TileSet()
{

}

void TileSet::setFirstgid(int firstgid)
{
    mFirstgid = firstgid;
}

void TileSet::setLastgid()
{
    mLastgid = mTileAmountWidth * qFloor(mImageHeight * 1.0 / mTileHeight) + mFirstgid - 1;
}

void TileSet::setName(QString name)
{
    mName = name;
}

void TileSet::setTileWidth(int tileWidth)
{
    mTileWidth = tileWidth;
}

void TileSet::setSource(QString source)
{
    mSource = source;
}

void TileSet::setTileHeight(int tileHeight)
{
    mTileHeight = tileHeight;
}

void TileSet::setImageWidth(int imageWidth)
{
    mImageWidth = imageWidth;
}

void TileSet::setImageHeight(int imageHeight)
{
    mImageHeight = imageHeight;
}

void TileSet::setTileAmountWidth()
{
    mTileAmountWidth = qFloor(mImageWidth * 1.0 / mTileWidth);
}

