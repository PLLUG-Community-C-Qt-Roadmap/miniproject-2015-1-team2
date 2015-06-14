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
    property alias durUp: up.duration
    property alias durDown: down.duration
    property alias durLeft: left.duration
    property alias durRight: right.duration
    property alias blseq: blinkyseq.running
    property alias inseq: inkyseq.running
    property alias piseq: pinkyseq.running
    property alias clseq: clydeseq.running

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
        to: ghost.y - 300
        running: false
    }

    NumberAnimation on y {
        id: down
        to: ghost.y + 300
        running: false
    }

    NumberAnimation on x {
        id: left
        to: ghost.x - 300
        running: false
    }

    NumberAnimation on x {
        id: right
        to: ghost.x + 300
        running: false
    }

    SequentialAnimation {
        id: blinkyseq
        running: false

        NumberAnimation {
            target: ghost
            property: "x"
            duration: 1500
        }

        NumberAnimation {
            target: ghost
            property: "x"
            to: ghost.x + 30
            duration: 900
        }

        NumberAnimation {
            target: ghost
            property: "y"
            to :ghost.y - 40
            duration: 1200
        }

        NumberAnimation {
            target: ghost
            property: "x"
            to: ghost.x - 40
            duration: 1500
        }
    }

    SequentialAnimation {
        id: inkyseq
        running: false

        NumberAnimation {
            target: ghost
            property: "x"
            duration: 1500
        }

        NumberAnimation {
            target: ghost
            property: "x"
            to: ghost.x + 30
            duration: 900
        }

        NumberAnimation {
            target: ghost
            property: "y"
            to :ghost.y - 60
            duration: 1800
        }

        NumberAnimation {
            target: ghost
            property: "x"
            to: ghost.x - 20
            duration: 1500
        }
    }

    SequentialAnimation {
        id: pinkyseq
        running: false

        NumberAnimation {
            target: ghost
            property: "x"
            duration: 3000
        }

        NumberAnimation {
            target: ghost
            property: "x"
            to: ghost.x - 30
            duration: 900
        }

        NumberAnimation {
            target: ghost
            property: "y"
            to :ghost.y - 40
            duration: 1200
        }

        NumberAnimation {
            target: ghost
            property: "x"
            to: ghost.x + 40
            duration: 1500
        }
    }

    SequentialAnimation {
        id: clydeseq
        running: false

        NumberAnimation {
            target: ghost
            property: "x"
            duration: 3000
        }

        NumberAnimation {
            target: ghost
            property: "x"
            to: ghost.x - 30
            duration: 900
        }

        NumberAnimation {
            target: ghost
            property: "y"
            to :ghost.y - 60
            duration: 1800
        }

        NumberAnimation {
            target: ghost
            property: "x"
            to: ghost.x + 20
            duration: 1500
        }
    }
}
