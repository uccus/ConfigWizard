
import QtQuick 2.7
import Toou2D 1.0

Item {
    property var fake_data : {
        return {
            label: "随动机构",
            image: {
                source: "../images/7.png",
                width: 300,
                height: 250
            },
            model_data: [
                { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
                    combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
                    combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                { name: "fff", desc: "减速比", show_type: "lineEdit", value: "1", default_value: "20", min: 0, max: 10 },
            ],
            has_child: true,
            child_model_data: [
                { 
                    label: "下限位开关",
                    model_data: [
                        { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
                            combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                        { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
                            combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                    ]
                },
                { 
                    label: "驱动器",
                    model_data: [
                        { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
                            combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                        { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
                            combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                    ]
                }
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

            DynmicPage {
                title: fake_data.label
                model_data: fake_data.model_data
                width: parent.width
                imgSource: fake_data.image.source
                imgWidth: fake_data.image.width
                imgHeight: fake_data.image.height
                hasChild: fake_data.has_child
                child_model_data:fake_data.child_model_data
            }

            DynmicPage {
                title: fake_data.label
                model_data: fake_data.model_data
                width: parent.width
                imgSource: fake_data.image.source
                imgWidth: fake_data.image.width
                imgHeight: fake_data.image.height
                hasChild: fake_data.has_child
                child_model_data:fake_data.child_model_data
            }


            TLabel {
                text: "占位"
            }
        }
    }
}
