#ifndef ITILE_H
#define ITILE_H

enum class TileObject
{
    None,
    Dot,
    Energizer,
    Fruit
};

class Tile
{
public:
    Tile();

    bool isWall() const;
    void setWall(bool isWall = true);

    TileObject tileObject() const;
    void setType(TileObject objectType = TileObject::None);

private:
    bool mIsWall;
    TileObject mObject;
};

#endif // ITILE_H
