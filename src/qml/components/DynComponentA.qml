import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../stores"

// 这里是一组radiobutton，module_name等于param_name
Item {
    property string module_name: ""
    property alias _model: gview.model
    implicitHeight: gview.cellHeight
    width: implicitWidth

    ButtonGroup {
        id: radio_group
        onClicked: {
            MainStore.updateValue(module_name, module_name, button.value);
        }
    }

    GridView {
        id: gview
        clip: true
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter;
        cellWidth: 150; cellHeight: 200

        delegate: 
            Rectangle {
                width: gview.cellWidth - 20; height: gview.cellHeight
                color: "#fafafa"
                ColumnLayout {
                    anchors.fill: parent
                    RadioButton {
                        id: button
                        property string value: modelData.value;
                        text: modelData.desc
                        checked: value === MainStore.getValue(module_name, module_name)
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