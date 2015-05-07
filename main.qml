import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }
    visible: true

    MainForm {
        anchors.fill: parent
        color: "black"
        mouseArea.onClicked: {
            Qt.quit();
        }
    }

    Item{
        ItemForButton {
            text: "text"
            onClicked: {
                highscores.show();
            }
        }
        x: 10
        y: 10

        HighScores{
            id: highscores
        }
    }

}
