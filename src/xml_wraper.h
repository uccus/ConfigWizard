#pragma once

#include <QMap>
#include <QVariant>
#include <QObject>

class XmlWraper : public QObject
{
    Q_OBJECT
public:
    XmlWraper(const std::string& out_path, QObject *parent = nullptr);
    ~XmlWraper();
    void setFieldMap(const QVariantMap& data_map) { _field_map = data_map; }
    Q_INVOKABLE bool toXml(const QString& json);

private: 
    QVariantMap _field_map;
    std::string _out_path;
};