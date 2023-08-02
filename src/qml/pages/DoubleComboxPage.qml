import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../components"
import "../stores"
import "."

Item {
    property alias title: inter.title
    property alias model: inter.model

    implicitHeight: loader.implicitHeight
    height: implicitHeight
    
    QtObject {
        id: inter
        property string title;
        property var model;
        property var left_model;
        property var right_model;
    }
    
    Loader {
        id: loader
        // anchors.fill: parent
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        asynchronous: true
        sourceComponent: {
            if (visible){
                inter.left_model = model.double_combox_model[0];
                inter.right_model = model.double_combox_model[1];
                return com;
            }
            return null;
        }
    }
    
    Component{
        id: com
        ColumnLayout {
            id: col
            clip: true

            TitleLine {
                id: title_line
                text: inter.title
                Layout.fillWidth: true
                // Layout.fillHeight: false
            }

            RowLayout {
                id: row
                Layout.fillWidth: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                visible: title_line.expanded
                
                // 设备组
                ColumnLayout {
                    id: left
                    Layout.fillWidth: true
                    TLabel {
                        Layout.fillWidth: true
                        text: inter.left_model.desc
                    }
                    Repeater {
                        model: MainStore.dev_list_model
                        Item {
                            id: item
                            property int index: model.index
                            property string value: model[inter.left_model.name]

                            Layout.fillWidth: true
                            Layout.preferredWidth: 350
                            implicitWidth: box.implicitWidth
                            implicitHeight: box.implicitHeight
                            XComboBox {
                                id: box
                                anchors.fill: parent
                                model: inter.left_model.model
                                currentText: {
                                    for (var i = 0; i < inter.left_model.model.length; i++) {
                                        if (value === inter.left_model.model[i].value) {
                                            return inter.left_model.model[i].desc;
                                        }
                                    }
                                    return "";
                                }
                                onTriggered: MainStore.dev_list_model.setProperty(item.index, inter.left_model.name, modelData.value);
                            }
                        }
                    }
                }
                // 关联逻辑
                ColumnLayout {
                    id: right
                    Layout.fillWidth: true
                    TLabel {
                        Layout.fillWidth: true
                        text: inter.right_model.desc
                    }
                    Repeater {
                        model: MainStore.dev_list_model
                        Item{
                            id: item
                            property int index: model.index
                            property string value: model[inter.right_model.name]

                            Layout.fillWidth: true
                            Layout.preferredWidth: 350
                            implicitWidth: box.implicitWidth
                            implicitHeight: box.implicitHeight
                            XComboBox {
                                id: box
                                anchors.fill: parent
                                model: inter.right_model.model
                                currentText: {
                                    for (var i = 0; i < inter.right_model.model.length; i++) {
                                        if (value === inter.right_model.model[i].value) {
                                            return inter.right_model.model[i].desc;
                                        }
                                    }
                                    return "";
                                }
                                onTriggered: MainStore.dev_list_model.setProperty(item.index, inter.right_model.name, modelData.value);
                            }
                        }
                    }
                }
                // 删除按钮
                ColumnLayout {
                    id: buttons
                    Layout.fillWidth: true
                    TLabel {
                    }
                    Repeater {
                        model: MainStore.dev_list_model
                        delegate: TIconButton {
                            width: 40; height: 30
                            icon.position: TPosition.Only;
                            icon.source: TAwesomeType.FA_trash_o;
                            border.color: "transparent"
                            onClicked: MainStore.dev_list_model.remove(model.index, 1)
                        }
                    }
                }
            }
            
            TButton {
                id: add
                label.text: "+"
                label.font.pixelSize: TPixelSizePreset.PH2
                visible: title_line.expanded
                height: 40
                width: row.width
                Layout.fillWidth: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                onClicked: {
                    var obj = {};
                    obj[inter.left_model.name] = "";
                    obj[inter.right_model.name] = "";
                    MainStore.dev_list_model.append(obj);
                }
            }
        }
    }
}