#include <fstream>
#include <QDebug>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonDocument>
#include "xml_wraper.h"
#include "kcnetlib/file/kc_xml.h"
using namespace kc::file;

XmlWraper::XmlWraper(const std::string& out_path, QObject *parent)
    : _out_path(out_path)
    , QObject(parent)
{
}

XmlWraper::~XmlWraper()
{
}

bool XmlWraper::toXml(const QString &json)
{
    // qDebug() << json;
    QJsonDocument doc = QJsonDocument::fromJson(json.toUtf8());
    if (!doc.isNull() && doc.isObject()) {
        kc_xml_file xml_file;
        auto& root = xml_file.get_root();
        root.set_name("Data");
        QJsonObject root_obj = doc.object();
        foreach (const QString& key, root_obj.keys()) {
            auto& module = root.add_node("Module");
            module.set_property("name", key.toStdString());
            QString module_name = key;

            if (root_obj[key].isArray()){
                QJsonArray array = root_obj[key].toArray();
                for(int i = 0; i < array.size(); i++) {
                    QJsonObject value = array[i].toObject();
                    auto& param = module.add_node("param");

                    foreach (const QString& key, value.keys()) {
                        param.set_property("name", key.toStdString());
                        param.set_property("value", value[key].toString().toStdString());
                        QString last_name = module_name + "." + key;
                        if (_field_map.contains(last_name)) {
                            QVariantMap& v = _field_map[last_name].toMap();
                            param.set_property("type", v["type"].toString().toStdString());
                            param.set_property("extra", v["value"].toString().toStdString());
                        }
                    }
                }
            }
            else if (root_obj[key].isObject()){
                QJsonObject object = root_obj[key].toObject();
                if (object.contains("show_type")){
                    if(object["show_type"] == "double_combox"){
                        QJsonArray array = object["data"].toArray();
                        for(int i = 0; i < array.size(); i++) {
                            auto& data = module.add_node("param");
                            QJsonObject value = array[i].toObject();
                            foreach(const QString& key, value.keys()) {
                                QString last_name = module_name + "." + key;
                                data.set_property(key.toStdString(), value[key].toString().toStdString());
                                if (_field_map.contains(last_name)) {
                                    QVariantMap& v = _field_map[last_name].toMap();
                                    data.set_property("type", v["type"].toString().toStdString());
                                    data.set_property("extra", v["value"].toString().toStdString());
                                }
                            }
                        }
                    }
                    else if (object["show_type"] == "chassis_param") {
                        foreach(const QString& key, object.keys()){
                            if (key == "type"){
                                module.set_property(key.toStdString(), object[key].toString().toStdString());
                            }
                            else if (key != "show_type"){
                                QString last_name = module_name + "." + key;
                                auto& data = module.add_node("param");
                                data.set_property("name", key.toStdString());
                                data.set_property("value", object[key].toString().toStdString());
                                if (_field_map.contains(last_name)) {
                                    QVariantMap& v = _field_map[last_name].toMap();
                                    data.set_property("type", v["type"].toString().toStdString());
                                    data.set_property("extra", v["value"].toString().toStdString());
                                }
                            }
                        }
                    }
                }
            }
        }
        try{
            std::ofstream ofs(_out_path, std::ios::trunc);
            ofs.close();
        }catch(...) {}
        xml_file.save(_out_path);
    }
    return true;
}