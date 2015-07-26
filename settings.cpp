#include "settings.h"
#include <QSettings>
#include <QVariant>
#include <QDataStream>
#include <QString>
#include <QDebug>

/*!
 * \brief The PlayerStruct struct contains information
 * about one player.
 */
struct PlayerStruct{
    QString playerName;
    int playerScore;
};

Q_DECLARE_METATYPE(PlayerStruct)

/*!
 * \brief operator << inputs PlayerStruct 'player' to 'stream'.
 * \param stream - input stream
 * \param player - struct to be inputed to stream
 * \return input stream
 */
QDataStream& operator<< (QDataStream &stream, const PlayerStruct &player)
{
    stream << player.playerName << player.playerScore;
    return stream;
}

/*!
 * \brief operator >> outputs PlayerStruct from 'stream' to 'player'.
 * \param stream - output stream
 * \param player - struct, where 'stream' outputs PlayerStruct
 * \return output stream
 */
QDataStream& operator>> (QDataStream &stream, PlayerStruct &player)
{
    stream >> player.playerName;
    stream >> player.playerScore;
    return stream;
}

Settings::Settings(QObject *parent) : QObject(parent)
{
    qRegisterMetaTypeStreamOperators<PlayerStruct>("PlayerStruct");
    loadSettings();
}

Settings::~Settings()
{
    delete mHighScores;
}

void Settings::loadSettings()
{
    QSettings lSettings(QSettings::NativeFormat,
                        QSettings::UserScope, "PLLUG", "Pacman");
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

    setMusic(lMusic);
    setSoundEffects(lSoundEffects);
    setFullscreen(lFullscreen);
    setVolume(lVolume);
    setDifficulty(lDifficulty);
    setHighScores(lHighScores);
}

void Settings::saveSettings()
{
    QSettings lSettings(QSettings::NativeFormat,
                        QSettings::UserScope, "PLLUG", "Pacman");
    lSettings.beginGroup("options");
    lSettings.setValue("music", music());
    lSettings.setValue("soundEffects", soundEffects());
    lSettings.setValue("fullscreen", fullscreen());
    lSettings.setValue("volume", volume());
    lSettings.setValue("difficulty", difficulty());
    lSettings.endGroup();
}

void Settings::addScore(QString playerName, int playerScore)
{
    QHash<QString, QVariant> *lHighScores = new QHash<QString, QVariant>();
    *lHighScores = *mHighScores;
    int i = 0;

    for(auto key : lHighScores->keys())
    {
        PlayerStruct lPlayer;
        QVariant var = lHighScores->value(key);
        lPlayer = var.value<PlayerStruct>();
        if(lPlayer.playerScore < playerScore)
        {
            for(int j = 4; j > i; j--)
            {
                QString lKey = "player" + QString::number(j);
                QString lPreviousKey = "player" + QString::number(j - 1);
                QVariant lValue = lHighScores->value(lPreviousKey);
                lHighScores->insert(lKey, lValue);
            }
            lPlayer.playerName = playerName;
            lPlayer.playerScore = playerScore;
            lHighScores->insert("player" + QString::number(i),
                                QVariant::fromValue(lPlayer));
            setHighScores(lHighScores);
            break;
        }
        ++i;
    }

    QSettings lSettings(QSettings::NativeFormat,
                        QSettings::UserScope, "PLLUG", "Pacman");
    lSettings.beginGroup("highScores");
    lSettings.setValue("player0", highScores()->value("player0"));
    lSettings.setValue("player1", highScores()->value("player1"));
    lSettings.setValue("player2", highScores()->value("player2"));
    lSettings.setValue("player3", highScores()->value("player3"));
    lSettings.setValue("player4", highScores()->value("player4"));
    lSettings.endGroup();
}

QString Settings::playerNameByKey(QString key) const
{
    return mHighScores->value(key).value<PlayerStruct>().playerName;
}

int Settings::playerScoreByKey(QString key) const
{
    return mHighScores->value(key).value<PlayerStruct>().playerScore;
}

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
    if(pHighScores != mHighScores)
    {
        delete mHighScores;
        mHighScores = pHighScores;
    }
}
