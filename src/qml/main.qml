import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import QuickFlux 1.1
import "./pages"
import "./stores"
import "./actions"
import "./components"
import "./middlewares"

Window {
    id: root
    visible: true
    width: 800; height: 800
    minimumWidth: 600
    color: "#fafafa"

    T2DWorld{ mouseAreaCursorShape: Qt.PointingHandCursor }

    MiddlewareList {
        applyTarget: AppActions

        // SearchResultMiddleware {}
        // NavigationMiddleware {stack: stack}
        // ChassisDynmicPageMiddleware{}
        // LocationDynmicPageMiddleware{}
        // SecurityDynmicPageMiddleware{}
        // VehicleDynmicPageMiddleware{}
        // HCInteractionDynmicPageMiddleware{}
        BusyIndicatorMiddleware {bi: bi}
    }

    Component {
        id: main
        RowLayout {
            anchors.fill: parent

            WizardPage {
                id: wizard
                width: 150
                Layout.fillHeight: true
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.rightMargin: 15
                spacing: 10
            
                // Searchbar {
                //     Layout.alignment: Qt.AlignRight
                // }
                
                ContentPage {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            
                Footer {
                    Layout.alignment: Qt.AlignRight
                }
            }
        }
    }
    
    StackView {
        id: stack
        anchors.fill: parent
        initialItem: main
    }

    // TDialog{
    //     id:dialog
    //     titleText: "Hi Toou2D";
    //     contentText: "This a dialog style for default"
    //     buttons: [
    //         TDialogButton{
    //             label.text: "Agree"
    //             label.font.bold: true;
    //             label.font.pixelSize: TPixelSizePreset.PH5
    //             label.color: "#46A0FC"
    //         }
    //     ]

    //     onTriggered: hideAndClose();
    // }

    TBusyIndicator{
        id:bi;
        visible: true
        anchors.centerIn: parent;
    }
    
    // Component.onCompleted: {
    //     console.log(_test_ui_data);
    //     MainStore.ui_data = JSON.parse("{\"name\": \"chassis\", 	\"model\": [{ 		\"module_name\": \"chassis_base\", 		\"title\": \"chassis base\", 		\"image\": { 			\"source\": \"../../images/3.png\", 			\"width\": 300, 			\"height\": 150 		}, 		\"description\": \"1231213\" 	}] }");
    // }
}