import QtQuick 2.0
import QuickFlux 1.1
import "../actions"
import "."

Store {
    property int current_index: 0
    property string source: "DynmicMainPage.qml"
    // 参数检查引用计数
    property int check_ref: 0
    
    Filter {
        type: ActionTypes.toNextPage
        
        onDispatched: {
            if (current_index < MainStore.ui_data.length - 1){
                current_index += 1;
            }
        }
    }
    Filter {
        type: ActionTypes.toPrevPage
        
        onDispatched: {
            if (current_index > 0){
                current_index -= 1;
            }
        }
    }
    Filter {
        type: ActionTypes.toNextWizardPage
        onDispatched: {
            if (current_index == message.index) return;
            current_index = message.index;
        }
    }
}