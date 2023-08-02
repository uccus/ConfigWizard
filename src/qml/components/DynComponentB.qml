import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../stores"

/**
    字段描述：编辑框或下拉框或勾选框
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

        XComboBox {
            width: input.width
            height: input.height
            visible: itemModel.show_type === "combox"
            model: itemModel.combox_value
            currentText: {
                var value = MainStore.getValue(module_name, itemModel.name);
                if ("combox_value" in itemModel){
                    for (var i = 0; i < itemModel.combox_value.length; i++) {
                        if (value === itemModel.combox_value[i].value) {
                            return itemModel.combox_value[i].desc;
                        }
                    }
                }
                return "";
            }

            onTriggered: MainStore.updateValue(module_name, itemModel.name, modelData.value);
        }

        TCheckBox{
            id: checkBox
            padding: 0
            label.text: ""
            icon.color: "#969696"
            iconChecked.color: "#969696"
            visible: itemModel.show_type === "checkbox"
            checked: MainStore.getValue(module_name, itemModel.name) !== "0"
            onCheckedS: MainStore.updateValue(module_name, itemModel.name, checked ? "1": "0")
        }
        
        TInputField {
            id: input
            height: 30
            border.color: text === "" ? "red" : "#9D9D9D"
            border.width: text === "" ? 2 : 1
            text: MainStore.getValue(module_name, itemModel.name)
            placeholderLabel.text: ""
            clearable: false
            visible: itemModel.show_type === "input"
            onTextChanged: {
                if (text === ""){
                    MainStore.wizard.check_ref += 1
                }
                else {
                    if (MainStore.wizard.check_ref > 0){
                        MainStore.wizard.check_ref -= 1
                    }
                }
            }
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
                    // else {
                    //     obj.bottom = 0;
                    //     input.maximumLength = 5;
                    // }
                }
                return obj;
            }
        }
    }
}