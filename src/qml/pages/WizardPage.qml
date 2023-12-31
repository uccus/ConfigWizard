﻿import QtQuick 2.0
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../stores"
import "../actions"

Rectangle {
    id: root
    color: "#f2f2f2"
    
    Column {
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        // anchors.centerIn: parent
        spacing: 10
        Repeater{
            model: MainStore.ui_data
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

            TButton {
                id: rect
                anchors {
                    left: parent.left
                    right: parent.right
                }
                height: 60
                background.color: model.index == MainStore.wizard.current_index ? "#1e98d7" : "#ffffff"
                label.text: model.modelData.desc
                label.font.pixelSize: TPixelSizePreset.PH2
                label.color: model.index == MainStore.wizard.current_index ? "#fefefe" : "black"
                onClicked: AppActions.toNextWizardPage(model.index);
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
                visible: model.index != (MainStore.ui_data.length - 1)
            }
        }
    }
}