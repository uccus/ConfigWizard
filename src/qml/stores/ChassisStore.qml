import QtQuick 2.0
import QuickFlux 1.1
import "../actions"
import "."

Store{
    property string module_name: ""
    property string chassis_type: "two_wheel_steer"

    property string source: {
        for(var i = 0; i < model.length; i++){
            if (model[i].type === chassis_type){
                return model[i].source;
            }
        }
        return "";
    }
    
    property var model: [
       {type: "two_wheel_steer", source: "TwoWheelSteel.qml"}
    ]
    
    // 来自c++
    property var default_value: _chassis_default_value
    
    property var data: {"type": chassis_type, "show_type": "chassis_param"}
}