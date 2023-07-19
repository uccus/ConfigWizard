import QtQuick 2.0
import QuickFlux 1.1
import "../actions"

Store {
    property alias model: model
    property int current_index: 0
    // property string source: "ChassisPage.qml"
    property string source: "DynmicMainPage.qml"
    
    ListModel {
        id: model
        ListElement {name: "chassis"; desc: "底盘配置"; uri: "DynmicMainPage.qml"}
        ListElement {name: "location"; desc: "定位感知"; uri: "DynmicMainPage.qml"}
        ListElement {name: "safty"; desc: "安全防护"; uri: "DynmicMainPage.qml"}
        ListElement {name: "vehicle"; desc: "载具功能"; uri: "DynmicMainPage.qml"}
        ListElement {name: "hc"; desc: "人机交互"; uri: "DynmicMainPage.qml"}
        ListElement {name: "other"; desc: "其他"; uri: "DynmicMainPage.qml"}
    }
    
    Filter {
        type: ActionTypes.toNextPage
        
        onDispatched: {
            if (current_index < model.count - 1){
                current_index += 1;
                // 相同页面，清空后加载
                source = "";
                source = model.get(current_index).uri;
            }
        }
    }
    Filter {
        type: ActionTypes.toPrevPage
        
        onDispatched: {
            if (current_index > 0){
                current_index -= 1;
                // 相同页面，清空后加载
                source = "";
                source = model.get(current_index).uri;
            }
        }
    }
    Filter {
        type: ActionTypes.toNextWizardPage
        onDispatched: {
            if (current_index == message.index) return;
            current_index = message.index;
            // 相同页面，清空后加载
            source = "";
            source = model.get(current_index).uri;
        }
    }
}