import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id: root
    visible: true
    width: 800; height: 800
    
    ListModel{
        id: wizard_model;
        ListElement{ name: "底盘配置" }
        ListElement{ name: "定位感知" }
        ListElement{ name: "安全防护" }
        ListElement{ name: "载具功能" }
        ListElement{ name: "人机交互" }
        ListElement{ name: "其他" }
    }
    
    Wizard {
        id: wizard
        model: wizard_model
        index: 0
        width: 150;
        anchors{
            top: parent.top;
            left: parent.left;
            bottom: parent.bottom;
        }
        
    }
    
    RoundButton {
        id: btn_next
        radius: 5
        width: 80; height: 30
        anchors{
            bottom: parent.bottom
            right: btn_finish.left
            margins: 15
        }
        Text {
            text: qsTr("下一步")
            anchors.centerIn: parent
            font.pixelSize: 20
        }
        onClicked: {
            if(wizard.index !== wizard_model.count - 1)
                wizard.index += 1
        }
    }

    RoundButton {
        id: btn_prev
        radius: 5
        width: 80; height: 30
        anchors{
            bottom: parent.bottom
            right: btn_next.left
            margins: 15
        }
        Text {
            text: qsTr("上一步")
            anchors.centerIn: parent
            font.pixelSize: 20
        }
        onClicked: {
            if(wizard.index !== 0)
                wizard.index -= 1
        }
    }

    RoundButton {
        id: btn_finish
        radius: 5
        width: 80; height: 30
        anchors{
            bottom: parent.bottom
            right: parent.right
            margins: 15
        }
        Text {
            text: qsTr("完成")
            anchors.centerIn: parent
            font.pixelSize: 20
        }
        enabled: wizard.index === wizard_model.count - 1
        onClicked: {
            // wizard.index -= 1
            console.log("finished");
        }
    }
}