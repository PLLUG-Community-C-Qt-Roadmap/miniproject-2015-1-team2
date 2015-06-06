import QtQuick 2.4

Item {

    id: baseButton

    property alias text: txt.text
    width: 70
    height: 20

    signal clicked

    Text {
        id: txt
        color: "white"
        font.family: pacmanFont.name
        font.pointSize: 8
        anchors.centerIn: parent
    }

    MouseArea {
        id: mousearea1
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            txt.color = "yellow"
        }

        onExited: {
            txt.color = "white"
        }

        onClicked: {
            baseButton.clicked()
        }
    }
}
