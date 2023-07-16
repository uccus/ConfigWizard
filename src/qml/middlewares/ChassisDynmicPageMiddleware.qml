import QtQuick 2.0
import QuickFlux 1.1
import "../actions"
import "../components"

Middleware {

    filterFunctionEnabled: true

    // DynmicPage {
    //     id: dyn_page

    // }

    function loadChassisDynmicPage(message) {
        var tmp = Qt.createComponent("../components/DynmicPage.qml")
        var dyn_page = tmp.createObject(message.parent)

        dyn_page.width = message.parent.width
        dyn_page.title = message.data.title
        dyn_page.model_data = message.data.model
        dyn_page.imgSource = message.data.image.source
        dyn_page.imgWidth = message.data.image.width
        dyn_page.imgHeight = message.data.image.height
    }
}
