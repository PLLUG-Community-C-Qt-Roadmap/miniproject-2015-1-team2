#ifndef TILESET_H
#define TILESET_H

#include <QString>

class TileSet
{
public:
    TileSet();

    void setFirstgid(int firstgid);
    int firstgid() {return mFirstgid;}

    void setLastgid();
    int lastgid() {return mLastgid;}

    void setName(QString name);
    QString name() {return mName;}

    void setTileWidth(int tileWidth);
    int tileWidth() {return mTileWidth;}

    void setSource(QString source);
    QString source() {return mSource;}

    void setTileHeight(int tileHeight);
    int tileHeight() {return mTileHeight;}

    void setImageWidth(int imageWidth);
    int imageWidth() {return mImageWidth;}

    void setImageHeight(int imageHeight);
    int imageHeight() {return mImageHeight;}

    void setTileAmountWidth();
    int tileAmountWidth() {return mTileAmountWidth;}


    private:
        int mFirstgid;
        int mLastgid;
        QString mName;
        int mTileWidth;
        QString mSource;
        int mTileHeight;
        int mImageWidth;
        int mImageHeight;
        int mTileAmountWidth;
};

#endif // TILESET_H
