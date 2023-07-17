import QtQuick 2.0
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../stores"
import "../actions"

Item {
    width: 200; height: 40
    RowLayout {
        anchors.fill: parent

        TButton {
            label.text: qsTr("上一步")
            onClicked: AppActions.toPrevPage()
        }

        TButton {
            label.text: qsTr("下一步")
            onClicked: AppActions.toNextPage()
        }

        TButton {
            label.text: qsTr("完成")
        }
    }
}