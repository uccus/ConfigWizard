﻿import QtQuick 2.0

Rectangle {
    id: root;
    property int index;
    property var model;
    color: "#f2f2f2"
    
    Component{
        id: wizard_component

        Rectangle{
            width: parent.width
            height: 80
            color: "#f2f2f2"
            

            Column{
                width: parent.width

                spacing: 5
                Rectangle{
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 15
                    height: 60
                    border.width: 1
                    color: model.index == root.index ? "#1e98d7" : "#ffffff"
                    radius: 10
                    Text{
                        text: model.name
                        font.pixelSize: 30
                        anchors.centerIn: parent
                        color: model.index == root.index ? "white" : "black"
                    }
                }
                Image{
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "../images/1.png"
                    width: 20; height: 30
                    visible: model.index != (wizard_model.count - 1)
                }
            }
        }
    }
    
    Column {
        width: parent.width
        anchors.centerIn: parent
        spacing: 20
        Repeater {
            model: root.model
            delegate: wizard_component
        }
    }
    
}