#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QHash>

class QString;
class QVariant;

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
    /*!
     * \brief Settings::loadSettings loads settings for game.
     */
    Q_INVOKABLE void loadSettings();
    /*!
     * \brief Settings::saveSettings saves settings of game.
     */
    Q_INVOKABLE void saveSettings();
    /*!
     * \brief Settings::addScore adds new player's score and name
     *  in mHighScores with sorting.
     * \param playerName name of player to be added
     * \param playerScore score of player to be added
     */
    Q_INVOKABLE void addScore(QString playerName, int playerScore);
    /*!
     * \brief Settings::playerNameByKey returns name of player with key 'key'.
     * \param key - key of certain player
     * \return name of player
     */
    Q_INVOKABLE QString playerNameByKey(QString key) const;
    /*!
     * \brief Settings::playerScoreByKey returns score of player with key 'key'.
     * \param key - key of certain player
     * \return score of player
     */
    Q_INVOKABLE int playerScoreByKey(QString key) const;
    bool music() const;
    bool fullscreen() const;
    bool soundEffects() const;
    int volume() const;
    int difficulty() const;
    QHash<QString, QVariant>* highScores() const;

public slots:
    void setMusic(bool music);
    void setSoundEffects(bool soundEffects);
    void setFullscreen(bool fullscreen);
    void setVolume(int volume);
    void setDifficulty(int difficulty);
    void setHighScores(QHash<QString, QVariant> *pHighScoresHash);

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
    QHash<QString, QVariant> *mHighScores;
};

#endif // SETTINGS_H
