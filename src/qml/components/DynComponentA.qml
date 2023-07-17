import QtQuick 2.0;
import Toou2D 1.0
import "../js/dynamic_create.js" as Dyn

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

TRectangle {
    id: com
    property string module_name: "";

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
                var result = model.modelData.combox_value.map(function(a) {return a.desc;});
                var index = Dyn.findIndexByValue(model.modelData.combox_value, "value", model.modelData.value);
                obj.model = result;
                obj.comboxValue = model.modelData.combox_value;
                obj.module_name = com.module_name;
                obj.name = model.modelData.name;
                obj.currentIndex = index;
                obj.width = 150;
            }
            else if (model.modelData.show_type == "lineEdit"){
                obj = Dyn.createLineEdit(root);
                obj.width = 150;
                obj.module_name = com.module_name
                obj.name = model.modelData.name
                obj.text = model.modelData.value;
                if (model.modelData.data_type === "int" || model.modelData.data_type === "uint")
                    obj.validator = Dyn.createIntValidator(model.modelData.min, model.modelData.max);
                else if (model.modelData.data_type === "float")
                    obj.validator = Dyn.createFloatValidator(model.modelData.min, model.modelData.max);
            }
        }
    }
}