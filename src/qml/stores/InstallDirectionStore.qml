import QtQuick 2.0
import QuickFlux 1.1
import "../actions"

Store {
    property int current_index: 0
    property var model: model
    property string title: qsTr("控制器安装朝向")
    
    ListModel {
        id: model
        ListElement { desc: "纵向正装"; source: "../../images/FRC5000纵向正装.png" }
        ListElement { desc: "横向正装"; source: "../../images/FRC5000横向正装.png" }
        ListElement { desc: "水平正装"; source: "../../images/FRC5000水平正装.png" }
        ListElement { desc: "纵向倒装"; source: "../../images/FRC5000纵向倒装.png" }
        ListElement { desc: "纵向倒装"; source: "../../images/FRC5000纵向倒装.png" }
        ListElement { desc: "纵向倒装"; source: "../../images/FRC5000纵向倒装.png" }
        ListElement { desc: "纵向倒装"; source: "../../images/FRC5000纵向倒装.png" }
    }
    
    Filter {
        type: ActionTypes.updateInstallDirection
        onDispatched: current_index = message.index
    }
}