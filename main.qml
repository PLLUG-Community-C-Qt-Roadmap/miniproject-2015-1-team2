import QtQuick 2.4
import QtQuick.Window 2.2
import PacmanSettings 1.0

Window {

    visible: true
    width: 360
    height: 360
    id: mainWindow

    property alias loaderItem : loader.item

    signal optionsLoaded()

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

        onLoaded: {

            if(source.toString().localeCompare("Options.qml"))
            {
               mainWindow.optionsLoaded()
            }
        }


    }

    // Loader only for Exit!
    Loader {
        anchors.centerIn: parent
        id: loaderForExitWindow
    }
}

