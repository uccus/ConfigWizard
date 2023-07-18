import QtQuick 2.7
import QtQuick.Controls 2.7
import QtQuick.Layouts 1.3
import Toou2D 1.0

/**
    填写的内容
    高度由自身决定
*/
Item {
    property alias model: r.model
    // property var model: []
    implicitHeight: col.implicitHeight
    height: implicitHeight

    Column {
        id: col
        anchors.fill: parent
        // anchors {
        //     left: parent.left
        //     right: parent.right
        // }
        Repeater {
            id: r
            // model: ListModel {
            //     ListElement{ name: "描述一"; value: "测试一"; show_type: "input"}
            //     ListElement{ name: "描述二"; value: "2"; show_type: "combox"}
            //     ListElement{ name: "描述三"; value: "测试三"; show_type: "input"}
            // }
            delegate: DynComponentB{
                // module_name: 
                anchors {
                    left: parent.left
                    right: parent.right
                }
            }
            // model: 2
            // delegate: Rectangle {
            //     height: 100
            //     anchors {
            //         left: parent.left
            //         right: parent.right
            //     }
            //     color: "red"
            //     Component.onCompleted: {
            //         console.log("child rect", width, height, implicitHeight, implicitHeight)
            //     }
            // }
        }
        // Component.onCompleted: {
        //     console.log("child col 1", width, height, implicitHeight, implicitHeight)
        // }
    }
    // Component.onCompleted: {
    //     console.log("item 0", width, height, implicitHeight, implicitHeight)
    // }
}