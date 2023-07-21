import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../stores"

/**
    字段描述：编辑框或下拉框
*/
Item {
    width: 180
    height: 40

    // 当前编辑项属于哪个模块
    property string module_name: ""
    // property var itemModel: model
    property var itemModel: model.modelData

    TLabel {
        id: label
        width: 60
        wrapMode: Text.WordWrap
        text: itemModel.desc
        anchors.verticalCenter: parent.verticalCenter
    }
    
    Column {
        id: col
        anchors {
            left: label.right
            leftMargin: 10
            verticalCenter: parent.verticalCenter
        }

        ComboBox {
            id: combox
            width: input.width
            height: input.height
            // model: ["1", "2", "3", "4", "5", "6", "7"]
            model: {
                return visible ? itemModel.combox_value.map(function(a) {return a.desc;}) : [];
            }
            visible: itemModel.show_type === "combox"
            currentIndex: {
                var value = MainStore.getValue(module_name, itemModel.name);
                if ("combox_value" in itemModel){
                    for (var i = 0; i < itemModel.combox_value.length; i++) {
                        if (value === itemModel.combox_value[i].value) {
                            return i;
                        }
                    }
                }
                return -1;
            }
            // TODO: 字段值的查询和更新
            onActivated: {
                var current_value = itemModel.combox_value[index].value;
                MainStore.updateValue(module_name, itemModel.name, current_value);
            }
        }
        
        TInputField {
            id: input
            height: 30
            text: MainStore.getValue(module_name, itemModel.name)
            visible: itemModel.show_type === "input"
            onEditingFinished: {
                MainStore.updateValue(module_name, itemModel.name, text);
            }
            validator: {
                var obj = null;
                if (itemModel.data_type === "int" || itemModel.data_type === "uint"){
                    obj = Qt.createQmlObject("import QtQuick 2.7; IntValidator{}", input);
                }
                else if (itemModel.data_type === "float" || itemModel.data_type === "double") {
                    obj = Qt.createQmlObject("import QtQuick 2.7; import com.kc.quick 1.0; KCFloatValidator{}", input);
                }

                if (obj !== null){
                    if ("min" in itemModel && "max" in itemModel){
                        obj.bottom = itemModel.min;
                        obj.top = itemModel.max;
                        input.maximumLength = Math.max(itemModel.min.length, itemModel.max.length);
                    }
                    else {
                        obj.bottom = 0;
                        input.maximumLength = 5;
                    }
                }
                return obj;
            }
        }
    }
}