import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../stores"

Item {
    property var chassis_obj: null
    property alias title: inter.title
    
    clip: true
    implicitHeight: title.expanded ? title.implicitHeight + loader.implicitHeight : title.implicitHeight
    height: implicitHeight

    QtObject{
        id: inter
        property string title: ""
    }

    TitleLine {
        id: title
        text: inter.title
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Loader {
        id: loader
        anchors {
            top: title.bottom
            left: parent.left
            right: parent.right
        }
        asynchronous: true
        source: MainStore.chassis_param.source
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: 200
        }
    }
}