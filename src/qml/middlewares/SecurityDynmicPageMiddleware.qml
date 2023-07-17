import QtQuick 2.0
import QuickFlux 1.1
import "../actions"
import "../stores"
import "../pages"

Middleware {

    filterFunctionEnabled: true

    Column {
        id: content
        property alias model: dyn_page.model;
        spacing: 10
        Repeater {
            id: dyn_page
            delegate: DynmicPage{
                anchors {
                    left: parent.left
                    right: parent.right
                }

                title: modelData.title
                module_name: modelData.module_name
                model_data: modelData.model
            }
        }
    }
    
    Binding {
        target: content
        property: "model"
        value: MainStore.security.data
    }

    function loadSecurityDynmicPage(message) {
        content.width = message.parent.width
        content.parent = message.parent
    }
}
