import QtQuick 2.4

Item {
    id: ghost
    visible: true
    property alias frameY: ghostAnim.frameY
    property alias frameX: ghostAnim.frameX
    property alias speed: ghostAnim.frameDuration
    property alias x1Anim: ghostX.from
    property alias x2Anim: ghostX.to
    property alias animX: ghostX.running
    property alias y1Anim: ghostY.from
    property alias y2Anim: ghostY.to
    property alias animY: ghostY.running
    property alias timeY: ghostY.duration
    property alias timeX: ghostX.duration

    AnimatedSprite {
        id: ghostAnim
        source: "qrc:/images/Images/pacman_sprite.png"
        anchors.centerIn: parent
        frameHeight: 20
        frameWidth: 20
        running: true
        frameCount: 2
        width: 20
        height: 20
        scale: 1.5
    }

    PropertyAnimation {
        id: ghostX
        target: ghost
        properties: "x"
        loops: 1
        running: false
    }

    PropertyAnimation {
        id: ghostY
        target: ghost
        properties: "y"
        loops: 1
        running: false
    }

}
