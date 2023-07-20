#include <QDebug>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonDocument>
#include "xml_wraper.h"
#include "kcnetlib/file/kc_xml.h"
using namespace kc::file;

XmlWraper::XmlWraper(QObject *parent)
    : QObject(parent)
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

            if (root_obj[key].isArray()){
                QJsonArray array = root_obj[key].toArray();
                for(int i = 0; i < array.size(); i++) {
                    QJsonObject value = array[i].toObject();
                    auto& param = module.add_node("param");

                    foreach (const QString& key, value.keys()) {
                        param.set_property("name", key.toStdString());
                        param.set_property("value", value[key].toString().toStdString());
                    }
                }
            }
        }
        xml_file.save("./out2.xml");
    }
    return true;
}