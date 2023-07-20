import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0

/** 
    动态图片或文字或啥也没有
*/
Rectangle {
    id: root
    // 图片
    property alias imgSource: img.source
    property alias imgWidth: img.width
    property alias imgHeight: img.height
    // 文字描述
    property var description: ""
    
    // implicitHeight: Math.max(img.height, desc.height)
    implicitHeight: imgHeight + desc.height + 5
    implicitWidth: visible ? 300 : 0
    
    // implicitHeight: imgHeight 
    // implicitHeight: 500
    // height: implicitHeight
    color: "#fafafa"
    visible: {
        return false;
        // 不起作用
        // return desc.visible || img.visible
    }

    ColumnLayout {
    // Column {
        id: col
        spacing: 5
        anchors.fill: parent

        TLabel {
            id: desc
            text: "    " + description
            // width: parent.width
            wrapMode: Text.WordWrap
            visible: {
                if (description !== ""){
                    root.visible = true;
                    return true;
                }
                return false;
            }
            Layout.fillWidth: true
            Layout.rightMargin: 20
            Layout.preferredWidth: 200

            // anchors {
            //     left: parent.left
            //     right: parent.right
            //     // horizontalCenter: parent.horizontalCenter
            //     // centerIn: parent
            // }
        }
        TImage {
            id: img
            // asynchronous: true
            fillMode: Image.PreserveAspectFit
            visible: {
                if (status === Image.Ready){
                    root.visible = true
                    return true;
                }
                return false;
            }

            Layout.rightMargin: 20
            Layout.preferredHeight: sourceSize.height * imgWidth / sourceSize.width
            Layout.preferredWidth: imgWidth
            Layout.maximumWidth: imgWidth
            Layout.alignment: Qt.AlignHCenter

            // anchors {
            //     // left: parent.left
            //     // right: parent.right
            //     // horizontalCenter: parent.horizontalCenter
            //     fill: parent
            //     rightMargin: 20
            // }
            Component.onCompleted: {
                // console.log("image", visible, status, Image.Ready, source, width, height, imgWidth, imgHeight)
            }
        }
    }
    
    Component.onCompleted: {
        // console.log("dyn content b", width, height)
    }
}