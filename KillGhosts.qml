import QtQuick 2.4
import QtQuick.Window 2.2

Item {
    id: ball
    visible: true
    height: 39
    width: 39

    signal clicked

    AnimatedSprite {
        id: ghostAnim
        source: "qrc:images/Images/pacman_characters.png"
        anchors.centerIn: parent
        frameHeight: 128
        frameWidth: 128
        frameX: 768
        width: 128
        height: 128
        scale: 0.3
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            ball.visible = false
            sprite.scale = 1.2
            sprite.eating = 10
        }
    }
}

