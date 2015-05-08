import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1

Window{

    id: history

    width: 360
    height: 360

    ColumnLayout
    {
        Text
        {
            text: "History"
            font.family: pacmanFont.name
            font.pointSize: 35


        }

        Item
        {
            ItemForButton
            {
                text: "Back"
                onClicked: {
                    mainWindow.show()
                    itemLoader.source = ""

                }
            }
        }

        Item
        {
            ItemForButton
            {
                text: "Next"
            }
        }


    }



}
