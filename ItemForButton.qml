import QtQuick 2.4

Item {

    id: baseButton

    property alias text: txt.text
    width: txt.width
    height: txt.height

    signal clicked

    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }

    Text {
        id: txt
        color: "white"
        font.family: pacmanFont.name
        font.pointSize: 8
        anchors.centerIn: parent
    }

    MouseArea {
        id: mousearea
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            txt.color = "yellow"
            txt.font.pointSize = 15
        }

        onExited: {
            txt.color = "white"
            txt.font.pointSize = 8
        }

        onClicked:  baseButton.clicked()
    }
}


