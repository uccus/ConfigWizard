﻿import QtQuick 2.0
import QtQuick.Layouts 1.14
import Toou2D 1.0
import "../stores"

Rectangle {
    id: root
    color: "#f2f2f2"
    
    Column {
        anchors.centerIn: parent
        spacing: 10
        Repeater{
            model: MainStore.wizard.model
            delegate: wizard_component
        }
    }

    Component{
        id: wizard_component

        Rectangle{
            width: 120
            height: 95
            clip: true
            color: "#f2f2f2"

            TRectangle{
                id: rect
                anchors {
                    left: parent.left
                    right: parent.right
                }
                height: 60
                radius: 2
                color: model.index == MainStore.wizard.current_index ? "#1e98d7" : "#ffffff"
                TLabel{
                    anchors.centerIn: parent
                    text: model.name
                    font.pixelSize: TPixelSizePreset.PH2;
                    color: model.index == MainStore.wizard.current_index ? "white" : "black"
                }
            }
            
            TImage{
                anchors {
                    top: rect.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 5
                }
                height: 30
                source: "../../images/1.png"
                fillMode: Image.PreserveAspectFit
                visible: model.index != (MainStore.wizard.model.count - 1)
            }
        }
    }
}