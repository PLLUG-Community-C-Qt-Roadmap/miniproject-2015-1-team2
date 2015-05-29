#ifndef FIELD_H
#define FIELD_H

#include <QObject>
#include <vector>

class Tile;
enum class TileObject;

class Field: public QObject
{
    Q_OBJECT
public:
    Field(QObject* parent = 0);
    ~Field();
    Q_INVOKABLE int tilesNumber() const;
    Q_INVOKABLE bool tileIsWall(int index) const;
    Q_INVOKABLE bool tileIsEmptyPass(int index) const;
    Q_INVOKABLE bool tileHasDot(int index) const;
    Q_INVOKABLE bool tileHasEnergizer(int index) const;
    Q_INVOKABLE bool tileHasFruit(int index) const;

    Q_INVOKABLE void clearObject(int index);
    Q_INVOKABLE void setTilesGrid(const QVariantList& fieldArray);
    Q_INVOKABLE int checkPacmanState(const int pPacX, const int pPacY, const QString pDirection);

private:
    void initializeTilesGrid();
    void setTileProperty(int index, TileObject tileObject, bool isWall = false);
    int getIndex(int row, int col);

private:
    std::vector <Tile *> mTilesGrid;
};

#endif // FIELD_H
