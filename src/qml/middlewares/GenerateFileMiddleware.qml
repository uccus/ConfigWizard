import QtQuick 2.0
import QuickFlux 1.1
import Toou2D 1.0
import "../actions"
import "../stores"
import "../pages"

Middleware {
    filterFunctionEnabled: true

    TDialog{
        id: dialog
        titleText: qsTr("提示");
        contentText: ""
        buttons: [
            TDialogButton{
                label.text: qsTr("好的")
                label.font.bold: true;
                label.font.pixelSize: TPixelSizePreset.PH5
                label.color: "#46A0FC"
            }
        ]

        onTriggered: hideAndClose();
    }

    function generateFileResult(message){
        if (message.result) {
            dialog.contentText = qsTr("生成成功");
            dialog.open();
        }
        else {
            dialog.contentText = message.message;
            dialog.open();
        }
    }
}