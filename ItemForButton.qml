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

    Item {
        id: animspr
        x: txt.x - 20
        y: 5
        z: 1
        visible: false

        AnimatedSprite {
            source: "qrc:images/PacmanSprite.png"
            anchors.centerIn: parent
            frameHeight: 32
            frameWidth: 32
            running: true
            frameCount: 18
            frameDuration: 18
            width: 32
            height: 32

        }
    }

    MouseArea {
        id: mousearea
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            txt.color = "yellow"
            txt.font.pointSize = 15
            animspr.visible = true
        }

        onExited: {
            txt.color = "white"
            txt.font.pointSize = 8
            animspr.visible = false
        }

        onClicked:  baseButton.clicked()
    }
}


