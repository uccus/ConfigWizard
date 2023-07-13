import QtQuick 2.7
import QtQuick.Controls 2.2
import Toou2D 1.0

Item {
    property alias title: title_line.text
    height: content.visible ? title_line.height + content.height : title_line.height
    clip: true
    
    property var fake_data : [
        { name: "品牌", type: "combox", value: ["1", "2", "3"] },
        { name: "通讯站号", type: "combox", value: ["1", "2", "3"] }, 
        { name: "减速比", type: "lineEdit", value: "1" },
        { name: "品牌", type: "combox", value: ["1", "2", "3"] },
        { name: "通讯站号", type: "combox", value: ["1", "2", "3"] }, 
        { name: "品牌", type: "combox", value: ["1", "2", "3"] },
        { name: "通讯站号", type: "combox", value: ["1", "2", "3"] }, 
    ]
    
    Column {
        id: layout
        anchors.fill: parent
        spacing: 10
        
        TitleLine { id: title_line}
        
        Row {
            id: content
            visible: title_line.expanded
            width: parent.width
            // TLabel { text: "Title" }
            // TLabel { text: "Title" }
            Column {
                leftPadding: 10
                spacing: 10
                anchors.verticalCenter: parent.verticalCenter
                
                Repeater {
                    model: fake_data
                    delegate: DynComponent{}
                }
            }
            
            Item {
                width: 80; height: 10
            }
            
            TImage{
                anchors.verticalCenter: parent.verticalCenter
                source: "../images/4.png"
                width: sourceSize.width / 8
                height: sourceSize.height / 8
            }
        }
    }
}