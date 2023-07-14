import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import Toou2D 1.0
import QuickFlux 1.1

Window {
    id: root
    visible: true
    width: 800; height: 800
    color: "#fafafa"

    property var fake_data : [
        {name: "底盘配置", uri: "ChassisPage.qml"},
        {name: "定位感知", uri: "LocationPage.qml"},
        {name: "安全防护", uri: "SecurityPage.qml"},
        {name: "载具功能", uri: "VehiclePage.qml"},
        {name: "人机交互", uri: "HCInteractionPage.qml"},
        {name: "其他", uri: "OthersPage.qml"},
    ];
    
    T2DWorld{
        mouseAreaCursorShape: Qt.PointingHandCursor
        appStartupTheme: "None"
        // appThemePaths: [
        //     "qrc:/themes/"
        // ]
    }

    MiddlewareList {
    }

    ListModel {
        id: wizard_model
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
        asynchronous: true
        onStatusChanged: bi.visible = status !==Loader.Ready
        // source: "VehiclePage.qml"
        
        function toPage(uri, title){
            source = uri;
            console.log("toPage: " + uri)
        }
        Component.onCompleted: {
            console.log("loader init fin")
        }
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
            if(wizard.index !== wizard_model.count - 1){
                wizard.index += 1
                loader.toPage(fake_data[wizard.index].uri, "测试")
            }
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
            if(wizard.index !== 0){
                wizard.index -= 1
                loader.toPage(fake_data[wizard.index].uri, "测试")
            }
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
    
    TBusyIndicator{
        id:bi;
        anchors.centerIn: parent;
    }

    Component.onCompleted: {
        // fake_data.forEach( d => {
        //     wizard_model.append(d);
        // });
        for(var i = 0; i < fake_data.length; i++) {
            wizard_model.append(fake_data[i]);
        }
    }
}