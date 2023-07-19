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
    property string module_name: ""
    // 数据项
    property alias model_data : inter.content_model
    property alias radio_model_data: inter.radio_model
    // 子控件数据项
    property var child_model_data : []
    // 图片
    // property alias imgSource: img.imgSource
    // property alias imgWidth: img.imgWidth
    // property alias imgHeight: img.imgHeight
    property alias imgSource: inter.imgSource
    property alias imgWidth: inter.imgWidth
    property alias imgHeight: inter.imgHeight
    // 文字描述
    // property alias description: img.description
    property alias description: inter.description
    // 空白
    // property alias blankWidth: blank.width
    // property alias blankHeight: blank.height
    
    implicitHeight: title_line.height + col.height + 30
    // implicitHeight: 500
    height: implicitHeight
    
    QtObject{
        id: inter
        property var content_model: [];
        property var radio_model: [];

        property var imgSource;
        property var imgWidth;
        property var imgHeight;
        property var description;
    }
    
    TitleLine {
        id: title_line
        text: "Title"
        anchors {
            left: parent.left
            right: parent.right
        }
    }
    
    // 字段值的编辑项
    Component {
        id: content
        DynContentA {
            model: inter.content_model
        }
    }

    // 文字图片描述
    Component {
        id: desc_content
        DynContentB {
            imgSource: inter.imgSource
            imgWidth: inter.imgWidth
            imgHeight: inter.imgHeight
            description: inter.description
        }
    }
    
    // radio button 可选项
    Component {
        id: radio_content
        DynContentC {
            model: inter.radio_model
        }
    }

    // Column {
    ColumnLayout {
        id: col
        clip: true
        // spacing: 10
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
        // Row {
            id: row
            Layout.fillWidth: true
            // 动态编辑内容
            Loader {
                id: content_loader
                visible: inter.content_model.length > 0
                // visible: false
                Layout.fillWidth: true
                asynchronous: true
                sourceComponent: content
            }
            // 动态选择框
            Loader {
                id: radio_loader
                visible: inter.radio_model.length > 0
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.preferredWidth: 500
                // width: row.width
                asynchronous: true
                sourceComponent: radio_content
            }
            // 空白
            // Item {
            //     id: blank
            //     width: 10; height: 30
            // }
            // 动态图片或文字或空白
            Loader {
                id: pic_desc
                Layout.fillWidth: true
                asynchronous: true
                sourceComponent: desc_content
            }
        }
        
        // 子项
        Column {
            id: child
            clip: true
            visible: root.child_model_data.length > 0
            // visible: true
            // anchors {
            //     left: parent.left
            //     right: parent.right
            //     leftMargin: 20
            // }
            // Layout.fillHeight: true
            Layout.fillWidth: true
            // width: row.width
            Layout.leftMargin: 20
            
            // Rectangle {
            //     width:200; height: 100
            //     color: "red"
            // }

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
                        obj.model_data = "model" in model ? model.model : [];
                        obj.radio_model_data = "radio_model" in model ? model.radio_model : []
                        obj.imgSource = "image" in model ? model.image.source : "";
                        obj.imgWidth = "image" in model ? model.image.width : 0;
                        obj.imgHeight = "image" in model ? model.image.height : 0;
                        obj.description = "description" in model ? model.description : "";
                        obj.child_model_data = "child_model_data" in model ? model.child_model_data : [];
                        // var obj = Qt.createQmlObject("import QtQuick 2.7; import QtQuick.Controls 2.7; Rectangle{}", child);
                        // obj.width = 300;
                        // obj.height = 300;
                        // obj.color = "red";
                    }
                }
                
                // console.log("child page", width, height);
            }
        }
        Behavior on height {
            NumberAnimation {
                duration: 200
            }
        }
    }
    
    Component.onCompleted: {
        // console.log("dyn page", width, height, title)
    }
}