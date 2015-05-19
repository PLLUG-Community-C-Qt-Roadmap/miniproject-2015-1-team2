import QtQuick 2.4
import QtQuick.Window 2.2

Item {
    id: ball
    visible: true
    height: 20
    width: 20

    signal clicked

    AnimatedSprite {
        id: ghostAnim
        source: "qrc:images/Images/pacman_sprite.png"
        anchors.centerIn: parent
        frameHeight: 20
        frameWidth: 20
        frameX: 165
        frameY: 160
        width: 20
        height: 20
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            ball.visible = false
            sprite.scale = 1.2
            sprite.eating = 10
            inky.frameX = 0
            inky.frameY = 160
            blinky.frameX = 0
            blinky.frameY = 160
            pinky.frameX = 0
            pinky.frameY = 160
            clyde.frameX = 0
            clyde.frameY = 160
        }
    }
}

