﻿import QtQuick 2.7
import Toou2D 1.0

Item {
    // property alias current_index: install_direction.current_index
    property int current_index: 0

    TFlickable{
        id: root
        clip: true
        anchors.fill: parent
        contentWidth: width;
        contentHeight: layout.height
        scrollBar.horizontal: false;
        Column {
            id: layout
            spacing: 10
            clip: true
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter

            DriverConfig{
                title: "右轮驱动器配置"
                width: parent.width
            }
            
            TLabel {
                text: "占位"
            }
        }
    }
}
