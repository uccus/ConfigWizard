import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id: root
    visible: true
    width: 800; height: 800
    
    property var fake_data: {
        "wizard": [
            {name: "底盘配置"},
            {name: "定位感知"},
            {name: "安全防护"},
            {name: "载具功能"},
            {name: "人机交互"},
            {name: "其他"},
        ]
    }
    
    Wizard {
        id: wizard
        model: fake_data.wizard
        index: 0
        width: 150;
        anchors{
            top: parent.top;
            left: parent.left;
            bottom: parent.bottom;
        }
    }
    
    Searchbar {
        id: searchbar
        width: 250;
        anchors {
            top: parent.top;
            right: parent.right
            margins: 15
        }

        onBeginSearch: {
            console.log("开始搜索" + val)
        }
    }
    
    ContentArea {
        id: content
        anchors {
            left: wizard.right
            top: searchbar.bottom
            right: parent.right
            bottom: btn_next.top
            margins: 15
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
        StyledText {
            text: qsTr("下一步")
            anchors.centerIn: parent
            font.pixelSize: 20
        }
        onClicked: {
            if(wizard.index !== wizard_model.count - 1)
                wizard.index += 1
            console.log(content.current_index)
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
        StyledText {
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
        StyledText {
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