#include "field.h"
#include "tile.h"

#include <iostream>
#include <QVariant>

const int cFieldSize = 28 * 31;

Field::Field(QObject *parent):
    QObject(parent),
    mTilesGrid(cFieldSize)
{
    initializeTilesGrid();
}

Field::~Field()
{
    for(auto &tile : mTilesGrid)
    {
        delete tile;
    }
}

int Field::tilesNumber() const
{
    return static_cast<int>(mTilesGrid.size());
}

void Field::initializeTilesGrid()
{
    for(auto &tile : mTilesGrid)
    {
        tile = new Tile();
    }
}

bool Field::tileIsWall(int index) const
{
    return mTilesGrid[index]->isWall();
}

bool Field::tileIsEmptyPass(int index) const
{
    return TileObject::None == mTilesGrid[index]->tileObject()
            && !mTilesGrid[index]->isWall();
}

bool Field::tileHasDot(int index) const
{
    return TileObject::Dot == mTilesGrid[index]->tileObject();
}

bool Field::tileHasEnergizer(int index) const
{
    return TileObject::Energizer == mTilesGrid[index]->tileObject();
}

bool Field::tileHasFruit(int index) const
{
    return TileObject::Fruit == mTilesGrid[index]->tileObject();
}

void Field::clearObject(int index)
{
    mTilesGrid[index]->setType(TileObject::None);
}

void Field::setTileProperty(int index, TileObject tileObject, bool isWall)
{
    mTilesGrid[index]->setWall(isWall);
    mTilesGrid[index]->setType(tileObject);
}

void Field::setTilesGrid(const QVariantList &fieldArray)
{
    for(int index = 0; index < fieldArray.size(); ++index)
    {
        switch (fieldArray[index].toInt())
        {
            case 1:
                setTileProperty(index, TileObject::None, true);
            break;
            case 2:
                setTileProperty(index, TileObject::Dot);
            break;
            case 3:
                setTileProperty(index, TileObject::Energizer);
            break;
            case 0:
            default:
                setTileProperty(index, TileObject::None);
            break;
        }
    }
}

int Field::checkPacmanState(const int pPacX, const int pPacY, const QString pDirection)
{
//    int row = qRound(pPacY / 16);
}
