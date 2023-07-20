import QtQuick 2.7
import QtQuick.Controls 2.2
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

        // Rectangle {
        //     width: 100; height: 300; color: "red"
        // }

        Column {
            id: col
            anchors.fill: parent
            // anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Repeater {
                model: MainStore.model
                delegate: DynmicPageA {
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