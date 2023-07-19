import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0

/**
    字段描述：编辑框或下拉框
*/
Item {
    width: 180
    height: 40

    // 当前编辑项属于哪个模块
    property string module_name: ""
    // property var itemModel: model
    property var itemModel: model.modelData

    TLabel {
        id: label
        width: 50
        text: itemModel.desc
        anchors.verticalCenter: parent.verticalCenter
    }
    
    Column {
        id: col
        anchors {
            left: label.right
            leftMargin: 10
            verticalCenter: parent.verticalCenter
        }

        ComboBox {
            id: combox
            width: input.width
            height: input.height
            // model: ["1", "2", "3", "4", "5", "6", "7"]
            model: {
                return visible ? itemModel.combox_value.map(function(a) {return a.desc;}) : [];
            }
            visible: itemModel.show_type === "combox"
            // currentIndex: itemModel.value
            // TODO: 字段值的查询和更新
        }
        
        TInputField {
            id: input
            height: 30
            text: itemModel.value
            visible: itemModel.show_type === "input"
            // TODO: 字段值的查询和更新
        }
    }
}