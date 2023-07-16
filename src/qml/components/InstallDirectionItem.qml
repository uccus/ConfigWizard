import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.14
import Toou2D 1.0

Item {
    property alias button: button
    property alias img: img
    property var group;

    ColumnLayout {
        anchors.fill: parent
        RadioButton {
            id: button
            ButtonGroup.group: group
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
        }
        TImage{
            id: img
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignCenter
        }
    }
}