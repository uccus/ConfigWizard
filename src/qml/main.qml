import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import Toou2D 1.0

Window {
    id: root
    visible: true
    width: 800; height: 800
    color: "#fafafa"
    
    T2DWorld{
        // mouseAreaCursorShape: Qt.PointingHandCursor
        appStartupTheme: "None"
        // appThemePaths: [
        //     "qrc:/themes/"
        // ]
    }

    ListModel {
        id: wizard_model
        ListElement {name: "底盘配置"}
        ListElement {name: "定位感知"}
        ListElement {name: "安全防护"}
        ListElement {name: "载具功能"}
        ListElement {name: "人机交互"}
        ListElement {name: "其他"}
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

    TInputField{
        id: searchbar
        width: 180
        placeholderIcon.source: TAwesomeType.FA_search
        placeholderLabel.text: "type something"
        anchors {
            top: parent.top;
            right: parent.right
            margins: 15
        }
        Keys.onPressed: {
            if (event.key === Qt.Key_Return) {
                console.log("开始搜索...." + " " + searchbar.text)
                TToast.showInfo("提示",TTimePreset.LongTime4s,"开始搜索...");
                // dialog.open();
            }
        }
    }
    
    // ComboBox {
    //     editable: true
    //     model: [1, 2, 3, 4, 5, 6, 7, 8, 9]
    //     width: 100; height: 30
    //     anchors.centerIn: parent
    // }
    
    Loader {
        id: loader
        clip: true
        anchors {
            top: searchbar.bottom
            bottom: btn_next.top
            left: wizard.right
            right: parent.right
            bottomMargin: 15
        }
        source: "ChassisPage.qml"
    }
    
    TButton {
        id: btn_next
        width: 80; height: 30
        label.text: qsTr("下一步")
        anchors{
            bottom: parent.bottom
            right: btn_finish.left
            margins: 15
        }
        onClicked: {
            if(wizard.index !== wizard_model.count - 1)
                wizard.index += 1
            console.log(content.current_index)
        }
    }

    TButton {
        id: btn_prev
        focus: true
        label.text: qsTr("上一步")
        width: 80; height: 30
        anchors{
            bottom: parent.bottom
            right: btn_next.left
            margins: 15
        }
        onClicked: {
            if(wizard.index !== 0)
                wizard.index -= 1
        }
    }

    TButton {
        id: btn_finish
        focus: true
        label.text: qsTr("完成")
        width: 80; height: 30
        anchors{
            bottom: parent.bottom
            right: parent.right
            margins: 15
        }
        enabled: wizard.index === wizard_model.count - 1
        onClicked: {
            console.log("finished");
        }
    }

    TDialog{
        id:dialog
        titleText: "Hi Toou2D";
        contentText: "This a dialog style for default"
        buttons: [
            TDialogButton{
                label.text: "Agree"
                label.font.bold: true;
                label.font.pixelSize: TPixelSizePreset.PH5
                label.color: "#46A0FC"
            }
        ]

        onTriggered: hideAndClose();
    }
}