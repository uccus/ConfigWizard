import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0

Item {
    property string module_name: ""
    property alias _model: gview.model
    implicitHeight: gview.cellHeight
    width: implicitWidth

    ButtonGroup {
        id: radio_group
        onClicked: {
            // for (var i = 0; i < buttons.length; i++){
            //     if (buttons[i] === button){
            //         AppActions.updateInstallDirection(i);
            //         break;
            //     }
            // }
        }
    }

    GridView {
        id: gview
        clip: true
        anchors.fill: parent
        cellHeight: 250; cellWidth: 150

        delegate: 
            Rectangle {
                width: 150; height: 250
                // color: "red"
                ColumnLayout {
                    anchors.fill: parent
                    RadioButton {
                        id: button
                        text: modelData.desc
                        ButtonGroup.group: radio_group
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                    }
                    TImage{
                        id: img
                        source: modelData.image
                        fillMode: Image.PreserveAspectFit
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
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