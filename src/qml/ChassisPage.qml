import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    property alias current_index: install_direction.current_index
    Column {
    // ListView {
        anchors.fill: parent
        spacing: 10

        ChassisStructure{
            id: chassis_structure
            width: parent.width
        }

        InstallDirection {
            id: install_direction
            width: parent.width
        }
    }
}