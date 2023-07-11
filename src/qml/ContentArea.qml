import QtQuick 2.0

Rectangle {
    property alias current_index: chass_page.current_index
    Column {
        anchors.fill: parent
        ChassisPage {
            id: chass_page
            anchors.fill: parent
            visible: true
        }
    }
}