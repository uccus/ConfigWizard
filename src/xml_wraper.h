#pragma once

#include <QObject>

class XmlWraper : public QObject
{
    Q_OBJECT
public:
    XmlWraper(QObject *parent = nullptr);
    ~XmlWraper();
    Q_INVOKABLE bool toXml(const QString& json);
};