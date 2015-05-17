import QtQuick 2.4
import QtQuick.Window 2.2
import PacmanSettings 1.0
import QtMultimedia 5.0

Window {

    visible: true
    width: 360
    height: 360
    id: mainWindow

    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }

    Audio {
            id: gameMusic
            source: "qrc:/music/Music/Dendy_Music.wav"
            loops: Audio.Infinite
    }

    // Contains settings for game
    Settings{

        id: settings

        Component.onCompleted: {

            mainWindow.visibility =  settings.fullscreen ? Window.FullScreen : Window.Windowed
            settings.music ? gameMusic.play() : gameMusic.stop()
            gameMusic.volume = settings.volume / 100
        }
    }

    // Loads main menu and menu items
    Loader {
        id : loader
        source : "MainMenu.qml"

        anchors.fill: parent

        Connections{
            target : loader.item

            ignoreUnknownSignals: true

            onOptionsClosed: {

                settings.saveSettings()
            }

            onDifficultyChanged: {

                settings.setDifficulty(changedLevel)
            }

            onVolumeChanged: {

                settings.setVolume(changedVolume)
            }

            onFullscreenChanged: {

                settings.setFullscreen(changedFullscreen)
            }

            onMusicChanged: {

                settings.setMusic(changedMusic)
            }

            onSoundEffectsChanged: {

                settings.setSoundEffects(changedSoundEffects)
            }
        }
    }

    // Loader only for Exit!
    Loader {
        anchors.centerIn: parent
        id: loaderForExitWindow
    }

    Connections {

        target : settings

        onFullscreenChanged: {

            mainWindow.visibility =  settings.fullscreen ? Window.FullScreen : Window.Windowed
        }

        onDifficultyChanged: {


        }

        onVolumeChanged: {

            gameMusic.volume = settings.volume / 100
        }

        onMusicChanged: {

            settings.music ? gameMusic.play() : gameMusic.stop()
        }

        onSoundEffectsChanged: {


        }
    }
}

