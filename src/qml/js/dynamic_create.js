function findIndexByValue(arr, field_name, value) {
    for (var i = 0; i < arr.length; i++) {
      if (arr[i][field_name] === value) {
        return i;
      }
    }
    return -1; // 如果未找到匹配的元素，则返回 -1
}

function findValueByIndex(arr, field_name, index){
    if (arr.length > index) {
        return arr[index][field_name];
    }
    return "";
}

function createLabel(parent) {
    var obj = Qt.createQmlObject(
        "import QtQuick 2.0"    + "\n" +
        "import Toou2D 1.0"     + "\n" +
        "TLabel {"              + "\n" +
        "    clip: true"        + "\n" +
        "    width: 80"         + "\n" +
        "    anchors.verticalCenter: parent.verticalCenter"  + "\n" +
        "}"
        ,
        parent,
        "dyn_create_obj"
    );
    
    return obj;
}

/**
 * module_name: 当前下拉框所属模块
 * name: 当前下拉框内部键
 */
function createCombox(parent) {
    var obj = Qt.createQmlObject(
        "import QtQuick 2.0" + "\n" +
        "import QtQuick.Controls 2.2" + "\n" +
        "import \"../actions\"" + "\n" +
        "import \"./dynamic_create.js\" as Dyn" + "\n" +
        "ComboBox {" + "\n" +
            "property string module_name: \"\"" + "\n" +
            "property string name: \"\"" + "\n" +
            "property var comboxValue" + "\n" +
            "property var interValue" + "\n" +
            "onActivated: {interValue=Dyn.findValueByIndex(comboxValue,\"value\",index);AppActions.comboxIndexChanged(this)}"+ "\n" +
            // "onActivated: data.value = currentIndex.toString()"+ "\n" +
            // "onActivated: {console.log(data, currentIndex, index);data.model.value = currentIndex.toString();AppActions.comboxIndexChanged(this);}"+ "\n" +
        "}"
        ,
        parent,
        "dyn_create_obj"
    );
    
    return obj;
}

function createLineEdit(parent) {
    var obj = Qt.createQmlObject(
        "import QtQuick 2.0" + "\n" +
        "import QtQuick.Controls 2.2" + "\n" +
        "import Toou2D 1.0" + "\n" +
        "import \"../actions\"" + "\n" +
        "TInputField {" + "\n" +
            "property string module_name: \"\"" + "\n" +
            "property string name: \"\"" + "\n" +
            "onEditingFinished: AppActions.lineEditingFinished(this)"+ "\n" +
        "}"
        ,
        parent,
        "dyn_create_obj"
    );
    
    return obj;
}

function createIntValidator(min, max) {
    var obj = Qt.createQmlObject(
        "import QtQuick 2.0" + "\n" +
        "IntValidator {" + "\n" +
        "}"
        ,
        parent,
        "dyn_create_obj"
    );
    obj.bottom = min;
    obj.top = max;
    
    return obj;
}

function createFloatValidator(min, max) {
    var obj = Qt.createQmlObject(
        "import QtQuick 2.0" + "\n" +
        "DoubleValidator {" + "\n" +
        "}"
        ,
        parent,
        "dyn_create_obj"
    );
    obj.bottom = min;
    obj.top = max;
    
    return obj;
}