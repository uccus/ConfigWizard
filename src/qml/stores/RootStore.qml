import QtQuick 2.0
import QuickFlux 1.1

Store{
    property alias wizard: wizard
    WizardStore { id: wizard}
    
    property alias chassis: chassis
    ChassisStore {id: chassis}

    property alias location: location
    LocationDynmicStore {id: location}

    property alias security: security
    SecurityDynmicStore {id: security}

    property alias vehicle: vehicle
    VehicleDynmicStore {id: vehicle}

    property alias hc: hc
    HCInteractionDynmicStore {id: hc}
    
    property alias search: search
    SearchResultStore{id: search}

    // 查找并更新字段值
    function findAndUpdateValue(data_in, module_name, name, value) {
        console.log("prepare to update ", module_name, name, value);
        for(var i = 0; i < data_in.length; i++){
            // 找对应模块
            if (data_in[i].module_name === module_name) {
                console.log("got the module: ", module_name)
                // 找对应键
                for(var j = 0; j < data_in[i].model.length; j++) {
                    if (data_in[i].model[j].name === name) {
                        data_in[i].model[j].value = value;
                        console.log("update data: ", name, value, "actually", data_in[i].model[j].value)
                        break;
                    }
                }
                break;
            }
            else if (data_in[i].has_child){
                findAndUpdateValue(data_in[i].child_model_data, module_name, name, value);
            }
        }
    }

    // 关键字搜索
    function searchData(data, keyword){
        var objs_find = []
        // console.log("prepare to search", keyword)
        for(var i = 0; i < data.length; i++){
            var subObj = data[i];
            // console.log("searching", subObj.title);

            if (subObj.title.toLowerCase().includes(keyword.toLowerCase())){
                // console.log("got it", keyword)
                objs_find.push(subObj);
                continue;
            }
            else {
                var subModels = [];
                for(var j = 0; j < subObj.model.length; j++){
                    var subModel = subObj.model[j];
                    // console.log("searching", subModel.desc);
                    if (subModel.desc.toLowerCase().includes(keyword.toLowerCase())){
                        // console.log("got it", keyword)
                        subModels.push(subModel);
                    }
                }
                if (subModels.length > 0) {
                    var obj = {};
                    obj.module_name = subObj.module_name;
                    obj.title = subObj.title;
                    obj.model = subModels;
                    objs_find.push(obj);
                }
                if (subObj.has_child){
                    var objs = searchData(subObj.child_model_data, keyword);
                    // objs_find = [...objs_find, ...objs];
                    objs_find = objs_find.concat(objs);
                }
            }
        }
        return objs_find;
    }
}