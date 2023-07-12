import QtQuick 2.0
import QtQuick.Controls 2.2
import Toou2D 1.0

Item {
    // property alias current_index: install_direction.current_index
    property int current_index: 0

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
            anchors.fill: parent
            anchors.horizontalCenter: parent.horizontalCenter

            // ChassisStructure{
            //     id: chassis_structure
            //     width: parent.width
            // }

            // InstallDirection {
            //     id: install_direction
            //     width: parent.width
            // }
            
            DriverConfig{
                title: "左轮驱动器配置"
                width: parent.width
            }
            
            TLabel {
                text: "占位"
            }
        }
    }
}