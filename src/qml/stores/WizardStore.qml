import QtQuick 2.0
import QuickFlux 1.1
import "../actions"

Store {
    property alias model: model
    property int current_index: 0
    property string source: "ChassisPage.qml"
    
    ListModel {
        id: model
        ListElement {name: "底盘配置"; uri: "ChassisPage.qml"}
        ListElement {name: "定位感知"; uri: "LocationPage.qml"}
        ListElement {name: "安全防护"; uri: "SecurityPage.qml"}
        ListElement {name: "载具功能"; uri: "VehiclePage.qml"}
        ListElement {name: "人机交互"; uri: "HCInteractionPage.qml"}
        ListElement {name: "其他"; uri: "OthersPage.qml"}
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
}