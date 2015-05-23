#include "tile.h"

Tile::Tile():
    mIsWall {false},
    mObject {TileObject::None}
{
}

bool Tile::isWall() const
{
    return mIsWall;
}

void Tile::setWall(bool isWall)
{
    mIsWall = isWall;

    if(mIsWall)
    {
        mObject = TileObject::None;
    }
}

TileObject Tile::tileObject() const
{
    return mObject;
}

void Tile::setType(TileObject objectType)
{
    mObject = mIsWall ? TileObject::None : objectType;
}

