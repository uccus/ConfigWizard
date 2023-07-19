import QtQuick 2.0
import QuickFlux 1.1

Store {
    // 界面显示的动态数据
    // property var ui_data: []
    property var ui_data: [
        {name: "chassis", model: [
            {
                module_name: "chassis_base",
                title: qsTr("底盘结构"),
                // image: {
                //     source: "../../images/3.png",
                //     width: 300,
                //     height: 150
                // },
                // description: qsTr("这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述"),
                radio_model: [
                    {
                        name: "install", show_type: "radio", value: "test", default_value: "test", 
                        radio_value: [
                            {value: "test", desc: "横向", image: "../../images/3.png"},
                            {value: "test2", desc: "纵向", image: "../../images/4.png"},
                            {value: "test2", desc: "纵向", image: "../../images/4.png"},
                            {value: "test2", desc: "纵向", image: "../../images/4.png"},
                            {value: "test2", desc: "纵向", image: "../../images/4.png"},
                            {value: "test2", desc: "纵向", image: "../../images/4.png"},
                        ]
                    }
                ]
            },
            {
                module_name: "bottomCamera",
                title: qsTr("顶升机构"),
                image: {
                    source: "../../images/3.png",
                    width: 300,
                    height: 300
                },
                description: qsTr("这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述"),
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
                        description: "这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述",
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
                        description: "这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述",
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
            // {
            //     module_name: "bottomCamera123",
            //     title: qsTr("顶升机构2"),
            //     description: qsTr("这里是顶升机构2"),
            //     // image: {
            //     //     source: "../../images/3.png",
            //     //     width: 300,
            //     //     height: 300
            //     // },
            //     model: [
            //         { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
            //             combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
            //         { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
            //             combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
            //         { name: "fff", desc: "减速比", show_type: "input", value: "测试", default_value: "20", min: 0, max: 10 },
            //     ],
            //     has_child: true,
            //     child_model_data: [
            //         {
            //             module_name: "123",
            //             title: qsTr("下限位开关"),
            //             // description: "这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述",
            //             image: {
            //                 source: "../../images/4.png"
            //             },
            //             model: [
            //                 { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
            //                     combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
            //                 { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
            //                     combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
            //             ]
            //         },
            //         { 
            //             module_name: "456",
            //             title: qsTr("驱动器"),
            //             description: "这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述",
            //             model: [
            //                 { name: "brand", desc: "品牌", show_type: "combox", value: "2", default_value: "1", 
            //                     combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
            //                 { name: "ccno", desc: "通讯站号", show_type: "combox", value: "3", default_value: "1", 
            //                     combox_value: [ {value: "1", desc: "第一"}, {value: "2", desc: "第二"}, {value: "3", desc: "第三"}]},
            //                 { name: "fff", desc: "减速比", show_type: "input", value: "1", default_value: "20", min: 0, max: 10 },
            //             ]
            //         }
            //     ]
            // },
        ]},
        {name: "location", model: [
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
                        description: "这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述",
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
                        description: "这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述",
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
            {
                module_name: "bottomCamera123",
                title: qsTr("顶升机构2"),
                description: qsTr("这里是顶升机构2"),
                // image: {
                //     source: "../../images/3.png",
                //     width: 300,
                //     height: 300
                // },
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
                        // description: "这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述",
                        // image: {
                        //     source: "../../images/4.png"
                        // },
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
                        description: "这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述这是一长串的描述",
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
        ]},
    ]
    
    // 实际编辑的字段值 { module_name: [{字段名:字段值}]}
    property var data: []
    
    // 当前使用的model
    property var model: getModel()
    
    property alias wizard: wizard
    WizardStore { id: wizard}
    
    function getUIData() {
        console.log(_test_ui_data);
        // var obj = JSON.parse("{\"name\": \"chassis\", 	\"model\": [{ 		\"module_name\": \"chassis_base\", 		\"title\": \"chassis base\", 		\"image\": { 			\"source\": \"../../images/3.png\", 			\"width\": 300, 			\"height\": 150 		}, 		\"description\": \"1231213\" 	}] }");
        var obj = JSON.parse(_test_ui_data);
        console.log(obj.name);
        console.log(obj.model, obj.model.length);

        return obj;
    }
    
    function getModel(){
        var name = wizard.model.get(wizard.current_index).name;
        if (ui_data.length === 0) {
            ui_data.push(getUIData());
        }
        console.log("---> ", name, ui_data.length)
        for (var i = 0; i < ui_data.length; i++) {
            console.log("searing ", ui_data[i].name)
            if (ui_data[i].name === name) {
                console.log("---> got it")
                return ui_data[i].model
            }
        }
        return []
    }
}