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
        ListElement {name: "chassis"; desc: "底盘配置"; uri: "ChassisPage.qml"}
        ListElement {name: "location"; desc: "定位感知"; uri: "LocationPage.qml"}
        ListElement {name: "safty"; desc: "安全防护"; uri: "SecurityPage.qml"}
        ListElement {name: "vehicle"; desc: "载具功能"; uri: "VehiclePage.qml"}
        ListElement {name: "hc"; desc: "人机交互"; uri: "HCInteractionPage.qml"}
        ListElement {name: "other"; desc: "其他"; uri: "OthersPage.qml"}
    }
    
    Filter {
        type: ActionTypes.toNextPage
        
        onDispatched: {
            if (current_index < model.count - 1){
                current_index += 1;
                source = model.get(current_index).uri;
            }
        }
    }
    Filter {
        type: ActionTypes.toPrevPage
        
        onDispatched: {
            if (current_index > 0){
                current_index -= 1;
                source = model.get(current_index).uri;
            }
        }
    }
    Filter {
        type: ActionTypes.toNextWizardPage
        onDispatched: {
            current_index = message.index;
            source = model.get(current_index).uri;
        }
    }
}