import QtQuick 2.0
import QuickFlux 1.1
import "../actions"
import "."

Store {
    property var data: [
        {
            module_name: "bottomCamera",
            title: qsTr("底部二维码相机"),
            image: {
                source: "../../images/7.png",
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
            module_name: "topCamera",
            title: qsTr("顶部二维码相机"),
            image: {
                source: "../../images/7.png",
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
            module_name: "forwardLaser",
            title: qsTr("前激光雷达"),
            image: {
                source: "../../images/7.png",
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
            module_name: "backwardLaser",
            title: qsTr("后激光雷达"),
            image: {
                source: "../../images/7.png",
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
    ]
    
    Filter {
        type: ActionTypes.comboxIndexChanged
        
        onDispatched: {
            var module_name = message.combox.module_name;
            var name = message.combox.name;
            var value = message.combox.interValue;
            MainStore.findAndUpdateValue(data, module_name, name, value);
        }
    }

    Filter {
        type: ActionTypes.lineEditingFinished
        
        onDispatched: {
            var module_name = message.edit.module_name;
            var name = message.edit.name;
            var value = message.edit.text;
            MainStore.findAndUpdateValue(data, module_name, name, value);
        }
    }

    function search(keyword){
        var objs = MainStore.searchData(data, keyword);
        return objs;
    }
}