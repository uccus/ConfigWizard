
function createLabel(parent) {
    let obj = Qt.createQmlObject(
        `import QtQuick 2.0  
        import Toou2D 1.0   
        TLabel {
            clip: true
            width: 80
            anchors.verticalCenter: parent.verticalCenter
        }
        `
        ,
        parent,
        "dyn_create_obj"
    );
    
    return obj;
}

function createCombox(parent) {
    let obj = Qt.createQmlObject(
        `
        import QtQuick 2.0
        import QtQuick.Controls 2.2
        ComboBox {
        }
        `
        ,
        parent,
        "dyn_create_obj"
    );
    
    return obj;
}