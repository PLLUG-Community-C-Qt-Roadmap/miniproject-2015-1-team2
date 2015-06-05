import QtQuick 2.4
import QtQuick.Window 2.2
import "FieldCollisionAndObjects.js" as Field

Rectangle {
    id: game
    width: 448
    height: 526
    color: "black"

    property int pacmanSpawnX : 4
    property int pacmanSpawnY : 14 * 16 - 4

    // Map implemantation
    Image {
        source: "qrc:/images/Images/field.png"

        width: 448
        height: 496
        anchors{
            right: parent.right
            left: parent.left
            top: parent.top
        }

        GridView{
            id: idField
            width: 448
            height: 496
            interactive: false
            anchors{
                right: parent.right
                left: parent.left
                top: parent.top
            }

            cellHeight: Field.tiles["tileheight"]
            cellWidth: Field.tiles["tilewidth"]
            model: TileField.tilesNumber()
            delegate: Item {
                width: idField.cellWidth;
                height: idField.cellHeight
                objectName: "objectOnMap" + model.index

                Image{
                    objectName: "myImg"
                    anchors.fill: parent
                    cache: false
                    source: TileField.tileHasDot(index) ?
                                "qrc:/images/Images/dot.png" : TileField.tileHasEnergizer(index) ?
                                    "qrc:/images/Images/energizer.png" :
                                    TileField.tileHasFruit(index) ? "qrc:/images/Images/fruit.png" : ""
                    visible: !TileField.tileIsWall(index) || !TileField.tileIsEmptyPass(index)
                }
            }
        }
    }

    GameScoreItem {
        id: scoreItem

        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
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
        signal dotEaten()
        signal energizerEaten()
        signal fruitEaten()

        function increaseScoreBy(number){

            var newNumber = parseInt(scoreItem.scoreText, "10") + number
            var s = "0000" + newNumber;
            scoreItem.scoreText = s.substr(s.length-4);
        }

        function eatObject(index, rotation, objectType){
            for(var i = index - 1; i < index + 1; ++i) {
                var item = idField.contentItem.children[i];
                if (!item.objectName.localeCompare("objectOnMap" + index)){
                    for(var j = 0; j < idField.contentItem.children.length; ++j) {
                        var image = item.children[j];
                        if (!image.objectName.localeCompare("myImg")){
                            image.visible = false
                            switch(rotation){
                            case "right":
                                right.start();
                                break;
                            case "left":
                                left.start();
                                break;
                            case "up":
                                up.start();
                                break;
                            case "down":
                                down.start();
                                break;
                            default:
                                console.log("Bad input!!!");
                            }

                            break;
                        }
                    }
                }
            }

            switch(objectType){
            case "dot":
                dotEaten()
                break;
            case "fruit":
                fruitEaten()
                break;
            case "energizer":
                energizerEaten()
                break;
            }
        }

        function checkPacmanState(rotation){
            TileField.checkPacmanState(sprite.x + 12, sprite.y + 12, rotation)
            var result = TileField.operIndexList()
            var oper = result[0]
            var index = result[1]

            switch(oper){
            case 1:
                switch(rotation){
                case "right":
                    right.start();
                    break;
                case "left":
                    left.start();
                    break;
                case "up":
                    up.start();
                    break;
                case "down":
                    down.start();
                    break;
                }
                break;
            case 2:
                sprite.eatObject(index, rotation, "dot")
                break;
            case 3:
                sprite.eatObject(index, rotation, "energizer")
                break;
            case 4:
                sprite.eatObject(index, rotation, "fruit")
                break;
            }
        }

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
                sprite.checkPacmanState("up");
            }
        }

        NumberAnimation on y {
            id: down
            to: sprite.y + 4
            duration: 100
            running: false

            onStopped: {
                sprite.checkPacmanState("down");
            }
        }

        NumberAnimation on x {
            id: left
            to: sprite.x - 4
            duration: 100
            running: false

            onStopped: {
                sprite.checkPacmanState("left");
            }
        }

        NumberAnimation on x {
            id: right
            to: sprite.x + 4
            duration: 100
            running: false

            onStopped: {
                sprite.checkPacmanState("right");
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

    Connections {
        target: sprite

        onDotEaten: {
            sprite.increaseScoreBy(10)
            settings.soundEffects ? dotEatenMusic.play() : dotEatenMusic.stop()
        }

        onEnergizerEaten: {
            sprite.increaseScoreBy(40)
            settings.soundEffects ? fruitEnergizerEatenMusic.play() : fruitEnergizerEatenMusic.stop()
        }

        onFruitEaten: {
            sprite.increaseScoreBy(200)
            settings.soundEffects ? fruitEnergizerEatenMusic.play() : fruitEnergizerEatenMusic.stop()
        }
    }
}
