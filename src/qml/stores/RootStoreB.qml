import QtQuick 2.0
import QuickFlux 1.1

Store {
    property var data: [
        {name: "chassis", model: [
            {
                module_name: "bottomCamera",
                title: qsTr("顶升机构"),
                image: {
                    source: "../../images/3.png",
                    width: 300,
                    height: 300
                },
                model: [
                    { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
                        combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                    { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
                        combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                    { name: "fff", desc: "减速比", show_type: "input", value: "测试", default_value: "20", min: 0, max: 10 },
                ],
                has_child: true,
                child_model_data: [
                    {
                        module_name: "123",
                        title: qsTr("下限位开关"),
                        model: [
                            { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
                                combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                            { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
                                combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                        ]
                    },
                    { 
                        module_name: "456",
                        title: qsTr("驱动器"),
                        model: [
                            { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
                                combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                            { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
                                combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
                            { name: "fff", desc: "减速比", show_type: "input", value: "1", default_value: "20", min: 0, max: 10 },
                        ]
                    }
                ]
            },
        ]}
    ]
    
    property alias wizard: wizard
    WizardStore { id: wizard}
    
    function getModel(){
        var name = wizard.model.get(wizard.current_index).name;
        for (var i = 0; i < data.length; i++) {
            if (data[i].name === name) {
                return data[i].model
            }
        }
        return []
    }
}