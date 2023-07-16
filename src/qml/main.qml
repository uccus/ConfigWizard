import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.13
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
    color: "#fafafa"

    T2DWorld{ mouseAreaCursorShape: Qt.PointingHandCursor }
    MiddlewareList {
        applyTarget: AppActions
        ChassisDynmicPageMiddleware{
            
        }
    }

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
            
            Searchbar {
                Layout.alignment: Qt.AlignRight
            }

            ContentPage {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
            
            Footer {
                Layout.alignment: Qt.AlignRight
            }
        }
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
    
    // TBusyIndicator{
    //     id:bi;
    //     anchors.centerIn: parent;
    // }
}