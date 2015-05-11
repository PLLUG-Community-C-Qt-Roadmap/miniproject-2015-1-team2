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
        id: sprite
        x: txt.x - 20
        y: 5
        z: 2
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

        PropertyAnimation {
            id: proanim
            target: sprite
            property: "x"
            from: txt.x - 20
            to: txt.x + txt.width + 30
            duration: 1000
            loops: 1
            running: false

            onStopped: {
                baseButton.clicked()
            }
        }
    }

    Rectangle {
        id: blackrec
        z:1
        width: 0
        height: 35
        color: "black"
        x: txt.x - 25
        y: txt.y - 15
        visible: true
        NumberAnimation on width {
            id: numanim
            from: 0
            to: txt.width + 50
            duration: 1000
            running: false
        }
    }

    MouseArea {
        id: mousearea
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            txt.color = "yellow"
            txt.font.pointSize = 15
            sprite.visible = true
        }

        onExited: {
            txt.color = "white"
            txt.font.pointSize = 8
           sprite.visible = false
        }

        onClicked: {
            proanim.running = true
            numanim.running = true
        }
    }
}


