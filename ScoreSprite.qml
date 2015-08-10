import QtQuick 2.4

Item
{
    AnimatedSprite {
        id: scoresprite
        source: "qrc:/images/Images/pacman_sprite.png"
        anchors.centerIn: parent
        frameHeight: 20
        frameWidth: 20
        frameX: 0
        frameY: 220
        running: false
        frameCount: 2
        width: 20
        height: 20
        scale: 1.5
    }

    Timer {
        interval: 5000
        running: true
        onTriggered: {
            parent.destroy();
        }
    }
}
