import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Toou2D 1.0
import "../stores"

Item {
    implicitHeight: rect.height
    implicitWidth: rect.width

    TRectangle {
        id: rect
        width: 400;
        height: 350;
        anchors.centerIn: parent

        TRectangle {
            id: body
            anchors.centerIn: parent
            width: 300;
            height: 200;
            border.width: 3;
            border.color: "black";
        }
        
        // 原点
        TLabel {
            text: "(0, 0)"
            anchors{
                centerIn: parent
                horizontalCenterOffset: 20
                verticalCenterOffset: -10
            }
        }
        
        // X轴
        TDividerLine {
            id: axis_x
            width: body.width + 80
            height: 2
            color: "black"
            anchors.centerIn: parent
            TLabel {
                text: "X"
                anchors.right: parent.right
                anchors {
                    right: parent.right
                    bottom: parent.top
                    bottomMargin: 10
                }
            }
            TDividerLine {
                width: 10
                height: 2
                color: "black"
                anchors.right: parent.right
                transformOrigin: Item.Right
                rotation: 30
            }
            TDividerLine {
                width: 10
                height: 2
                color: "black"
                anchors.right: parent.right
                transformOrigin: Item.Right
                rotation: -30
            }
        }

        // Y轴
        TDividerLine {
            id: axis_y
            width: body.height + 50
            height: 2
            color: "black"
            rotation: -90
            anchors.centerIn: parent
            TLabel {
                text: "Y"
                rotation: 90
                anchors.right: parent.right
                anchors {
                    right: parent.right
                    bottom: parent.top
                    bottomMargin: 10
                }
            }
            TDividerLine {
                width: 10
                height: 2
                color: "black"
                anchors.right: parent.right
                transformOrigin: Item.Right
                rotation: 30
            }
            TDividerLine {
                width: 10
                height: 2
                color: "black"
                anchors.right: parent.right
                transformOrigin: Item.Right
                rotation: -30
            }
        }
        
        // 车长
        TDividerLine {
            id: length
            width: body.width
            height: 2
            color: "black"
            anchors.top: body.bottom
            anchors.topMargin: 10 
            anchors.horizontalCenter: parent.horizontalCenter
            TDividerLine {
                width: 10
                height: 2
                color: "black"
                anchors.right: parent.right
                transformOrigin: Item.Right
                rotation: -30
            }
            TDividerLine {
                width: 10
                height: 2
                color: "black"
                anchors.right: parent.right
                transformOrigin: Item.Right
                rotation: 30
            }
            TDividerLine {
                width: 10
                height: 2
                color: "black"
                anchors.left: parent.left
                transformOrigin: Item.Left
                rotation: -30
            }
            TDividerLine {
                width: 10
                height: 2
                color: "black"
                anchors.left: parent.left
                transformOrigin: Item.Left
                rotation: 30
            }
            TDividerLine{
                width: 10
                height: 3
                color: "black"
                anchors.left: parent.left
                anchors.leftMargin: -5
                rotation: 90
            }
            TDividerLine{
                width: 10
                height: 3
                color: "black"
                anchors.right: parent.right
                anchors.rightMargin: -5
                rotation: 90
            }
            TLabel {
                id: label
                text: "车长 (m)"
                anchors.right: parent.right
                anchors.top: parent.bottom
                anchors.topMargin: 10
            }
            TInputField {
                width: 40
                height: 20
                text: MainStore.chassis_param.default_value[MainStore.chassis_param.chassis_type].length
                border.color: text === "" ? "red" : "#9D9D9D"
                border.width: text === "" ? 2 : 1
                clearable: false
                horizontalMargin: 5
                validator: DoubleValidator {
                    bottom: 0
                }
                maximumLength: 5
                placeholderLabel.text: ""
                anchors.right: parent.right
                anchors.top: label.bottom
                anchors.topMargin: 8
                onTextChanged: {
                    MainStore.chassis_param.data["length"] = text;
                    if (text === ""){
                        MainStore.wizard.check_ref += 1
                    }
                    else {
                        if (MainStore.wizard.check_ref > 0){
                            MainStore.wizard.check_ref -= 1
                        }
                    }
                }
            }
        }
        
        TDividerLine {
            id: width
            width: 2
            height: body.height
            color: "black"
            anchors{
                left: body.right
                leftMargin: 10
                verticalCenter: body.verticalCenter
            }
            TDividerLine {
                width: 2
                height: 10
                color: "black"
                anchors.top: parent.top
                transformOrigin: Item.Top
                rotation: 30
            }
            TDividerLine {
                width: 2
                height: 10
                color: "black"
                anchors.top: parent.top
                transformOrigin: Item.Top
                rotation: -30
            }
            TDividerLine {
                width: 2
                height: 10
                color: "black"
                anchors.bottom: parent.bottom
                transformOrigin: Item.Bottom
                rotation: 30
            }
            TDividerLine {
                width: 2
                height: 10
                color: "black"
                anchors.bottom: parent.bottom
                transformOrigin: Item.Bottom
                rotation: -30
            }
            TDividerLine{
                width: 2
                height: 10
                color: "black"
                anchors.top: parent.top
                anchors.topMargin: -5
                rotation: 90
            }
            TDividerLine{
                width: 2
                height: 10
                color: "black"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -5
                rotation: 90
            }

            TLabel {
                id: label2
                text: "车宽 (m)"
                anchors.left: parent.right
                anchors.bottom: parent.bottom
                anchors.leftMargin: 10
                anchors.bottomMargin: 50
            }
            TInputField {
                width: 40
                height: 20
                text: MainStore.chassis_param.default_value[MainStore.chassis_param.chassis_type].width
                border.color: text === "" ? "red" : "#9D9D9D"
                border.width: text === "" ? 2 : 1
                clearable: false
                horizontalMargin: 5
                validator: DoubleValidator {
                    bottom: 0
                }
                maximumLength: 5
                placeholderLabel.text: ""
                anchors.left: parent.right
                anchors.leftMargin: 10
                anchors.top: label2.bottom
                anchors.topMargin: 8
                onTextChanged: {
                    MainStore.chassis_param.data["width"] = text;
                    if (text === ""){
                        MainStore.wizard.check_ref += 1
                    }
                    else {
                        if (MainStore.wizard.check_ref > 0){
                            MainStore.wizard.check_ref -= 1
                        }
                    }
                }
            }
        }

        TRectangle {
            width: 80; height: 20
            color: "#e9e9e9"
            radius: 3
            border.color: "#7e7e7e"
            border.width: 1
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 50
        }
        TRectangle {
            width: 80; height: 20
            color: "#e9e9e9"
            border.color: "#7e7e7e"
            border.width: 1
            radius: 3
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -50
        }
        
        TDividerLine {
            width: 2
            height: 100
            color: "black"
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -46
            TDividerLine {
                width: 2
                height: 10
                color: "black"
                anchors.top: parent.top
                rotation: 30
                transformOrigin: Item.Top
            }
            TDividerLine {
                width: 2
                height: 10
                color: "black"
                anchors.top: parent.top
                rotation: -30
                transformOrigin: Item.Top
            }
            TDividerLine {
                width: 2
                height: 10
                color: "black"
                anchors.bottom: parent.bottom
                rotation: 30
                transformOrigin: Item.Bottom
            }
            TDividerLine {
                width: 2
                height: 10
                color: "black"
                anchors.bottom: parent.bottom
                rotation: -30
                transformOrigin: Item.Bottom
            }
            TDividerLine{
                width: 2
                height: 10
                color: "black"
                anchors.top: parent.top
                anchors.topMargin: -5
                rotation: 90
            }
            TDividerLine{
                width: 2
                height: 10
                color: "black"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -5
                rotation: 90
            }
            TLabel {
                id: label3
                text: "轮距(m)"
                anchors {
                    right: parent.left
                    rightMargin: 10
                }
            }
            TInputField {
                width: 40
                height: 20
                text: MainStore.chassis_param.default_value[MainStore.chassis_param.chassis_type].distance
                border.color: text === "" ? "red" : "#9D9D9D"
                border.width: text === "" ? 2 : 1
                clearable: false
                horizontalMargin: 5
                placeholderLabel.text: ""
                validator: DoubleValidator {
                    bottom: 0
                }
                maximumLength: 5
                anchors {
                    right: parent.left
                    rightMargin: 10
                    top: label3.bottom
                    topMargin: 10
                }
                onTextChanged: {
                    MainStore.chassis_param.data["distance"] = text;
                    if (text === ""){
                        MainStore.wizard.check_ref += 1
                    }
                    else {
                        if (MainStore.wizard.check_ref > 0){
                            MainStore.wizard.check_ref -= 1
                        }
                    }
                }
            }
        }
    }
}