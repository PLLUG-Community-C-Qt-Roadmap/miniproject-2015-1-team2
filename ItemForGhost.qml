import QtQuick 2.4

Item {
    id: ghost
    visible: true
    property alias frameY: ghostAnim.frameY
    property alias frameX: ghostAnim.frameX
    property alias running: ghostAnim.running
    property alias speed: ghostAnim.frameDuration
    property alias moveUp: up.running
    property alias moveDown: down.running
    property alias moveLeft: left.running
    property alias moveRight: right.running

    AnimatedSprite {
        id: ghostAnim
        source: "qrc:/images/Images/pacman_sprite.png"
        anchors.centerIn: parent
        frameHeight: 20
        frameWidth: 20
        running: false
        frameCount: 2
        width: 20
        height: 20
        scale: 1.5
    }

    NumberAnimation on y {
        id: up
        to: ghost.y - 200
        duration: 3000
        running: false
    }

    NumberAnimation on y {
        id: down
        to: ghost.y + 200
        duration: 3000
        running: false
    }

    NumberAnimation on x {
        id: left
        to: ghost.x - 200
        duration: 3000
        running: false
    }

    NumberAnimation on x {
        id: right
        to: ghost.x + 200
        duration: 3000
        running: false
    }

}
