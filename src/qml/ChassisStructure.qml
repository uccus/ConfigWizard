﻿import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    id: root
    implicitHeight: !img.visible ? title_line.implicitHeight : title_line.implicitHeight + img.height + 15
    clip:true

    Column {
        anchors.fill: parent
        spacing: 10

        TitleLine {
            id: title_line
            text: qsTr("底盘结构")
            width: parent.width
        }

        Image {
            id: img
            source: "../images/3.png"
            anchors {
                // top: title_line.bottom
                horizontalCenter: parent.horizontalCenter
                // margins: 15
            }
            width: sourceSize.width / 4
            height: sourceSize.height / 4 
            visible: !title_line.clicked
        }
    }
}