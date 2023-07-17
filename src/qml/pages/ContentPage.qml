import QtQuick 2.0
import Toou2D 1.0
import "../stores"
import "../actions"

Item {
    Loader {
        id: loader
        clip: true
        anchors.fill: parent
        source: MainStore.wizard.source
        asynchronous: true
        onStatusChanged: AppActions.showBusy(status !== Loader.Ready)
    }
}