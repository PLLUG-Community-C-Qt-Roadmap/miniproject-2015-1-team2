import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.3

Rectangle {
    id: newGameWindow

    width: 360
    height: 360
    color: "black"

    FontLoader {
        id: inputPacmanFont
        source: "qrc:/font/Font/kirbyss.ttf"
    }

    Rectangle{
        id: rectBackground

        anchors.fill: parent
        color: "black"

        MouseArea {
            z: 1
            anchors.fill: parent
            onClicked: parent.forceActiveFocus();
        }
    }

    Rectangle {
        id: enterUserRect

        width: labelEnterName.width
        height: labelEnterName.height + buttonPlay.height + buttonPlay.anchors.topMargin
        x: (parent.width / 2) - (width / 2)
        y: (parent.height / 2) - height

        color: "black"

        Text{
            id: labelEnterName

            font.family: pacmanFont.name;
            font.pointSize: 16
            color: "#29FF29"
            text: "EnTeR yOuR nAmE"
        }

        TextField{
            id: textFieldPlayer

            height: 40
            anchors.verticalCenter: buttonPlay.verticalCenter
            anchors.right: buttonPlay.left
            anchors.left: parent.left
            anchors.rightMargin: 10

            font.family: inputPacmanFont.name;
            font.pointSize: 18

            style: TextFieldStyle {

                textColor: "black"

                background: Rectangle {

                    radius: 7
                    border.color: textFieldPlayer.activeFocus ? "blue" : "black"
                    border.width: 2
                }
            }

        }

        Image{
            id: buttonPlay

            anchors.right: parent.right
            anchors.top:  labelEnterName.bottom
            anchors.topMargin: 20
            width: 50
            height: 50
            opacity: 1.0

            source: "qrc:images/Images/Start.png"

            SequentialAnimation {
                id: sequentialOpacity
                running: false

                NumberAnimation {
                    id: animateOpacity
                    target: buttonPlay
                    properties: "opacity"
                    from: .2
                    to: 1
                    duration: 500
                    easing {type: Easing.InOutQuad; }
                }
                NumberAnimation {
                    id: animateOpacity2
                    target: buttonPlay
                    properties: "opacity"
                    to: .2
                    from: 1
                    duration: 500
                    easing {type: Easing.InOutQuad;}
                }
                loops: Animation.Infinite
            }

            MouseArea {
                id: playButtonMouseArea
                anchors.fill: parent
                hoverEnabled: true

                onEntered: {
                    sequentialOpacity.start()
                }
                onExited: {
                    sequentialOpacity.stop()
                    buttonPlay.opacity = 1
                }
            }
        }
    }

    Item {
            ItemForButton {
                id: buttonBack

                text: "Back"
                onClicked: {
                    loader.source = "MainMenu.qml"
                }
            }
            x: (parent.width/2) - (buttonBack.width/2)
            y: parent.height/2 + 100
    }


}

