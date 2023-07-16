function findIndexByField(arr, field, value) {
    for (var i = 0; i < arr.length; i++) {
      if (arr[i][field] === value) {
        return i;
      }
    }
    return -1; // 如果未找到匹配的元素，则返回 -1
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

function createCombox(parent) {
    var obj = Qt.createQmlObject(
        "import QtQuick 2.0" + "\n" +
        "import QtQuick.Controls 2.2" + "\n" +
        "import \"../actions\"" + "\n" +
        "ComboBox {" + "\n" +
            "onActivated: AppActions.comboxIndexChanged(this)"+ "\n" +
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
        "TInputField {" + "\n" +
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