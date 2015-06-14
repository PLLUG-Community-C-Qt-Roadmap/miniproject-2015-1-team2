#include "settings.h"
#include <QSettings>
#include <QVariant>

Q_DECLARE_METATYPE(PlayerStruct)

struct PlayerStruct{

    QString playerName;
    int playerScore;
};

Settings::Settings(QObject *parent) : QObject(parent)
{
    loadSettings();
}

Settings::~Settings()
{
}

void Settings::loadSettings()
{
    QSettings lSettings(QSettings::NativeFormat, QSettings::UserScope, "PLLUG", "Pacman");

    lSettings.beginGroup("options");

    // Making default QMap
    // with 5 elements: name = "Player", score = "0"
    PlayerStruct lPlayerStruct;
    lPlayerStruct.playerName = "Player";
    lPlayerStruct.playerScore = 0;
    QVariant variant;
    variant.setValue(lPlayerStruct);
    QVariantMap variantMap;
    for(int i = 0; i < 5; i++)
    {
        variantMap.insert(QString::number(i), variant);
    }

    bool lMusic = lSettings.value("music", true).toBool();
    bool lSoundEffects = lSettings.value("soundEffects", true).toBool();
    bool lFullscreen = lSettings.value("fullscreen", false).toBool();
    int lVolume = lSettings.value("volume", 50).toInt();
    int lDifficulty = lSettings.value("difficulty", 1).toInt();
    HighScoresMap lHighScores = lSettings.value("high_scores", variantMap).toMap();

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
    lSettings.setValue("high_scores", highScores());
}

void Settings::addScore(QString playerName, int playerScore)
{

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

HighScoresMap Settings::highScores() const
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

void Settings::setHighScores(const HighScoresMap pMap)
{
    if(mHighScores != pMap)
    {
        mHighScores = pMap;
        emit highScoresChanged(pMap);
    }
}

