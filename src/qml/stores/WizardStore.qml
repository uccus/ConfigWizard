﻿import QtQuick 2.0
import QuickFlux 1.1
import "../actions"
import "."

Store {
    property int current_index: 0
    property string source: "DynmicMainPage.qml"
    
    Filter {
        type: ActionTypes.toNextPage
        
        onDispatched: {
            if (current_index < MainStore.ui_data.length - 1){
                current_index += 1;
                // 相同页面，清空后加载
                // source = "";
                // source = "DynmicMainPage.qml"
            }
        }
    }
    Filter {
        type: ActionTypes.toPrevPage
        
        onDispatched: {
            if (current_index > 0){
                current_index -= 1;
                // 相同页面，清空后加载
                // source = "";
                // source = "DynmicMainPage.qml"
            }
        }
    }
    Filter {
        type: ActionTypes.toNextWizardPage
        onDispatched: {
            if (current_index == message.index) return;
            current_index = message.index;
            // 相同页面，清空后加载
            // source = "";
            // source = "DynmicMainPage.qml"
        }
    }
}