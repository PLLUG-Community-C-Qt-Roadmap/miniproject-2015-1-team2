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
    bool lFullscreen = lSettings.value("fullscreen", true).toBool();
    int lVolume = lSettings.value("volume", 50).toInt();
    int lDifficulty = lSettings.value("difficulty", 1).toInt();

    setMusic(lMusic);
    setSoundEffects(lSoundEffects);
    setFullscreen(lFullscreen);
    setVolume(lVolume);
    setDifficulty(lDifficulty);
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

void Settings::setMusic(bool music)
{
    if(mMusic == music)
    {
        return;
    }

    mMusic = music;
    emit musicChanged(music);
}

void Settings::setSoundEffects(bool soundEffects)
{
    if(mSoundEffects == soundEffects)
    {
        return;
    }

    mSoundEffects = soundEffects;
    emit soundEffectsChanged(soundEffects);
}

void Settings::setFullscreen(bool fullscreen)
{
    if(mFullscreen == fullscreen)
    {
        return;
    }

    mFullscreen = fullscreen;
    emit fullscreenChanged(fullscreen);
}

void Settings::setVolume(int volume)
{
    if(mVolume == volume)
    {
        return;
    }

    mVolume = volume;
    emit volumeChanged(volume);

}

void Settings::setDifficulty(int difficulty)
{
    if(mDifficulty == difficulty)
    {
        return;
    }

    mDifficulty = difficulty;
    emit difficultyChanged(difficulty);

}

