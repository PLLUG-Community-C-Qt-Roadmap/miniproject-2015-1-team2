import QtQuick 2.0

Item {

    id : levelItem

    property alias level : difficultyText.text

    height: 20

    Row {


        Text {
            id: labelForLevel
            color: "yellow"
            font.family: pacmanFont.name
            font.pointSize: 15
            text: "Difficulty"
        }

        Item {

            id : comboBox

            x: labelForLevel.x + 200

            Row {


                Rectangle {

                    id: triangleContainer

                    width : 30
                    height: 30
                    color : "black"

                    signal clicked()

                    Image {

                        id: triangle

                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter

                        cache: false

                        width : parent.width
                        height: parent.height

                        source: "qrc:/images/Images/Triangle.png"
                    }

                    MouseArea {

                        id: rectangleMouseArea

                        anchors.fill: parent
                        hoverEnabled: true

                        onEntered: {

                             triangle.source =
                                "qrc:/images/Images/Yellow_Triangle.png"
                        }

                        onExited: {

                            triangle.source =
                                "qrc:/images/Images/Triangle.png"
                        }

                        onPressed: {

                            triangle.width = parent.width - 5
                            triangle.height = parent.height - 5
                            }

                        onReleased: {

                            triangle.width = parent.width
                            triangle.height = parent.height
                        }

                        onClicked: {

                            triangleContainer.clicked()
                        }

                    }
                }

                Rectangle {

                    id: difficulty

                    color: "black"

                    property var levels : ["Easy", "Normal", "Hard"]
                    property int currentLevel : 0

                    width : 80
                    height: 30

                    border {
                        color: "white"
                        width: 1
                    }

                    Text {

                        id: difficultyText

                        text: difficulty.levels[difficulty.currentLevel]
                        font.family: pacmanFont.name
                        color: "white"
                        font.pointSize: 8
                        anchors.centerIn: parent
                    }
                }


                Rectangle {

                    id: reverseTriangleContainer

                    width : 30
                    height: 30

                    signal clicked()

                    color : "black"

                    Image {

                        id: reverseTriangle

                        width : parent.width
                        height: parent.height

                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter

                        cache: false

                        source: "qrc:/images/Images/Triangle.png"
                        mirror: true
                    }

                    MouseArea {

                        id: reverseRectangleMouseArea

                        anchors.fill: parent
                        hoverEnabled: true

                        onEntered: {

                             reverseTriangle.source =
                                "qrc:/images/Images/Yellow_Triangle.png"
                        }

                        onExited: {

                            reverseTriangle.source =
                                "qrc:/images/Images/Triangle.png"
                        }

                        onPressed: {

                            reverseTriangle.width = parent.width - 5
                            reverseTriangle.height = parent.height - 5
                            }

                        onReleased: {

                            reverseTriangle.width = parent.width
                            reverseTriangle.height = parent.height
                        }

                        onClicked: {

                            reverseTriangleContainer.clicked()
                        }


                    }

                }

            }
        }

    }

    Connections {

        target: triangleContainer

        onClicked : {

            if(difficulty.currentLevel === 0)
            {
                difficulty.currentLevel = 2
            }
            else
            {
                difficulty.currentLevel = difficulty.currentLevel -1
            }

            difficultyText.text = difficulty.levels[difficulty.currentLevel]

        }

    }

    Connections {

        target: reverseTriangleContainer

        onClicked : {

            if(difficulty.currentLevel === 2)
            {
                difficulty.currentLevel = 0
            }
            else
            {
                difficulty.currentLevel = difficulty.currentLevel + 1
            }

            difficultyText.text = difficulty.levels[difficulty.currentLevel]

        }

    }

}

