import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../stores"
import "../actions"

Item {
    id: root
    implicitHeight: title_line.implicitHeight + gview.height
    height: implicitHeight
    
    ButtonGroup {
        id: radio_group
        onClicked: {
            for (var i = 0; i < buttons.length; i++){
                if (buttons[i] === button){
                    AppActions.updateInstallDirection(i);
                    break;
                }
            }
        }
    }

    Column {
        anchors.fill: parent
        TitleLine {
            id: title_line
            text: MainStore.chassis.direction.title
            anchors {
                left: parent.left
                right: parent.right
            }
        }
        
        GridView {
            id: gview
            clip: true
            height: title_line.expanded ? 250 : 0
            anchors {
                left: parent.left
                right: parent.right
            }
            
            cellHeight: 250; cellWidth: 150
            model: MainStore.chassis.direction.model
            delegate: InstallDirectionItem {
                width: 100; height: 250
                button.text: model.desc
                button.checked: model.index == MainStore.chassis.direction.current_index
                group: radio_group
                img.source: model.source
                img.fillMode: Image.PreserveAspectFit
            }

            TScrollbarV{
                target: gview
                anchors.right: parent.right;
                anchors.rightMargin: 5
                height: parent.height;
            }
    
            Behavior on height {
                NumberAnimation {
                    duration: 200
                }
            }
        }
    }

}