import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0



Window{

    id: history
    color: "black"
    width: 360
    height: 360



        Text
        {
            text: "History"
            color: "red"
            font.family: pacmanFont.name
            font.pointSize: 20
            x: parent.width/2 - width/2
            y: 20

        }


    Grid
    {
        id: historyGrid
        rows: 10
        columns: 2
        anchors.centerIn: parent
        columnSpacing: 75
        rowSpacing: 5

        Text
        {
            text: "Player1"
            color: "yellow"
            font.bold: true
            font.pointSize: 12

        }

        Text
        {
            text: "150"
            color: "yellow"
            font.bold: true
            font.pointSize: 12
        }

        Text
        {
            text: "Player2"
            color: "yellow"
            font.bold: true
            font.pointSize: 12
        }

        Text
        {
            text: "150"
            color: "yellow"
            font.bold: true
            font.pointSize: 12
        }

    }




    Item{
        id: next
        x: parent.width/1.5 - 35
        y: parent.height - 75
            ItemForButton
            {

                text: "Next"

            }
        }


    Item{
        id: back
        x: parent.width/3 - 35
        y: parent.height - 75
            ItemForButton
            {
                text: "Back"
                onClicked: {history.close()
                mainWindow.show()}
            }
    }







}

