import QtQuick 2.7
import QtQuick.Controls 2.2

/*数据更新前，设置DataTableView.model=[],新数据加载时表格会根据新数据重新计算表头*/
ListView {
    id: listView
    clip: true
    header: headerView
    contentWidth: headerList.length*columnsWidth

    // ScrollBar.horizontal: ScrollBar {
    //     contentItem: Rectangle {
    //         color: scrollBarColor
    //     }
    // }
    // ScrollBar.vertical: ScrollBar{
    //     contentItem: Rectangle {
    //         color: scrollBarColor
    //     }
    // }

    property var headerList: model.isQmlModel?model.getHeaderList():Object.keys(model.get(0)).reverse()
    property int columnsWidth: 120
    property int headerHeight: 40
    property int rowsHeight: 30
    property color headerTextColor:"#1c262b"
    property color headerBackgroundColor: "#eaedf4"
    property int headerTextSize: 13
    property string headerFontFamily: "微软雅黑"
    property color backgroundColor: "#fff"
    property color gridColor: "#969696"
    property int gridPoint: 1
    property color textColor: "#969696"
    property int textSize: 11
    property string textFontFamily: "微软雅黑"
    property color scrollBarBgColor: "#cc17719b"
    property color scrollBarColor: "#ccc"
    property bool scrollBarHorizontalVisible: false
    property bool scrollBarVerticalVisible: false

    //    property var modelColumnsList: model.isQmlModel?model.getHeaderList():Object.keys(model.get(0)).reverse()

    boundsBehavior: Flickable.StopAtBounds

    // move: Transition {
    //     NumberAnimation { properties: "x,y"; duration: 1000 }
    // }

    Component{
        id:headerView
        Rectangle{
            width: contentWidth
            height: headerHeight
            color: headerBackgroundColor
            z:15
            property var headerRepeater: headerRepeater
            Row{
                Repeater{
                    id: headerRepeater
                    model: headerList
                    Label{
                        width: columnsWidth
                        height: headerHeight
                        color: headerTextColor
                        text: model.modelData
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: headerFontFamily
                        font.pointSize: headerTextSize
                        // background: Rectangle{
                        //     color: "#00000000"
                        //     border.color: gridColor
                        //     border.width: gridPoint
                        // }
                    }
                }
            }
        }
    }

    Component{
        id: listDelegate
        Item{
            width: contentWidth
            height: rowsHeight

            property var myModel: model
            property var modelColumnsList: listView.model.isQmlModel ? listView.model.getHeaderList() : Object.keys(listView.model.get(0)).reverse()

            Row{
                Repeater{
                    id: delegateRepeater
                    model: headerList
                    Rectangle {
                        color: "blue"
                        border {
                            width: 1
                            color: "red"
                        }
                    }
                    Label{
                        width: listView.headerItem.headerRepeater.itemAt(index).width
                        height: rowsHeight
                        color: textColor
                        text:typeof(myModel[modelColumnsList[index]])!="undefined"?myModel[modelColumnsList[index]]:""
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: textFontFamily
                        font.pointSize: textSize
                        elide:Text.ElideRight
                    }
                }
            }
            MouseArea {
                id: m
                anchors.fill: parent
                onClicked: listView.currentIndex = index
            }
        }
    }
    
    delegate: listDelegate
    focus: true
    highlight: Rectangle {
        color: "#e9eaec"
    }

    // onCurrentItemChanged: {
    //     console.log("index:", listView.currentIndex)
    // }

    function setColumnWidth(index,width){
        var headerItem = listView.headerItem.headerRepeater.itemAt(index)
        listView.contentWidth = listView.contentWidth - headerItem.width+width
        headerItem.width = width
    }

    function getColumnWidth(index){
        var headerItem = listView.headerItem.headerRepeater.itemAt(index)
        return headerItem.width
    }

    function clear(){
        listView.model = []
    }

    function setHeaderList(list){
        listView.headerList = list
        contentWidth =list.length*listView.columnsWidth
    }

}
