import QtQuick 2.4
import QtQuick.Window 2.2

Window {

    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
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

