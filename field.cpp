#include "field.h"
#include "tile.h"

#include <math.h>
#include <iostream>
#include <QVariant>

const int cFieldSize = 28 * 31;
const int cFieldRows = 31;
const int cFieldCols = 28;

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
    int fieldWidth = 28;
    int tileWidth = 16, tileHeight = 16;

    int pacRow = ceil(pPacY * 1.0 / tileHeight);
    int pacColumn = ceil(pPacX * 1.0 / tileWidth);
    int pacIndex;

    // Index of pacman's tile in mTilesGrid
    int lIndex = (pacRow - 1) * fieldWidth + pacColumn;

    int pacmanStep = 4;
    int newPacX = pPacX;

    if(!pDirection.compare("right"))
    {
        newPacX -= pacmanStep;

        //cannot go to next right tile - it does not exist
        if(1 == pacColumn)
        {
            int tileCenterX = tileWidth / 2;

            if(newPacX < tileCenterX)
            {
                return 1;
            }
            else
            {
                return 2;
            }
        }
        else
        {
            int nextTileIndex = lIndex - 1;
            int nextColumnNum = pacColumn - 1;
            int tileCenterX = nextColumnNum * tileWidth - (tileWidth / 2);

            //pacman still will be at same tile
            if(newPacX > tileCenterX)
            {
                return 2;
            }
            else
            {
                if(tileIsWall(nextTileIndex))
                {
                    return 1;
                }
                else
                {
                    return 2;
                }
            }
        }
    }
    else if(!pDirection.compare("left"))
    {
        newPacX += pacmanStep;

        //cannot go to next right tile - it does not exist
        if(fieldWidth == pacColumn)
        {
            int tileCenterX = fieldWidth * tileWidth - (tileWidth / 2);

            if(newPacX > tileCenterX)
            {
                return 1;
            }
            else
            {
                return 2;
            }
        }
        else
        {
            int nextTileIndex = lIndex + 1;
            int nextColumnNum = pacColumn + 1;
            int tileCenterX = nextColumnNum * tileWidth - (tileWidth / 2);

            //pacman still will be at same tile
            if(newPacX < tileCenterX)
            {
                return 2;
            }
            else
            {
                if(tileIsWall(nextTileIndex))
                {
                    return 1;
                }
                else
                {
                    return 2;
                }
            }
        }

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
            pacRow = qRound(qreal(lPacRow));
        }

        pacColumn = lPacCol;
    }
    else if(!pDirection.compare("down"))
    {
        float lPacRow = (pPacY * 1.0) / (tileHeight * 1.0);
        int lPacCol = pPacX / tileWidth;

        pacRow = qRound(qreal(lPacRow)) - 1;
        if(pacRow < 0)
        {
            pacRow = 0;
        }

        pacColumn = lPacCol;
    }

    // Index of tile, where our Pacman stands
    pacIndex = pacRow * cFieldCols + pacColumn;
}
