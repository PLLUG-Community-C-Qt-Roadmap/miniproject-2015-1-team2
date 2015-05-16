#include "settings.h"
#include <QSettings>

Settings::Settings(QObject *parent) : QObject(parent)
{
    mSettings = new QSettings(QSettings::NativeFormat, QSettings::UserScope, "", "Pacman");
}

Settings::~Settings()
{
    delete mSettings;
}

void Settings::loadSettings()
{

}

void Settings::saveSettings()
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

QString Settings::difficulty() const
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

void Settings::setDifficulty(QString difficulty)
{
    if(mDifficulty == difficulty)
    {
        return;
    }

    mDifficulty = difficulty;
    emit difficultyChanged(difficulty);

}

