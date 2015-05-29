#include "field.h"
#include "tile.h"

#include <math.h>
#include <iostream>
#include <QVariant>
#include <QDebug>

const int cFieldSize = 28 * 31;
const int cFieldRows = 31;
const int cFieldCols = 28;
const int cMapEmpty = 0;
const int cMapWall = 1;

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

// Returns index of tile, where our Pacman stands
int Field::getIndex(int row, int col)
{
    return row * cFieldCols + col;
}

// Returns index of tile, that is next after tile's index.
// Returns negative number, if next tile doesn't exist.
int Field::getNextIndex(int index, const QString &pDirection)
{
    int rNextIndex;

    if(!pDirection.compare("right"))
    {
        rNextIndex = index + 1;
        if(rNextIndex == cFieldCols)
        {
            rNextIndex = -1;
        }
    }
    else if(!pDirection.compare("left"))
    {
        rNextIndex = index - 1;
    }
    else if(!pDirection.compare("up"))
    {
        rNextIndex = index - cFieldCols;
    }
    else if(!pDirection.compare("down"))
    {
        rNextIndex = index + cFieldCols;
        if(rNextIndex >= cFieldSize)
        {
            rNextIndex = -1;
        }
    }

    return rNextIndex;
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

int Field::checkPacmanState(const int pPacX, const int pPacY, const QString &pDirection)
{
    int tileWidth = 16;
    int tileHeight = 16;
    int pacRow;
    int pacColumn;
    int pacIndex;
    int nextIndex;

    if(!pDirection.compare("right"))
    {
        int lPacRow = pPacY / tileHeight;
        float lPacCol = (pPacX * 1.0) / (tileWidth * 1.0);

        pacColumn = round(lPacCol) - 1;
        if(pacColumn < 0)
        {
            pacColumn = 0;
        }

        pacRow = lPacRow;
        pacIndex = getIndex(pacRow, pacColumn);

        //        newPacX -= pacmanStep;

        //        //cannot go to next right tile - it does not exist
        //        if(1 == pacColumn)
        //        {
        //            int tileCenterX = tileWidth / 2;

        //            if(newPacX < tileCenterX)
        //            {
        //                return 1;
        //            }
        //            else
        //            {
        //                return 2;
        //            }
        //        }
        //        else
        //        {
        //            int nextTileIndex = lIndex - 1;
        //            int nextColumnNum = pacColumn - 1;
        //            int tileCenterX = nextColumnNum * tileWidth - (tileWidth / 2);

        //            //pacman still will be at same tile
        //            if(newPacX > tileCenterX)
        //            {
        //                return 2;
        //            }
        //            else
        //            {
        //                if(tileIsWall(nextTileIndex))
        //                {
        //                    return 1;
        //                }
        //                else
        //                {
        //                    return 2;
        //                }
        //            }
        //        }
    }
    else if(!pDirection.compare("left"))
    {
        float lPacCol = (pPacX * 1.0) / (tileWidth * 1.0);
        int lPacRow = pPacY / tileHeight;

        // Determinating of pacColumn
        if((lPacCol - (pPacX / tileWidth)) == 0.5)
        {
            pacColumn = pPacX / tileWidth;
        }
        else
        {
            pacColumn = round(lPacCol);
        }

        pacRow = lPacRow;
        pacIndex = getIndex(pacRow, pacColumn);

        //        newPacX += pacmanStep;

        //        //cannot go to next right tile - it does not exist
        //        if(cFieldCols == pacColumn)
        //        {
        //            int tileCenterX = cFieldCols * tileWidth - (tileWidth / 2);

        //            if(newPacX > tileCenterX)
        //            {
        //                return 1;
        //            }
        //            else
        //            {
        //                return 2;
        //            }
        //        }
        //        else
        //        {
        //            int nextTileIndex = lIndex + 1;
        //            int nextColumnNum = pacColumn + 1;
        //            int tileCenterX = nextColumnNum * tileWidth - (tileWidth / 2);

        //            //pacman still will be at same tile
        //            if(newPacX < tileCenterX)
        //            {
        //                return 2;
        //            }
        //            else
        //            {
        //                if(tileIsWall(nextTileIndex))
        //                {
        //                    return 1;
        //                }
        //                else
        //                {
        //                    return 2;
        //                }
        //            }
        //        }

    }
    else if(!pDirection.compare("up"))
    {
        float lPacRow = (pPacY * 1.0) / (tileHeight * 1.0);
        int lPacCol = pPacX / tileWidth;

        // Determinating of pacRow
        if((lPacRow - (pPacY / tileHeight)) == 0.5)
        {
            pacRow = pPacY / tileHeight;
        }
        else
        {
            pacRow = round(lPacRow);
        }

        pacColumn = lPacCol;
        pacIndex = getIndex(pacRow, pacColumn);
    }
    else if(!pDirection.compare("down"))
    {
        float lPacRow = (pPacY * 1.0) / (tileHeight * 1.0);
        int lPacCol = pPacX / tileWidth;

        pacRow = round(lPacRow) - 1;
        if(pacRow < 0)
        {
            pacRow = 0;
        }

        pacColumn = lPacCol;
        pacIndex = getIndex(pacRow, pacColumn);
    }

    // Determinating nextIndex
    nextIndex = getNextIndex(pacIndex, pDirection);

    if(tileIsWall(nextIndex))
    {
        return cMapWall;
    }
    else
    {
        return cMapEmpty;
    }
}
