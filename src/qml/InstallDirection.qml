import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    property int current_index: 0

    implicitHeight: title_line.implicitHeight + row.height
    clip:true

    ListModel {
        id: check_model
        ListElement { name: "纵向正装"; image_source: "../images/FRC5000纵向正装.png" }
        ListElement { name: "横向正装"; image_source: "../images/FRC5000横向正装.png" }
        ListElement { name: "水平正装"; image_source: "../images/FRC5000水平正装.png" }
        ListElement { name: "纵向倒装"; image_source: "../images/FRC5000纵向倒装.png" }
    }

    TitleLine {
        id: title_line
        text: qsTr("控制器安装朝向")
        width: parent.width
        anchors {
            top: parent.top
        }
    }
    
    ButtonGroup {
        id: radio_group
        onClicked: {
            console.log("clicked " + button.text + " " + button.index)
            current_index = button.index
        }
        Component.onCompleted: {
            radio_group.buttons[0].checked = true
        } 
    }
    
    Component {
        id: check_pic
        Column {
            spacing: 10
            RadioButton {
                property int index: model.index
                text: model.name
                ButtonGroup.group: radio_group
            }
            Image {
                source: model.image_source
                width: sourceSize.width / 4
                height: sourceSize.height / 4
            }
        }
    }
    
    Row {
        id: row
        anchors {
            top: title_line.bottom
            horizontalCenter: parent.horizontalCenter
        }
        spacing: 20
        visible: !title_line.clicked
        Repeater {
            model: check_model
            delegate: check_pic
        }
    }
}