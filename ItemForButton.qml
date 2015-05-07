import QtQuick 2.4

Rectangle {
    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }
    property alias text: txt.text
    width: 100
    height: 20
    radius: 10
    color: "black"
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
    }
}


