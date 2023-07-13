import QtQuick 2.0;
import Toou2D 1.0
import "dynamic_create.js" as Dyn

/*
    这个动态组件目前仅支持 Label + 下拉框/编辑框的形式
    要求输入格式如下：
    property var fake_data : [
        { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
            combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
        { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
            combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
        { name: "fff", desc: "减速比", show_type: "lineEdit", value: "1", default_value: "20", min: 0, max: 10 },
    ]
*/
Component {
    TRectangle {
        width: root.width
        height: root.height;
        Row{
            id: root
            spacing: 10

            Component.onCompleted: {
                var obj = Dyn.createLabel(root);
                obj.text = model.modelData.desc;
                
                // 如果实际值为空, 则用默认值
                if (model.modelData.value === "") {
                    model.modelData.value = model.modelData.default_value;
                }
                if (model.modelData.show_type == "combox"){
                    obj = Dyn.createCombox(root);
                    // obj.model = model.modelData.combox_value;
                    // var arr = [];
                    // for (var i = 0; i < model.modelData.combox_value.length; i++) {
                    //     arr.append(model.modelData.combox_value[i].desc);
                    // }
                    var result = model.modelData.combox_value.map(function(a) {return a.desc;});
                    var current_index = Dyn.findIndexByField(model.modelData.combox_value, "value", model.modelData.value);
                    obj.model = result;
                    obj.currentIndex = current_index;
                    obj.width = 150;
                }
                else if (model.modelData.show_type == "lineEdit"){
                    obj = Dyn.createLineEdit(root);
                    obj.width = 150;
                    obj.text = model.modelData.value;
                    // TODO... 限制器
                }
            }
        }
    }
}