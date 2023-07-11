import QtQuick 2.0

Rectangle {
    property alias text: txt.text
    property bool clicked: false

    id: root
    implicitHeight: txt.implicitHeight + 15

    Image {
        id: img
        source: root.clicked ? "../images/6.png" : "../images/5.png"
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 10
        }
        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked = !root.clicked
        }
    }
    StyledText {
        id: txt
        text: ""
        font.pixelSize: 18
        font.bold: true
        anchors {
            left: img.right
            verticalCenter: parent.verticalCenter
            leftMargin: 5
        }
    }
    
    Rectangle {
        width: parent.width
        height: 2
        color: "black"
        anchors {
            left: parent.left
            bottom: parent.bottom
            right: parent.right
            leftMargin: 10
            rightMargin: 20
        }
    }
}