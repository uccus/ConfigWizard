import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../components"
import "../stores"
import "."

Item {
    // implicitHeight: rect.implicitHeight
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
    
    ListModel {
        id: listModel
        // ListElement { left: "left"; right: "right"}
        ListElement { left: "left"}
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
            // anchors.fill: parent
            // anchors {
            //     left: parent.left
            //     right: parent.right
            //     top: parent.top
            // }
            height: title_line.expanded ? title_line.height + row.height + add.height + 40 : title_line.height

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
                
                // 设备组
                ColumnLayout {
                    id: left
                    Layout.fillWidth: true
                    TLabel {
                        text: inter.left_model.desc
                    }
                    Repeater {
                        model: listModel
                        delegate: ComboBox {
                            Layout.fillWidth: true
                            model: {
                                return inter.left_model.model.map(function(a){return a.desc;});
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
                        model: listModel
                        delegate: ComboBox {
                            height: 30
                            Layout.fillWidth: true
                            model: {
                                return inter.right_model.model.map(function(a){return a.desc;});
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
                        model:listModel
                        delegate: TIconButton {
                            width: 40; height: 40
                            icon.position: TPosition.Only;
                            icon.source: TAwesomeType.FA_trash_o;
                            border.color: "transparent"
                            onClicked: listModel.remove(model.index, 1)
                        }
                    }
                }
            }
            
            TButton {
                id: add
                label.text: "+"
                label.font.pixelSize: TPixelSizePreset.PH2
                height: 40
                Layout.fillWidth: true
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                onClicked: {
                    var obj = {};
                    obj.left = "left";
                    obj.right = "right";
                    listModel.append(obj);
                }
            }
            
            // Behavior on height {
            //     NumberAnimation {
            //         duration: 200
            //     }
            // }
        }
    }
}