import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }
    visible: true
    /*MainForm {
        anchors.fill: parent
        mouseArea.onClicked: {
            Qt.quit();
        }
    }*/

    Item{
        ItemForButton {
            text: "text"
        }
        x: 10
        y: 10
    }
}
