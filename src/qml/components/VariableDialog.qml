import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../components"

/**
    选择变量对话框
*/

TDialog {
    id: dlg
    // 为哪个输入变量选择
    property string input_key

    Item {
        id: root
        width: 500; height: 500
        
        // 当前的tab页名称
        property string tab_name: nav.currentIndex === 0 ? "custom_variable" : "hardware_variable";
        // 当前选择的项对应的索引
        property int current_index: tb1.currentIndex

        TNavigationBar {
            id: nav
            width: parent.width
            itemWidth: 60
            TNavigationElement{
                text: qsTr("自定义变量")
            }
            TNavigationElement{
                text: qsTr("硬件变量")
            }
            // TNavigationElement{
            //     text: qsTr("系统变量")
            // }

            children: [
                TDividerLine{
                    width: parent.width;
                    height: 1;
                    color: "#DCDCDC"
                    anchors.bottom: parent.bottom;
                }
            ]
        }
        
        ListModel {
            id: listModel
            ListElement {no: "1"; name:"DI0001"; desc:"急停";type: "BOOL"}
            ListElement {no: "2"; name:"DI0002"; desc:"";type: "BOOL"}
            ListElement {no: "3"; name:"DI0003"; desc:"触边";type: "BOOL"}
        }
        
        TRectangle {
            id: body
            width: parent.width
            anchors.top: nav.bottom
            anchors.bottom: parent.bottom
            
            XTableView {
                id: tb1
                visible: nav.currentIndex === 0
                anchors.fill: parent
                anchors.topMargin: 2
                headerList:["序号", "变量名称", "描述", "数据类型"]
                model: listModel
            }
            
            XTableView {
                id: tb2
                visible: nav.currentIndex === 1
                anchors.fill: parent
                anchors.topMargin: 2
                headerList:["序号", "变量名称", "描述", "数据类型"]
                model: listModel
            }
        }
    }
}
