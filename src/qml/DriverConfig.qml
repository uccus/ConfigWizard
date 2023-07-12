import QtQuick 2.7
import QtQuick.Controls 2.2
import Toou2D 1.0

Item {
    // implicitHeight: title_line.implicitHeight + 500
    property alias title: title_line.text
    
    property var fake_data : [
        { name: "品牌", type: "combox", value: ["1", "2", "3"] },
        { name: "通讯站号", type: "combox", value: ["1", "2", "3"] }, 
        { name: "减速比", type: "lineEdit", value: "1" }
    ]
    
    anchors.fill: parent

    Column {
        anchors.fill: parent
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter

        TitleLine { id: title_line }
        
        Row {
            id: content
            visible: title_line.expanded
            spacing: 50
            // TLabel { text: "Title" }
            // TLabel { text: "Title" }
            Column {
                leftPadding: 10
                
                Repeater {
                    model: fake_data
                    delegate: DynComponent{}
                }
            }
            
            TImage{
                source: "../images/4.png"
                width: sourceSize.width / 8
                height: sourceSize.height / 8
            }
        }
    }
}