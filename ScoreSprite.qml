import QtQuick 2.4

Item
{
    property alias frameX: scoresprite.frameX

    z:2

    AnimatedSprite {
        id: scoresprite
        source: "qrc:/images/Images/pacman_sprite.png"
        anchors.centerIn: parent
        frameHeight: 20
        frameWidth: 20
        frameY: 220
        running: false
        frameCount: 2
        width: 20
        height: 20
        scale: 1.5
    }

    Timer {
        interval: 3000
        running: true
        onTriggered: {
            parent.destroy();
        }
    }
}
