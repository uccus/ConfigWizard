import QtQuick 2.0
import QtQuick.Controls 2.2
import Toou2D 1.0

TRectangle {
    id: root
    height: implicitHeight
    implicitHeight: img.visible ? title_line.implicitHeight + img.height + 15 : title_line.implicitHeight
    clip:true

    Column {
        anchors.fill: parent
        spacing: 10

        TitleLine {
            id: title_line
            text: qsTr("底盘结构")
            width: parent.width
        }

        TImage {
            id: img
            source: "../images/3.png"
            fillMode: Image.PreserveAspectFit
            anchors {
                // top: title_line.bottom
                horizontalCenter: parent.horizontalCenter
                // margins: 15
            }
            width: sourceSize.width / 4
            height: sourceSize.height / 4 
            visible: title_line.expanded
        }
    }

    Behavior on height {
        NumberAnimation {
            duration: 200
        }
    }
}