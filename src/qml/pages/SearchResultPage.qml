import QtQuick 2.0
import Toou2D 1.0
import QtQuick.Layouts 1.3
import "../actions"
import "../components"
import "../stores"

Item {
    TButton {
        id: back
        label.text: qsTr("返回")
        anchors {
            top: parent.top
            left: parent.left
            margins: 15
        }
        onClicked: AppActions.goBack();
    }

    TFlickable{
        id: root
        clip: true
        anchors {
            top: back.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        contentWidth: width;
        contentHeight: layout.height
        scrollBar.horizontal: false;
        ColumnLayout {
            id: layout
            spacing: 10
            clip: true
            width: root.width
            
            anchors.horizontalCenter: parent.horizontalCenter

            ChassisStructure{
                id: chassis_structure
                visible: MainStore.search.chassis_structure_visible
                Layout.fillWidth: true
            }

            InstallDirection {
                id: install_direction
                visible: MainStore.search.chassis_install_direction_visible
                Layout.fillWidth: true
            }
            
            Component.onCompleted: {
                AppActions.loadSearchResultPage(layout);
            }
        }

    }
}