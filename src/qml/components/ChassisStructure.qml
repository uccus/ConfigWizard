import QtQuick 2.0
import QtQuick.Controls 2.2
import Toou2D 1.0
import "../stores"

Item {
    id: root
    height: implicitHeight
    readonly property int spacing: 10
    implicitHeight: title_line.implicitHeight + img.height + spacing
    clip:true

    Column {
        id: col
        anchors.fill: parent
        spacing: root.spacing

        TitleLine {
            id: title_line
            text: MainStore.chassis.title

            anchors {
                left: parent.left
                right: parent.right
            }
        }

        TImage {
            id: img
            source: MainStore.chassis.img_source
            fillMode: Image.PreserveAspectFit
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            width: sourceSize.width / 4
            height: title_line.expanded ? sourceSize.height / 4 : 0

            Behavior on height {
                NumberAnimation {
                    duration: 200
                }
            }
        }
    }

}