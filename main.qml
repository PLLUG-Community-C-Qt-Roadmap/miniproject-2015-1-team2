import QtQuick 2.4
import QtQuick.Window 2.2

Window {

    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }

    FontLoader {
        id: inputPacmanFont
        source: "qrc:/font/Font/kirbyss.ttf"
    }

    // Loads main menu on start
    Loader {
        id : mainMenuLoader
        source : "MainMenu.qml"
        onLoaded: {
            item.show()
        }

    }

    // Loads menu items
    Loader {
        id : itemLoader

        onLoaded: {
            item.show()
        }

    }

}

