import QtQuick 2.7
import Toou2D 1.0

Item {
    property var fake_data : [
        { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
            combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
        { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
            combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
        { name: "fff", desc: "减速比", show_type: "lineEdit", value: "1", default_value: "20", min: 0, max: 10 },
    ]

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
            
            DynmicPage {
                title: qsTr("底部二维码相机")
                model_data: fake_data
                width: parent.width
                imgSource: "../images/7.png"
                imgWidth: 300
                imgHeight: 250
            }

            DynmicPage {
                title: qsTr("顶部二维码相机")
                model_data: fake_data
                width: parent.width
                imgSource: "../images/7.png"
                imgWidth: 300
                imgHeight: 250
            }

            DynmicPage {
                title: qsTr("前激光雷达")
                model_data: fake_data
                width: parent.width
                imgSource: "../images/7.png"
                imgWidth: 300
                imgHeight: 250
            }

            DynmicPage {
                title: qsTr("后激光雷达")
                model_data: fake_data
                width: parent.width
                imgSource: "../images/7.png"
                imgWidth: 300
                imgHeight: 250
            }

            TLabel {
                text: "占位"
            }
        }
    }
}
