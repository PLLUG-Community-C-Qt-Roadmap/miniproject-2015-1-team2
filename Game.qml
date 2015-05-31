import QtQuick 2.4
import QtQuick.Window 2.2
import "FieldCollisionAndObjects.js" as Field

Rectangle {
    id: game
    width: 448
    height: 496
    color: "black"

    property int pacmanSpawnX : 4
    property int pacmanSpawnY : 14 * 16 - 4

    // Map implemantation
    Image {
        source: "qrc:/images/Images/field.png"

        anchors.fill: parent

        GridView{
            id: idField
            interactive: false
            anchors.fill: parent
            cellHeight: Field.tiles["tileheight"]
            cellWidth: Field.tiles["tilewidth"]
            delegate: fieldDelegate
            model: TileField.tilesNumber()
        }

        Component {
            id: fieldDelegate
            Item {
                width: idField.cellWidth;
                height: idField.cellHeight

                Image{
                    anchors.fill: parent
                    source: TileField.tileHasDot(index) ? "qrc:/images/Images/dot.png" : TileField.tileHasEnergizer(index) ? "qrc:/images/Images/energizer.png" : ""
                    visible: !TileField.tileIsWall(index) || !TileField.tileIsEmptyPass(index)
                }
            }
        }
    }

    ItemForButton {
        text:"Up"
        onClicked: {
            sprite.rotation =  270
            eating.running = true
            up.running = true
            down.running = false
            left.running = false
            right.running = false
        }
        x: 150
        y: 280
    }

    ItemForButton {
        text:"Down"
        onClicked: {
            sprite.rotation = 90
            eating.running = true
            up.running = false
            down.running = true
            left.running = false
            right.running = false
        }
        x: 150
        y: 320
    }

    ItemForButton {
        text:"Right"
        onClicked: {
            sprite.rotation = 0
            eating.running = true
            up.running = false
            down.running = false
            left.running = false
            right.running = true
        }

        x: 180
        y: 300
    }

    ItemForButton {
        text:"Left"
        onClicked: {
            sprite.rotation = 180
            eating.running = true
            up.running = false
            down.running = false
            left.running = true
            right.running = false
        }
        x: 120
        y: 300
    }

    Item {
        id: sprite
        width: 24
        height: 24
        x: game.pacmanSpawnX
        y: game.pacmanSpawnY
        visible: true
        rotation: 0
        property alias eating: eating.frameDuration

        AnimatedSprite {
            id: eating
            source: "qrc:images/PacmanSprite.png"
            anchors.fill: sprite
            frameHeight: 32
            frameWidth: 32
            running: true
            frameCount: 18
            frameDuration: 18
            width: 24
            height: 24

            Component.onCompleted: {
                right.start()
            }
        }

        NumberAnimation on y {
            id: up
            to: sprite.y - 4
            duration: 100
            running: false

            onStopped: {

                TileField.checkPacmanState(sprite.x + 12, sprite.y + 12, "up") === 1 ?
                            console.log("Stopped!") : up.start();
            }
        }

        NumberAnimation on y {
            id: down
            to: sprite.y + 4
            duration: 100
            running: false

            onStopped: {

                TileField.checkPacmanState(sprite.x + 12, sprite.y + 12, "down") === 1 ?
                            console.log("Stopped!") : down.start();
            }
        }

        NumberAnimation on x {
            id: left
            to: sprite.x - 4
            duration: 100
            running: false

            onStopped: {

                TileField.checkPacmanState(sprite.x + 12, sprite.y + 12, "left") === 1 ?
                            console.log("Stopped!") : left.start();
            }
        }

        NumberAnimation on x {
            id: right
            to: sprite.x + 4
            duration: 100
            running: false

            onStopped: {

                TileField.checkPacmanState(sprite.x + 12, sprite.y + 12, "right") === 1 ?
                            console.log("Stopped!") : right.start();
            }
        }
    }

    ItemForGhost {
        id: blinky
        x: game.width / 2 - 30
        y: game.height / 2 - 25
        frameX: 0
        frameY: 80
        speed: 100
    }

    ItemForGhost {
        id: pinky
        x: game.width / 2 + 30
        y: game.height / 2 - 25
        frameX: 0
        frameY: 100
        speed: 200
    }

    ItemForGhost {
        id: inky
        x: game.width / 2 - 30
        y: game.height / 2 - 5
        frameX: 0
        frameY: 120
        speed: 150
    }
    ItemForGhost {
        id: clyde
        x: game.width / 2 + 30
        y: game.height / 2 - 5
        frameX: 0
        frameY: 140
        speed: 300
    }


    KillGhosts {
        x: 100
        y: 100
    }

    ItemForButton {
        text: "Back"
        onClicked: {
            loader.source = "MainMenu.qml"
            introMusic.stop()
            settings.music ? gameMusic.play() : gameMusic.stop()
        }
        x: 35
        y: game.height - 30
    }

    ItemForButton {
        text: "Pause"
        onClicked: {
            introMusic.stop()
            up.running = false
            down.running = false
            left.running = false
            right.running = false

            inky.moveUp = false
            inky.moveDown = false
            inky.moveLeft = false
            inky.moveRight = false

            pinky.moveUp = false
            pinky.moveDown = false
            pinky.moveLeft = false
            pinky.moveRight = false

            blinky.moveUp = false
            blinky.moveDown = false
            blinky.moveLeft = false
            blinky.moveRight = false

            clyde.moveUp = false
            clyde.moveDown = false
            clyde.moveLeft = false
            clyde.moveRight = false
        }
        x:20
        y: 20
    }

    Keys.onUpPressed: {
        sprite.rotation =  270
        up.running = true
        down.running = false
        left.running = false
        right.running = false
    }

    Keys.onDownPressed:{
        sprite.rotation = 90
        up.running = false
        down.running = true
        left.running = false
        right.running = false
    }

    Keys.onLeftPressed: {
        sprite.rotation = 180
        up.running = false
        down.running = false
        left.running = true
        right.running = false
    }

    Keys.onRightPressed: {
        sprite.rotation = 0
        up.running = false
        down.running = false
        left.running = false
        right.running = true
    }

    focus: true
}
