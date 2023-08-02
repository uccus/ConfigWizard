import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0

Item {
    id: root
    property alias currentText: r1.text
    property var model
    implicitWidth: 100; implicitHeight: 30
    width: implicitWidth; height: implicitHeight

    signal triggered(var modelData);

    // 弹出框
    TPopover {
        id: popover

        bodyWidth: r1.width
        onOpened: r1.source = TAwesomeType.FA_caret_up 
        onCloseed: r1.source = TAwesomeType.FA_caret_down

        bodyComponent: Rectangle {
            width: popover.bodyWidth
            height: col.implicitHeight + 3
            radius: 1
            border.width: 1
            border.color: "#969696"
            color: "#fafafa"

            Column {
                id: col
                spacing: 5
                anchors.fill: parent
                anchors.topMargin: 2
                anchors.leftMargin: 1
                anchors.rightMargin: 1
                Repeater {
                    model: root.model
                    TRectangle{
                        width: parent.width
                        height: 18
                        color: m.containsMouse ? "#666" : "#fafafa"
                        TLabel {
                            anchors.fill: parent
                            anchors.leftMargin: 5
                            anchors.topMargin: 2
                            text: model.modelData.desc
                            color: m.containsMouse ? "white" : "#969696"
                        }
                        TMouseArea {
                            id: m
                            hoverEnabled: true
                            anchors.fill: parent
                            onClicked: {
                                root.triggered(model.modelData);
                                root.currentText = model.modelData.desc;
                                popover.close();
                            }
                        }
                    }
                }
            }
        }
    }

    TRectangle {
        id: r1
        width: root.width
        height: root.height
        border.width: t.text === "" ? 2 : 1
        border.color: t.text === "" ? "red" : "#969696"
        property alias source: icon.source
        property alias text: t.text
        radius: 2
        Text {
            id: t
            color: "#444"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        TIcon {
            id: icon
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            color: "#444"
            source: TAwesomeType.FA_caret_down
        }
        TMouseArea {
            anchors.fill: parent
            onClicked: {
                popover.openToGlobal(r1, 0, r1.height);
            }
        }
    }
}