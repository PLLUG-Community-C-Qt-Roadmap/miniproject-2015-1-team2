import QtQuick 2.4

Item {

    FontLoader {
        id: pacmanFont
        source: "qrc:/font/Font/PAC-FONT.TTF"
    }

    Text {
        id: txt
        color: "yellow"
        text: "PACMAN"
        font.family: pacmanFont.name
        font.pointSize: 30
        anchors.centerIn: parent
    }

}

