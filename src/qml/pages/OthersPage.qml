
import QtQuick 2.7
import Toou2D 1.0

Item {
    TFlickable{
        id: root
        clip: true
        anchors.fill: parent
        contentWidth: width;
        contentHeight: layout.height
        scrollBar.horizontal: false;
        Column {
            id: layout
            spacing: 10
            clip: true
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter

            TLabel {
                text: "占位"
            }
        }
    }
}
