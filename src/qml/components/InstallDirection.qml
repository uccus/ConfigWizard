import QtQuick 2.0
import QtQuick.Controls 2.2
import Toou2D 1.0
import "../stores"

TRectangle {
    id: root
    property var model_data;

    height: implicitHeight
    implicitHeight: flickable.visible ? title_line.implicitHeight + flickable.height : title_line.implicitHeight
    clip:true

    TitleLine {
        id: title_line
        text: MainStore.chassis.direction.title
        width: parent.width
        anchors {
            top: parent.top
        }
    }
    
    ScrollView {
        id: flickable
        clip: true
        visible: title_line.expanded
        height: 200

        anchors {
            top: title_line.bottom
            left: parent.left
            right: parent.right
            leftMargin: 10
            topMargin: 10
        }
        
        // ButtonGroup {
        //     id: radio_group

        //     // onClicked: current_index = checkedButton.index
        // }

        Grid {
            id: gview
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 20
            width: parent.width

            Repeater {
                model: root.model_data.options

                delegate: Column{
                    spacing: 10
                    RadioButton{
                        anchors.horizontalCenter: parent.horizontalCenter
                        property int index: model.index
                        text: model.modelData.desc
                        ButtonGroup.group: radio_group
                    }
                    TImage {
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: modelData.source
                        width: sourceSize.width / 4
                        height: sourceSize.height / 4
                    }
                }
            }
        }
    }
    
    Behavior on height {
        NumberAnimation {
            duration: 200
        }
    }
}