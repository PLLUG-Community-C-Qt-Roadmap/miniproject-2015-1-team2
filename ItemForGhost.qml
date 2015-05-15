import QtQuick 2.4

Item {
    id: ghost
    visible: true
    property alias frameY: ghostAnim.frameY
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
        source: "qrc:images/Images/pacman_characters.png"
        anchors.centerIn: parent
        frameHeight: 128
        frameWidth: 128
        running: true
        frameCount: 8
        width: 128
        height: 128
        scale: 0.3
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
