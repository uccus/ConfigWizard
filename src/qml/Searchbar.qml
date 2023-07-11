import QtQuick 2.0

Rectangle {
    signal beginSearch(string val)

    property alias text: txt.text

    id: root
    implicitHeight: txt.implicitHeight + 10
    implicitWidth: txt.implicitWidth
    border.width: 1
    border.color: "#e2e2e2"
    radius: 5
    smooth: true
    clip: true

    Image {
        id: img
        width: 16
        height: 16
        source: "../images/2.png"
        anchors {
            left: parent.left
            leftMargin: 10
            verticalCenter: parent.verticalCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: root.beginSearch(txt.text)
        }
    }

    TextInput {
        id: txt
        text: "Try typing something"
        font.pixelSize: 20
        color: focus ? "black" : "grey"
        anchors {
            left: img.right
            leftMargin: 10
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        
        Keys.onPressed :{
            if (event.key == Qt.Key_Return) {
                root.beginSearch(txt.text)
            }
        }
    }
}