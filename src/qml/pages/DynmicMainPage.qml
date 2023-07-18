import QtQuick 2.7
import Toou2D 1.0
import "../components"
import "../stores"

Item {
    id: root
    clip: true
    
    Column {
        anchors.fill: parent
        spacing: 10
        Repeater {
            model: MainStore.getModel()
            // delegate: Rectangle {
            //     width: 100; height: 100
            //     color: "red"
            // }
            delegate: DynmicPageA {
                anchors {
                    left: parent.left
                    right: parent.right
                }
                title: modelData.title
                model_data: modelData.model
                // type: "image"
                // imgSource: modelData.image.source
                type: "text"
                // imgWidth: modelData.image.width
                // imgHeight: modelData.image.height
                // has_child: modelData.has_child
                child_model_data: modelData.child_model_data
            }
        }
    }
}