import QtQuick 2.0
import Toou2D 1.0

TRectangle {
    property alias text: txt.text
    property bool expanded: true

    id: root
    implicitHeight: txt.implicitHeight + 15
    width: parent.width

    TIconButton {
        id: img
        width: 20; height: width
        icon.position: TPosition.Only;
        icon.source: !root.expanded ? TAwesomeType.FA_plus_square_o : TAwesomeType.FA_minus_square_o
        background.color: "transparent"
        border.color: "transparent"
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 10
        }
        onClicked: root.expanded = !root.expanded
    }

    TLabel {
        id: txt
        font.pixelSize: TPixelSizePreset.PH2;
        font.bold: true
        anchors {
            left: img.right
            verticalCenter: parent.verticalCenter
            leftMargin: 5
        }
    }
    
    TDividerLine{
        width: parent.width;
        height: 2;
        color: "#f2f2f2"
        anchors {
            left: parent.left
            right: parent.right
            top: txt.bottom
            leftMargin: 10
            rightMargin: 10
            topMargin: 5
        }
    }
}