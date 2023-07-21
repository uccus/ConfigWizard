#pragma once

#include <QJsonArray>
#include <QJsonObject>
#include <QString>
#include "kcnetlib/file/kc_xml.h"
using namespace kc::file;

class XmlParser
{
public:
    bool xml2Json(const QString& file_path);
    QString getJson();
    QVariantList getSpecialVariants();
    QString getDefaultValues();

private:
    bool loadParams(kc_xml_node& sub_node, QJsonObject& parent, QJsonArray& out);
    bool loadRadios(kc_xml_node& sub_node, QJsonArray& out);
    bool loadSubs(kc_xml_node& module_node, QJsonArray& out);
    bool parseSubNode(kc_xml_node& sub_node, QJsonObject& out);
    bool loadModules(kc_xml_node& window_node, QJsonArray& out);
    bool loadDoubleCombox(kc_xml_node& sub_node, QJsonArray& out);
    
private:
    QVariantList    _special_node;
    QString _str_json;   // 供界面展示用的数据
    QJsonObject _value_json; // 记录各字段值
};