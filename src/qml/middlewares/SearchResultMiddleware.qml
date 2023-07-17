import QtQuick 2.0
import QuickFlux 1.1
import Toou2D 1.0
import "../actions"
import "../stores"
import "../pages"

Middleware {
    filterFunctionEnabled: true
    
    Timer{
        id: timer
        interval: 500
    }
    
    Component {
        id: search_view
        SearchResultPage {
        }
    }

    Column {
        id: content
        property alias model: dyn_page.model;
        spacing: 10
        Repeater {
            id: dyn_page
            delegate: DynmicPage{
                anchors {
                    left: parent.left
                    right: parent.right
                }

                title: modelData.title
                module_name: modelData.module_name
                model_data: modelData.model
            }
        }
    }
    
    Binding {
        target: content
        property: "model"
        value: MainStore.search.data
    }
    
    function search(keyword) {
        // 清空
        MainStore.search.data = [];
        // 查找
        var objs = MainStore.chassis.search(keyword);
        // MainStore.search.data = [...MainStore.search.data, ...objs];
        MainStore.search.data = MainStore.search.data.concat(objs);
        objs = MainStore.location.search(keyword);
        // MainStore.search.data = [...MainStore.search.data, ...objs];
        MainStore.search.data = MainStore.search.data.concat(objs);
        objs = MainStore.security.search(keyword);
        // MainStore.search.data = [...MainStore.search.data, ...objs];
        MainStore.search.data = MainStore.search.data.concat(objs);
        objs = MainStore.vehicle.search(keyword);
        // MainStore.search.data = [...MainStore.search.data, ...objs];
        MainStore.search.data = MainStore.search.data.concat(objs);
        objs = MainStore.hc.search(keyword);
        // MainStore.search.data = [...MainStore.search.data, ...objs];
        MainStore.search.data = MainStore.search.data.concat(objs);

        MainStore.chassis.searchOther(keyword);

        return MainStore.search.data.length > 0 || 
                MainStore.search.chassis_install_direction_visible ||
                MainStore.search.chassis_structure_visible;
    }

    function debounce(message) {
        if (timer.running)  return;
        timer.start();

        next(ActionTypes.showBusy, {visible: true});
        // 关键字查找,生成新的model
        var res = search(message.keyword);
        if (res) {
            var message = {
                item: search_view,
                results: res
            }
            next(ActionTypes.goTo, message);
        }
        else{
            TToast.showWarning(qsTr("很抱歉，没有找到"), TTimePreset.LongTime4s);
            next(ActionTypes.showBusy, {visible: false});
        }
    }
    
    function searchKeyword(message){
        debounce(message)
    }
    
    function loadSearchResultPage(message) {
        content.width = message.parent.width
        content.parent = message.parent
        next(ActionTypes.showBusy, {visible: false});
    }
}