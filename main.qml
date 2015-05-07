import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    MainForm {
        color: "black"
        anchors.fill: parent
        mouseArea.onClicked: {
            Qt.quit();
        }
    }

    Item{
        ItemForButton {
            text: "text"
        }
        x: 10
        y: 10
    }

    Window {

        id: window
        visible: true
        BackButton {

        }
        x: 30
        y: 30
    }

}
