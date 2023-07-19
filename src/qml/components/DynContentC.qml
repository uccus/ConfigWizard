import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0

Item {
    id: root
    property var model: []
    implicitHeight: col.implicitHeight
    height: implicitHeight

    Column {
        id: col
        anchors.fill: parent
        Repeater {
            model: root.model
            delegate:
                // Rectangle {
                //     width: 100; height: 100
                //     color: "red"
                //     anchors.horizontalCenter: parent.horizontalCenter
                // }
                DynComponentA {
                    _model: "radio_value" in modelData ? modelData.radio_value : []
                    anchors{
                        left: parent.left
                        right: parent.right
                    }
                    Component.onCompleted: {
                        console.log(_model.length, modelData.name)
                    }
                }
        }
    }
}