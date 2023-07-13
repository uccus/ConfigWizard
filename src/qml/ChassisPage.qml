import QtQuick 2.0
import QtQuick.Controls 2.2
import Toou2D 1.0

Item {
    // property alias current_index: install_direction.current_index
    property int current_index: 0
    property var fake_data : [
        { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
            combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
        { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
            combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
        { name: "fff", desc: "减速比", show_type: "lineEdit", value: "1", default_value: "20", min: 0, max: 10 },
    ]

    property var fake_data2: {
        return {
            value: "0", default_value: "1",
            options: [
                { desc: "纵向正装", source: "../images/FRC5000纵向正装.png" },
                { desc: "横向正装", source: "../images/FRC5000横向正装.png" },
                { desc: "水平正装", source: "../images/FRC5000水平正装.png" },
                { desc: "纵向倒装", source: "../images/FRC5000纵向倒装.png" },
                { desc: "纵向倒装", source: "../images/FRC5000纵向倒装.png" },
                { desc: "纵向倒装", source: "../images/FRC5000纵向倒装.png" },
                { desc: "纵向倒装", source: "../images/FRC5000纵向倒装.png" },
            ]
        }
    }
    

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

            ChassisStructure{
                id: chassis_structure
                width: parent.width
            }

            InstallDirection {
                id: install_direction
                width: parent.width
                model_data: fake_data2
                Component.onCompleted: {
                    install_direction.setCurrentIndex(2)
                }
            }
            
            DynmicPage {
                title: "左轮驱动器配置"
                model_data: fake_data
                width: parent.width
                imgSource: "../images/4.png"
                imgWidth: 300
                imgHeight: 250
            }
            
            DynmicPage {
                title: "右轮驱动器配置"
                model_data: fake_data
                width: parent.width
                imgSource: "../images/4.png"
                imgWidth: 300
                imgHeight: 250
            }
        }
    }
    
}