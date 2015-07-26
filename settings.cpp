#include "settings.h"
#include <QSettings>
#include <QVariant>
#include <QDataStream>
#include <QString>
#include <QDebug>

//typedef QHash<QString, QVariant> HighScoresHash;

/*!
 * \brief The PlayerStruct struct contains information
 * about one player.
 */
struct PlayerStruct{
    QString playerName;
    int playerScore;
};

Q_DECLARE_METATYPE(PlayerStruct)

QDataStream& operator<< (QDataStream &stream, const PlayerStruct &player)
{
    stream << player.playerName << player.playerScore;
    return stream;
}

QDataStream& operator>> (QDataStream &stream, PlayerStruct &player)
{
    stream >> player.playerName;
    stream >> player.playerScore;
    return stream;
}

Settings::Settings(QObject *parent) : QObject(parent)
{
//    qRegisterMetaType<PlayerStruct>("PlayerStruct");
    qRegisterMetaTypeStreamOperators<PlayerStruct>("PlayerStruct");
    loadSettings();
}

Settings::~Settings()
{
    delete mHighScores;
}

void Settings::loadSettings()
{
    QSettings lSettings(QSettings::NativeFormat, QSettings::UserScope, "PLLUG", "Pacman");

    lSettings.beginGroup("options");
    bool lMusic = lSettings.value("music", true).toBool();
    bool lSoundEffects = lSettings.value("soundEffects", true).toBool();
    bool lFullscreen = lSettings.value("fullscreen", false).toBool();
    int lVolume = lSettings.value("volume", 50).toInt();
    int lDifficulty = lSettings.value("difficulty", 1).toInt();
    lSettings.endGroup();

    lSettings.beginGroup("highScores");
    PlayerStruct lDefaultPlayer;
    lDefaultPlayer.playerName = "Player";
    lDefaultPlayer.playerScore = 0;
    PlayerStruct lPlayer0 =
            lSettings.value("player0", QVariant::fromValue(lDefaultPlayer)).value<PlayerStruct>();
    PlayerStruct lPlayer1 =
            lSettings.value("player1", QVariant::fromValue(lDefaultPlayer)).value<PlayerStruct>();
    PlayerStruct lPlayer2 =
            lSettings.value("player2", QVariant::fromValue(lDefaultPlayer)).value<PlayerStruct>();
    PlayerStruct lPlayer3 =
            lSettings.value("player3", QVariant::fromValue(lDefaultPlayer)).value<PlayerStruct>();
    PlayerStruct lPlayer4 =
            lSettings.value("player4", QVariant::fromValue(lDefaultPlayer)).value<PlayerStruct>();
    lSettings.endGroup();

    QHash<QString, QVariant> *lHighScores = new QHash<QString, QVariant>();
    lHighScores->insert("player0", QVariant::fromValue(lPlayer0));
    lHighScores->insert("player1", QVariant::fromValue(lPlayer1));
    lHighScores->insert("player2", QVariant::fromValue(lPlayer2));
    lHighScores->insert("player3", QVariant::fromValue(lPlayer3));
    lHighScores->insert("player4", QVariant::fromValue(lPlayer4));

    // DEBUUUUUUUUUUUUGGGGGG
    qDebug() << "Player name: "
             << lHighScores->value("player0").value<PlayerStruct>().playerName;
    qDebug() << "Player score: "
             << lHighScores->value("player0").value<PlayerStruct>().playerScore;
    // DEEEEEEEEBUUUUUUUUUUG

    setMusic(lMusic);
    setSoundEffects(lSoundEffects);
    setFullscreen(lFullscreen);
    setVolume(lVolume);
    setDifficulty(lDifficulty);
    setHighScores(lHighScores);
}

void Settings::saveSettings()
{
    QSettings lSettings(QSettings::NativeFormat, QSettings::UserScope, "PLLUG", "Pacman");

    lSettings.beginGroup("options");
    lSettings.setValue("music", music());
    lSettings.setValue("soundEffects", soundEffects());
    lSettings.setValue("fullscreen", fullscreen());
    lSettings.setValue("volume", volume());
    lSettings.setValue("difficulty", difficulty());
    lSettings.endGroup();
}

