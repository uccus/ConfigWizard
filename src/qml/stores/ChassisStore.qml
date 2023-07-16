import QtQuick 2.0
import QuickFlux 1.1
import "../actions"

Store {
    property string title: qsTr("底盘结构")
    property string type: ""
    property string img_source: "../../images/3.png"

    property alias direction: install_direction
    InstallDirectionStore {id: install_direction }
    
    property alias dynmic_data: dynmic_data
    ChassisDynmicStore {id: dynmic_data}
}