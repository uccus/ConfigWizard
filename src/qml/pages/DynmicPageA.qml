import QtQuick 2.7
import QtQuick.Layouts 1.3
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
    property alias model_data : inter.content_model
    // 子控件数据项
    property var child_model_data : []
    // 辅助信息
    property alias type: img.type
    // 图片
    property alias imgSource: img.imgSource
    property alias imgWidth: img.imgWidth
    property alias imgHeight: img.imgHeight
    // 空白
    // property alias blankWidth: blank.width
    // property alias blankHeight: blank.height
    
    implicitHeight: title_line.height + col.height + 30
    height: implicitHeight
    
    QtObject{
        id: inter
        property var content_model;
    }
    
    TitleLine {
        id: title_line
        text: "Title"
        anchors {
            left: parent.left
            right: parent.right
        }
    }
    
    Component {
        id: content
        DynContentA {
            model: inter.content_model
        }
    }

    Column {
        id: col
        clip: true
        spacing: 10
        height: title_line.expanded ? row.height + child.height : 0
        // height: title_line.expanded ? row.height : 0
        anchors {
            top: title_line.bottom
            left: parent.left
            right: parent.right
            margins: 10
        }
        
        // 主项
        RowLayout {
            id: row
            anchors {
                left: parent.left
                right: parent.right
            }
            // 动态内容
            Loader {
                id: content_loader
                Layout.fillWidth: true
                asynchronous: true
                sourceComponent: content
            }
            // 空白
            // Item {
            //     id: blank
            //     width: 10; height: 30
            // }
            // 动态图片或文字或空白
            DynContentB {
                id: img
                // visible: false
                Layout.fillWidth: true
                imgHeight: content_loader.height - 20
                // imgHeight:  50
            }
            // Component.onCompleted: {
            //     console.log("row", width, height)
            // }
        }
        
        // 子项
        Column {
            id: child
            clip: true
            visible: root.child_model_data.length > 0
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: 20
            }
            
            Component.onCompleted: {
                if (child.visible) {
                    for (var i = 0; i < root.child_model_data.length; i++){
                        var model = root.child_model_data[i];
                        var tmp = Qt.createComponent("DynmicPageA.qml");
                        var obj = tmp.createObject(child);
                        obj.width = child.width;
                        // obj.height = 200;
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
    
    Component.onCompleted: {
        console.log("dyn page", width, height)
    }
}