import QtQuick 2.4
import QtQuick.Window 2.2
import PacmanSettings 1.0

Window {

    visible: true
    width: 360
    height: 360
    id: mainWindow

    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }

    // Contains settings for game
    Settings{

        id: settings
    }

    // Loads main menu and menu items
    Loader {
        id : loader
        source : "MainMenu.qml"

        Connections{
            target : loader.item

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
}

