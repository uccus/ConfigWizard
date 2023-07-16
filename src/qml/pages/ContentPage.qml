import QtQuick 2.0
import Toou2D 1.0
import "../stores"

Item {
    Loader {
        id: loader
        clip: true
        anchors.fill: parent
        source: MainStore.wizard.source
        // source: "ChassisPage.qml"
        asynchronous: true
        // onStatusChanged: bi.visible = status !==Loader.Ready
    }
}