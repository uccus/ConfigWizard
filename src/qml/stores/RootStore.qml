import QtQuick 2.0
import QuickFlux 1.1
import "../actions"

Store {
    // 界面显示的动态数据，格式见fake_data.txt
    property var ui_data: getUIData()
    /** 实际编辑的字段值 { 模块名字: [{字段名:字段值}]}
        [{
            chassis: [
                { install_direction: 0},
            ],},
        {
            left_driver: [
                {brand: xxx},
                {comm_no: 2},
                ...
            ]}
        ]
    */
    // 来自c++的默认值
    property var data: JSON.parse(_data)
    
    // 设备关联数据
    property string dev_module_name: ""
    property alias dev_list_model: listModel
    ListModel {
        id: listModel
    }
    
    // 当前使用的model, 需要过滤特殊show_type
    property var model: getModel()
    
    // 向导相关
    property alias wizard: wizard
    WizardStore { id: wizard }
    
    // 底盘参数相关
    property alias chassis_param: chassis_param
    ChassisStore { id: chassis_param }
    
    /////////////////////////////////////////////////////////////////////////////////
    function getUIData() {
        // 来自c++的json串
        var obj = JSON.parse(_test_ui_data);
        return obj.module;
    }
    
    function getModel(){
        var sub = ui_data[wizard.current_index];
        return sub.model;
    }
    
    // 通过模块名和字段名获取值
    function getValue(module_name, param_name){
        // console.log("getValue: ", module_name, param_name)
        if (module_name in data){
            var values = data[module_name];
            for (var i = 0; i < values.length; i++){
                var tmp = values[i];
                if (param_name in tmp){
                    // console.log("value: ", module_name, param_name, tmp[param_name]);
                    return tmp[param_name];
                }
            }
        }
        return "";
    }
    
    // 更新值
    function updateValue(module_name, param_name, value){
        if (module_name in data) {
            var values = data[module_name];
            var ok = false;
            for (var i = 0; i < values.length; i++) {
                var tmp = values[i];
                if (param_name in tmp) {
                    tmp[param_name] = value;
                    // console.log("1 --------------------------------");
                    // console.log("update new value", JSON.stringify(tmp));
                    // console.log("2 --------------------------------");
                    // console.log("update new value", JSON.stringify(values));
                    // console.log("3 --------------------------------");
                    // console.log("update new value", JSON.stringify(data));
                    // console.log("4 --------------------------------");
                    return;
                }
            }
            if (!ok) {
                var obj = {};
                obj[param_name] = value;
                values.push(obj);
            }
        }
    }
    
    Filter {
        type: ActionTypes.generateFile
        
        onDispatched: {
            // 设备关联数据
            var array = []
            for (var i = 0; i < listModel.count; i++){
                var e = listModel.get(i);
                array.push(e);
            }
            if (array.length > 0) {
                var obj = {
                    "data": array,
                    "show_type": "double_combox"
                }
                data[dev_module_name] = obj;
            }
            // 底盘结构数据
            data[chassis_param.module_name] = chassis_param.data;

            var ok = _xml_wraper.toXml(JSON.stringify(data));
            AppActions.generateFileResult(ok);
        }
    }
}