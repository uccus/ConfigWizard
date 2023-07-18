import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../components"
import "../actions"
import "../stores"

Item {
    TFlickable{
        id: root
        clip: true
        anchors.fill: parent
        contentWidth: width;
        contentHeight: layout.height
        scrollBar.horizontal: false;
        ColumnLayout {
            id: layout
            spacing: 10
            clip: true
            width: root.width
            
            anchors.horizontalCenter: parent.horizontalCenter

            // ChassisStructure{
            //     id: chassis_structure
            //     Layout.fillWidth: true
            // }

            // InstallDirection {
            //     id: install_direction
            //     Layout.fillWidth: true
            // }
            
            Component.onCompleted: {
                AppActions.loadChassisDynmicPage(layout);
            }
        }
    }
}