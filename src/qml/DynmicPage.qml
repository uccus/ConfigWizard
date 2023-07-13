import QtQuick 2.7
import Toou2D 1.0

Item {
    id: root
    clip: true
    // 标题
    property alias title: title_line.text
    // 数据项
    property var model_data : []
    // 图片
    property alias imgSource: img.source
    property alias imgWidth: img.width
    property alias imgHeight: img.height
    // 空白
    property alias blankWidth: blank.width
    property alias blankHeight: blank.height

    implicitWidth: title_line.width
    implicitHeight: content.visible ? title_line.height + content.height : title_line.height
    width: implicitWidth; height: implicitHeight

    TitleLine {
        id: title_line
        text: "Title"
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
    }

    Rectangle {
        clip:true
        color: "#fafafa"
        height: content.height
        anchors {
            left: parent.left
            right: parent.right
            top: title_line.bottom
            margins: 10
        }

        Row {
            id: content
            visible: title_line.expanded
            Column{
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                
                Repeater {
                    model: model_data
                    delegate: DynComponentA{}
                }
            }
            
            Item { id: blank; width: 50; height:10 }
            
            TImage {
                id: img
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    Behavior on height {
        NumberAnimation {
            duration: 200
        }
    }
}