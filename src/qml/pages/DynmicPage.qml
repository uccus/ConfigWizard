import QtQuick 2.7
import Toou2D 1.0
import "../components"

Item {
    id: root
    clip: true
    // 标题
    property alias title: title_line.text
    // 模块内部键
    property string module_name
    // 数据项
    property alias model_data : content.model
    // 子数据项
    property var child_model_data : []
    // 图片
    property alias imgSource: img.source
    property alias imgWidth: img.width
    property alias imgHeight: img.height
    // 空白
    property alias blankWidth: blank.width
    property alias blankHeight: blank.height
    // 子控件
    property bool has_child: false
    
    implicitWidth: title_line.width
    implicitHeight: title_line.height + rect.height + 10
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
        id: rect
        clip:true
        color: "#fafafa"
        height: title_line.expanded ? Math.max(content.height + option.height, img.height) + 10 : 0
        anchors {
            left: parent.left
            right: parent.right
            top: title_line.bottom
            margins: 10
        }

        // TODO...位置
        Column{
            id: content
            property alias model: r.model
            spacing: 10
            
            Repeater {
                id: r
                delegate: DynComponentA{
                    module_name: root.module_name
                }
            }
        }
        
        Item {
            id: blank
            width: 50; height:10
            anchors {
                left: content.right
            }
        }
        
        TImage {
            id: img
            fillMode: Image.PreserveAspectFit
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                margins: 10
            }
        }

        // 可选
        Column {
            id: option
            visible: root.has_child
            leftPadding: 10
            anchors {
                top: content.bottom
                left: parent.left
                margins: 10
            }
            
            Component.onCompleted: {
                if (option.visible) {
                    for (var i = 0; i < root.child_model_data.length; i++){
                        var model = root.child_model_data[i];
                        var tmp = Qt.createComponent("DynmicPage.qml");
                        var obj = tmp.createObject(option);
                        obj.width = 280;
                        obj.module_name = model.module_name
                        obj.title = model.title;
                        obj.model_data = model.model;
                    }
                }
            }
        }
        Behavior on height {
            NumberAnimation {
                duration: 200
            }
        }
    }

}