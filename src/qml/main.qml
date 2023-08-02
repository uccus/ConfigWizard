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
    width: 820; height: 800
    minimumWidth: 820
    maximumWidth: 820
    minimumHeight: 800
    maximumHeight: 800
    color: "#fafafa"
    title: qsTr("组态向导")

    T2DWorld{ mouseAreaCursorShape: Qt.PointingHandCursor }

    MiddlewareList {
        applyTarget: AppActions

        // SearchResultMiddleware {}
        // NavigationMiddleware {stack: stack}
        SelectVariableMiddleware{}
        BusyIndicatorMiddleware{bi: bi}
        CheckParamMiddleware{}
        GenerateFileMiddleware{}
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

    Component.onCompleted: {
        // console.log("----->", JSON.stringify(MainStore.data.stop));
        if ("dev_assicoate" in MainStore.data) {
            for(var i = 0; i < MainStore.data.dev_assicoate.length; i++) {
                var tmp = MainStore.data.dev_assicoate[i];
                MainStore.dev_list_model.append(tmp);
            }
        }
    }
    
    StackView {
        id: stack
        anchors.fill: parent
        initialItem: main
    }

    TBusyIndicator{
        id:bi;
        visible: true
        anchors.centerIn: parent;
    }

    onClosing: {
        // console.log("------->");
        Qt.exit(-1);
    }
}