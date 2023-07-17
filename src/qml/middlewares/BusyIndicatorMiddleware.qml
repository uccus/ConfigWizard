import QtQuick 2.0
import QuickFlux 1.1
import "../actions"
import "../stores"
import "../pages"

Middleware {
    property var bi;

    filterFunctionEnabled: true

    function showBusy(message) {
        bi.visible = message.visible;
    }
}