// Adds new player's score and name in mHighScores with sorting
/*void Settings::addScore(QString playerName, int playerScore)
{
    qDebug() << "Function addScore(" << playerName << ", " << playerScore << ")";
    HighScoresHash *lHighScores = new HighScoresHash();
    *lHighScores = *mHighScores;
    int i = 0;

    for(auto e : *lHighScores.keys())
    {
        PlayerStruct lPlayer;
        QVariant var = *lHighScores.value(e);
        qDebug() << "100";
        lPlayer = var.value<PlayerStruct>();
        qDebug() << "102";
        if(lPlayer.playerScore < playerScore)
        {
            for(int j = 4; j > i; j--)
            {
                *lHighScores["player" + QString::number(j)] = *lHighScores.value("player" +
                                                                               QString::number(j - 1));
            }
            lPlayer.playerName = playerName;
            lPlayer.playerScore = playerScore;
            *lHighScores.insert("player" + QString::number(i), QVariant::fromValue(lPlayer));;
            qDebug() << "113";
            setHighScores(lHighScores);
            qDebug() << "115";
            break;
        }
        ++i;
    }

    QSettings lSettings(QSettings::NativeFormat, QSettings::UserScope, "PLLUG", "Pacman");

    lSettings.beginGroup("highScores");
    lSettings.setValue("player0", *getVariantFromHighScoresByKey("player0"));
    lSettings.setValue("player1", *getVariantFromHighScoresByKey("player1"));
    lSettings.setValue("player2", *getVariantFromHighScoresByKey("player2"));
    lSettings.setValue("player3", *getVariantFromHighScoresByKey("player3"));
    lSettings.setValue("player4", *getVariantFromHighScoresByKey("player4"));
    lSettings.endGroup();

    qDebug() << "\nlHighScore:";
    for(auto e : *lHighScores.keys())
    {
        PlayerStruct lPlayer;
        QVariant var;
        var.setValue(*lHighScores.value(e));
        lPlayer = var.value<PlayerStruct>();
        qDebug() << lPlayer.playerName << ", " << lPlayer.playerScore;
    }

    qDebug() << "\nmHighScore:";
    for(auto e : *mHighScores.keys())
    {
        PlayerStruct lPlayer;
        QVariant var;
        var.setValue(lHighScores.value(e));
        lPlayer = var.value<PlayerStruct>();
        qDebug() << lPlayer.playerName << ", " << lPlayer.playerScore;
    }

    delete lHighScores;
}
*/

/*QString Settings::playerNameByKey(QString key) const
{
    return *mHighScores[key].value<PlayerStruct>().playerName;
}

int Settings::playerScoreByKey(QString key) const
{
    return *mHighScores[key].value<PlayerStruct>().playerScore;
}

*/

bool Settings::music() const
{
    return mMusic;
}

bool Settings::fullscreen() const
{
    return mFullscreen;
}

bool Settings::soundEffects() const
{
    return mSoundEffects;
}

int Settings::volume() const
{
    return mVolume;
}

int Settings::difficulty() const
{
    return mDifficulty;
}

QHash<QString, QVariant> *Settings::highScores() const
{
    return mHighScores;
}

void Settings::setMusic(bool music)
{
    if(mMusic != music)
    {
        mMusic = music;
        emit musicChanged(music);
    }
}

void Settings::setSoundEffects(bool soundEffects)
{
    if(mSoundEffects != soundEffects)
    {
        mSoundEffects = soundEffects;
        emit soundEffectsChanged(soundEffects);
    }
}

void Settings::setFullscreen(bool fullscreen)
{
    if(mFullscreen != fullscreen)
    {
        mFullscreen = fullscreen;
        emit fullscreenChanged(fullscreen);
    }
}

void Settings::setVolume(int volume)
{
    if(mVolume != volume)
    {
        mVolume = volume;
        emit volumeChanged(volume);
    }
}

void Settings::setDifficulty(int difficulty)
{
    if(mDifficulty != difficulty)
    {
        mDifficulty = difficulty;
        emit difficultyChanged(difficulty);
    }
}

void Settings::setHighScores(QHash<QString, QVariant> *pHighScores)
{
    mHighScores = pHighScores;
}
