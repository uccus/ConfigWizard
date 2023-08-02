#pragma once

#include <QJsonArray>
#include <QJsonObject>
#include <QString>
#include "kcnetlib/file/kc_xml.h"
using namespace kc::file;

class XmlParser
{
public:
    bool xml2Json(const std::string& file_path);
    bool parseDataXml(const std::string& file_path);
    // 解析数据字段映射文件
    bool parseFieldMapXml();
    QString getJson();
    QVariantList getSpecialVariants();
    QString getDefaultValues();
    QVariantMap getChassisDefaultValues();
    QVariantMap getFieldMap();

private:
    bool loadParams(kc_xml_node& sub_node, QJsonObject& parent, QJsonArray& out);
    bool loadRadios(kc_xml_node& sub_node, QJsonArray& out);
    bool loadSubs(kc_xml_node& module_node, QJsonArray& out);
    bool parseSubNode(kc_xml_node& sub_node, QJsonObject& out);
    bool loadModules(kc_xml_node& window_node, QJsonArray& out);
    bool loadDoubleCombox(kc_xml_node& sub_node, QJsonArray& out);
    bool loadChassisDefaultValue(kc_xml_node& sub_node);
    
private:
    QVariantMap    _field_map;                   // 数据字段映射
    QVariantMap    _chassis_default_value;      // 底盘类型及默认参数
    QVariantList   _special_node;       // 特殊节点
    QString _str_json;   // 供界面展示用的数据
    QJsonObject _value_json; // 记录各字段值
};