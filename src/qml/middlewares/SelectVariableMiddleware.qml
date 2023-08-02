import QtQuick 2.0
import QuickFlux 1.1
import Toou2D 1.0
import "../actions"
import "../stores"
import "../pages"
import "../components"

Middleware {
    filterFunctionEnabled: true
    
    VariableDialog {
        id: dlg
        titleText: qsTr("选择变量")
        closeable: true
        buttons: [
            TDialogButton{
                id: btn_select
                label.text: qsTr("选择")
                label.font.bold: true;
                label.font.pixelSize: TPixelSizePreset.PH4
                label.color: "#46A0FC"
            },
            TDialogButton{
                id: btn_cancel
                label.text: qsTr("取消")
                label.font.bold: true;
                label.font.pixelSize: TPixelSizePreset.PH4
                label.color: "#46A0FC"
            }
        ]
        
        onTriggered: {
            if (button === btn_select)
                console.log(item.tab_name, item.current_index);

            hideAndClose();
        }
    }
    
    function selectVariable(message) {
        dlg.open();
    }
}