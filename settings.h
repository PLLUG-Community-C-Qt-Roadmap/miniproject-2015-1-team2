#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>

class QString;
class QSettings;

class Settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool music READ music WRITE setMusic NOTIFY musicChanged)
    Q_PROPERTY(bool soundEffects READ soundEffects WRITE setSoundEffects NOTIFY soundEffectsChanged)
    Q_PROPERTY(bool fullscreen READ fullscreen WRITE setFullscreen NOTIFY fullscreenChanged)
    Q_PROPERTY(int volume READ volume WRITE setVolume NOTIFY volumeChanged)
    Q_PROPERTY(int difficulty READ difficulty WRITE setDifficulty NOTIFY difficultyChanged)

public:
    explicit Settings(QObject *parent = 0);
    ~Settings();
    Q_INVOKABLE void loadSettings();
    Q_INVOKABLE void saveSettings();
    bool music() const;
    bool fullscreen() const;
    bool soundEffects() const;
    int volume() const;
    int difficulty() const;

public slots:
    void setMusic(bool music);
    void setSoundEffects(bool soundEffects);
    void setFullscreen(bool fullscreen);
    void setVolume(int volume);
    void setDifficulty(int difficulty);

signals:
    void musicChanged(bool music);
    void soundEffectsChanged(bool soundEffects);
    void fullscreenChanged(bool fullscreen);
    void volumeChanged(int volume);
    void difficultyChanged(int difficulty);

private:
    bool mMusic;
    bool mSoundEffects;
    bool mFullscreen;
    int mVolume;
    int mDifficulty;
};

#endif // SETTINGS_H
