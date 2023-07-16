import QtQuick 2.0
import QuickFlux 1.1
import "../actions"

Store {
    property var data: [
        {
            title: qsTr("左轮驱动器配置"),
            image: {
                source: "../../images/4.png",
                width: 300,
                height: 250
            },
            model: [
                { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
                    combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
                    combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                { name: "fff", desc: "减速比", show_type: "lineEdit", value: "1", default_value: "20", min: 0, max: 10 },
            ]
        },
        {
            title: qsTr("右轮驱动器配置"),
            image: {
                source: "../../images/4.png",
                width: 300,
                height: 250
            },
            model: [
                { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
                    combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
                    combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                { name: "fff", desc: "减速比", show_type: "lineEdit", value: "1", default_value: "20", min: 0, max: 10 },
            ]
        }
    ]
    
    Filter {
        type: ActionTypes.comboxIndexChanged
        
        onDispatched: {
            console.log(message.combox, message.combox.currentIndex, message.combox.currentText)
        }
    }
}