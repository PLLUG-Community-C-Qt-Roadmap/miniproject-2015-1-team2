import QtQuick 2.0

Rectangle {
    property alias scoreText: txtScore.text

    width: 100
    height: 30
    color: "black"

    FontLoader {
        id: scoreFont
        source: "qrc:/font/Font/score.ttf"
    }

    Text {
        id: txtScore
        text: "0000"
        color: "white"
        font {
            family: scoreFont.name
            pointSize: 14
        }
        anchors.centerIn: parent
    }
}

