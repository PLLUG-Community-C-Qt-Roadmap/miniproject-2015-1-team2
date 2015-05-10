import QtQuick 2.4

Item {
    id: playersItem
    property alias playerName : text1.text
    property alias playerScore : text2.text

   Row {
       anchors.horizontalCenter:parent.horizontalCenter
       spacing: 50
   Text {
        id: text1
        color: "yellow"
        font.bold: true
        font.pointSize: 12

}
    Text {
        id: text2
        color: "yellow"
        font.bold: true
        font.pointSize: 12

    }

}

}
