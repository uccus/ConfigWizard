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
                        text: inter.left_model.desc
                    }
                    Repeater {
                        model: MainStore.dev_list_model
                        delegate: Item {
                            id: item
                            property int index: model.index
                            Layout.fillWidth: true
                            Layout.preferredWidth: box.implicitWidth
                            implicitHeight: box.implicitHeight
                            ComboBox {
                                id: box
                                anchors.fill: parent
                                currentIndex: -1
                                model: {
                                    return inter.left_model.model.map(function(a){return a.desc;});
                                }
                                onActivated: {
                                    var value = inter.left_model.model[index].value;
                                    MainStore.dev_list_model.setProperty(item.index, inter.left_model.name, value);
                                }
                            }
                        }
                    }
                }
                // 关联逻辑
                ColumnLayout {
                    id: right
                    Layout.fillWidth: true
                    TLabel {
                        text: inter.right_model.desc
                    }
                    Repeater {
                        model: MainStore.dev_list_model
                        delegate: Item{
                            id: item
                            property int index: model.index
                            Layout.fillWidth: true
                            Layout.preferredWidth: box.implicitWidth
                            implicitHeight: box.implicitHeight
                            ComboBox {
                                id: box
                                anchors.fill: parent
                                currentIndex: -1
                                model: {
                                    return inter.right_model.model.map(function(a){return a.desc;});
                                }
                                onActivated: {
                                    var value = inter.right_model.model[index].value;
                                    MainStore.dev_list_model.setProperty(item.index, inter.right_model.name, value);
                                }
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
                            width: 40; height: 40
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
                Layout.fillWidth: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                Layout.preferredWidth: loader.implicitWidth
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