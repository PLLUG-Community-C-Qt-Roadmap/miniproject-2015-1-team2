#include "settings.h"
#include <QSettings>

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

    bool lMusic = lSettings.value("music", true).toBool();
    bool lSoundEffects = lSettings.value("soundEffects", true).toBool();
    bool lFullscreen = lSettings.value("fullscreen", false).toBool();
    int lVolume = lSettings.value("volume", 50).toInt();
    int lDifficulty = lSettings.value("difficulty", 1).toInt();
    HighScoresMap lHighScores = lSettings.value("high_scores").toMap();

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

