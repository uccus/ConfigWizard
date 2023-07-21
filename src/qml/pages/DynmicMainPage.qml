import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../components"
import "../stores"
import "."

Item {
    id: root
    
    // TFlickable {
    ScrollView {
        clip: true
        anchors.fill: parent

        ColumnLayout {
            id: layout
            anchors.fill: parent

            // 设备关联
            DoubleComboxPage {
                id: dev_associate
                model: {
                    for (var i = 0; i < MainStore.model.length; i++) {
                        var tmp = MainStore.model[i];
                        if ("show_type" in tmp) {
                            if ("double_combox" === tmp.show_type){
                                title = tmp.title;
                                console.log(JSON.stringify(tmp));
                                return tmp;
                            }
                        }
                        return null;
                    }
                }
                visible: model !== null && "double_combox_model" in model
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Column {
                id: col
                // anchors.fill: parent
                spacing: 10
                Layout.fillWidth: true
                Layout.fillHeight: true

                Repeater {
                    model: MainStore.model
                    // 这个地方如果升级qt版本，可以使用delegate chooser，处理会更方便简单
                    delegate: DynmicPage {
                        visible: {
                            // 过滤特殊show_type
                            if ("show_type" in modelData) {
                                if (_special_node.indexOf(modelData["show_type"]) !== -1){
                                    return false;
                                }
                            }
                            return true;
                        }
                        width: root.width
                        // anchors {
                        //     left: parent.left
                        //     right: parent.right
                        // }
                        module_name: modelData.module_name
                        title: modelData.title
                        model_data: "model" in modelData ? modelData.model : []
                        radio_model_data: "radio_model" in modelData ? modelData.radio_model : []
                        imgSource: "image" in modelData ? modelData.image.source : ""
                        imgWidth: "image" in modelData ? modelData.image.width : 0
                        imgHeight: "image" in modelData ? modelData.image.height : 0
                        description: "description" in modelData ? modelData.description : ""
                        child_model_data: "child_model_data" in modelData ? modelData.child_model_data : []
                        Component.onCompleted: {
                            // console.log("main store model", JSON.stringify(MainStore.model))
                            // console.log("--------------------------------")
                            // console.log("main page", JSON.stringify(modelData))
                            // console.log("--------------------------------")
                        }
                    }
                    // model: 15
                    // delegate: Rectangle {
                    //     width: 100; height: 100
                    //     implicitHeight: 100
                    //     color: "red"
                    // }
                }
            }
        }
    }
}