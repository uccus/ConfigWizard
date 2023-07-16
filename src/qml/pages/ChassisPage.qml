import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.14
import Toou2D 1.0
import "../components"
import "../actions"
import "../stores"

Item {

    // property var fake_data2: {
    //     return {
    //         value: "0", default_value: "1",
    //         options: [
    //             { desc: "纵向正装", source: "../images/FRC5000纵向正装.png" },
    //             { desc: "横向正装", source: "../images/FRC5000横向正装.png" },
    //             { desc: "水平正装", source: "../images/FRC5000水平正装.png" },
    //             { desc: "纵向倒装", source: "../images/FRC5000纵向倒装.png" },
    //             { desc: "纵向倒装", source: "../images/FRC5000纵向倒装.png" },
    //             { desc: "纵向倒装", source: "../images/FRC5000纵向倒装.png" },
    //             { desc: "纵向倒装", source: "../images/FRC5000纵向倒装.png" },
    //         ]
    //     }
    // }
    
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

            ChassisStructure{
                id: chassis_structure
                Layout.fillWidth: true
            }

            InstallDirection2 {
                id: install_direction
                Layout.fillWidth: true
            }
            
            // TInputField {
            //     validator: IntValidator{
            //         bottom: 1
            //         top: 13
            //     }
            //     height: 20
            //     Layout.fillWidth: true
            // }
            
            // DynmicPage {
            //     title: "左轮驱动器配置"
            //     model_data: fake_data
            //     width: parent.width
            //     imgSource: "../images/4.png"
            //     imgWidth: 300
            //     imgHeight: 250
            // }
            
            // DynmicPage {
            //     title: "右轮驱动器配置"
            //     model_data: fake_data
            //     width: parent.width
            //     imgSource: "../images/4.png"
            //     imgWidth: 300
            //     imgHeight: 250
            // }
            Component.onCompleted: {
                for(var i = 0; i < MainStore.chassis.dynmic_data.data.length; i++) {
                    AppActions.loadChassisDynmicPage(layout, MainStore.chassis.dynmic_data.data[i]);
                }
            }
        }
    }
}