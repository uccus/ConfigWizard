import QtQuick 2.0
import QuickFlux 1.1
import Toou2D 1.0
import "../actions"
import "../stores"
import "../pages"

Middleware {
    filterFunctionEnabled: true

    function toNextPage(message){
        if (MainStore.wizard.check_ref > 0)
            next(ActionTypes.generateFileResult, {result: false, message: qsTr("参数不能为空")});
        else
            next(ActionTypes.toNextPage);
    }
    
    function toNextWizardPage(message){
        if (MainStore.wizard.check_ref > 0)
            next(ActionTypes.generateFileResult, {result: false, message: qsTr("参数不能为空")});
        else
            next(ActionTypes.toNextWizardPage, {index: message.index});
    }

    function finished(message) {
        if (MainStore.wizard.check_ref > 0)
            next(ActionTypes.generateFileResult, {result: false, message: qsTr("参数不能为空")});
        else
            next(ActionTypes.finished);
    }
}