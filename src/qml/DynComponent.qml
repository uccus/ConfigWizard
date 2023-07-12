import QtQuick 2.0;
import Toou2D 1.0
import "dynamic_create.js" as Dyn

Component {
    TRectangle {
        width: root.width
        height: root.height;
        Row{
            id: root
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            

            Component.onCompleted: {
                var obj = Dyn.createLabel(root);
                obj.text = model.modelData.name;
                
                obj = Dyn.createCombox(root);
                obj.model = ["1", "2", "3"]
            }
        }
    }
}