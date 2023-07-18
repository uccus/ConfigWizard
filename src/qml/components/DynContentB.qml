import QtQuick 2.7
import QtQuick.Controls 2.7
import QtQuick.Layouts 1.3
import Toou2D 1.0

/** 
    动态图片或文字或啥也没有
*/
Rectangle {
    // 显示类型
    property string type: "image"   //  也可以是"text"
    // 图片
    property alias imgSource: img.source
    property alias imgWidth: img.width
    property alias imgHeight: img.height
    // 文字描述
    property alias description: desc.text
    
    implicitHeight: Math.max(img.height, desc.height)
    height: implicitHeight
    color: "#fafafa"

    TImage {
        id: img
        visible: type === "image"
        fillMode: Image.PreserveAspectFit
        anchors.centerIn: parent
    }
    TLabel {
        id: desc
        text: "    " + "这是一长串的描述;这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述"
        width: parent.width
        wrapMode: Text.WordWrap
        visible: type === "text"
        anchors.centerIn: parent
    }
}