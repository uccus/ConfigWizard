#include <fstream>
#include <QFile>
#include <qDebug>
#include <QJsonDocument>
#include <QCoreApplication>
#include "xml_parser.h"

bool XmlParser::xml2Json(const std::string &file_path)
{
    kc_xml_file loader;
    bool ret = loader.load(file_path);
    if (!ret) return false;
    
    kc_xml_node node = loader.get_root();
    if (node.get_name() != "Window") return false;
    
    QJsonObject js_obj;
    QJsonArray module_js_obj_array;

    if (!loadModules(node, module_js_obj_array)) return false;
    js_obj["module"] = module_js_obj_array;
    
    QJsonDocument doc;
    doc.setObject(js_obj);
    _str_json = doc.toJson(QJsonDocument::Compact);

    return true;
}

bool XmlParser::parseDataXml(const std::string &file_path)
{
    kc_xml_file loader;
    bool ret = loader.load(file_path);
    if (!ret) {
        std::ofstream ofs("./test");
        ofs << "parse failed";
        ofs.close();
    }
    if (!ret) return false;

    kc_xml_node node = loader.get_root();
    if (node.get_name() != "Data") return false;
    
    kc_xml_node module_node = node.get_first_child();
    while(module_node.valid()){
        std::string module_name = module_node.get_property("name");
        std::string type = module_node.get_property("type");
        QVariantMap v_map;

        kc_xml_node param_node = module_node.get_first_child();
        QJsonArray param_arr;
        while(param_node.valid()){
            std::string param_name;
            std::string param_value;

            if(module_name == "dev_assicoate"){
                param_name = param_node.get_property("dev_group");
                param_value = param_node.get_property("logic");
                QJsonObject param_obj;
                param_obj["dev_group"] = QString::fromStdString(param_name);
                param_obj["logic"] = QString::fromStdString(param_value);
                param_arr.append(param_obj);
            }
            else if (!type.empty()) {
                param_name = param_node.get_property("name");
                param_value = param_node.get_property("value");
                v_map[QString::fromStdString(param_name)] = QString::fromStdString(param_value);
            }
            else {
                param_name = param_node.get_property("name");
                param_value = param_node.get_property("value");
                QJsonObject param_obj;
                param_obj[QString::fromStdString(param_name)] = QString::fromStdString(param_value);
                param_arr.append(param_obj);
            }

            param_node = param_node.get_next_brother();
        }
        if (!type.empty()) {
            _chassis_default_value[QString::fromStdString(type)] = v_map;
        }
        _value_json[QString::fromStdString(module_name)] = param_arr;
        module_node = module_node.get_next_brother();
    }
    
    return true;
}

QString XmlParser::getJson()
{
    return _str_json;
}

QVariantList XmlParser::getSpecialVariants()
{
    return _special_node;
}

QString XmlParser::getDefaultValues()
{
    QJsonDocument doc;
    doc.setObject(_value_json);
    return doc.toJson(QJsonDocument::Indented);
}

QVariantMap XmlParser::getChassisDefaultValues()
{
    return _chassis_default_value;
}

QVariantMap XmlParser::getFieldMap()
{
    return _field_map;
}

bool XmlParser::loadParams(kc_xml_node& sub_node, QJsonObject& parent, QJsonArray& out)
{
    QString module_name = parent["module_name"].toString();

    QJsonArray child_sub_array, value_array;
    auto& param_node = sub_node.get_first_child();
    while(param_node.valid()){
        std::string node_name = param_node.get_name();
        if (node_name == "param") {
            QJsonObject param_obj;
            if (param_node.has_property("name")) {
                param_obj["name"] = QString::fromStdString(param_node.get_property("name"));
            }
            if (param_node.has_property("desc")) {
                param_obj["desc"] = QString::fromLocal8Bit(param_node.get_property("desc").c_str());
            }
            if (param_node.has_property("show_type")) {
                std::string show_type = param_node.get_property("show_type");
                param_obj["show_type"] = QString::fromStdString(show_type);
                if (show_type == "combox"){
                    QJsonArray combox_values;

                    auto& combox_node = param_node.get_first_child();
                    while(combox_node.valid()){
                        QJsonObject combox_obj;
                        if (combox_node.has_property("value")){
                            combox_obj["value"] = QString::fromStdString(combox_node.get_property("value"));
                        }
                        if (combox_node.has_property("desc")){
                            combox_obj["desc"] = QString::fromLocal8Bit(combox_node.get_property("desc").c_str());
                        }
                        combox_values.append(combox_obj);
                        combox_node = combox_node.get_next_brother();
                    }
                    param_obj["combox_value"] = combox_values;
                }
            }
            if (param_node.has_property("default_value")) {
                param_obj["default_value"] = QString::fromStdString(param_node.get_property("default_value"));
            }
            if (param_node.has_property("data_type")) {
                param_obj["data_type"] = QString::fromStdString(param_node.get_property("data_type"));
            }
            if (param_node.has_property("min")) {
                param_obj["min"] = QString::fromStdString(param_node.get_property("min"));
            }
            if (param_node.has_property("max")) {
                param_obj["max"] = QString::fromStdString(param_node.get_property("max"));
            }
            // 记录默认值
            QJsonObject value_obj;
            value_obj[param_obj["name"].toString()] = param_obj["default_value"].toString();
            value_array.append(value_obj);

            out.append(param_obj);
        }
        else if (node_name == "Sub") {
            QJsonObject child;
            parseSubNode(param_node, child);
            if (!child.isEmpty()) {
                child_sub_array.append(child);
            }
        }

        param_node = param_node.get_next_brother();
    }
    
    if (value_array.size() > 0) {
        _value_json[module_name] = value_array;
    }

    if (child_sub_array.size() > 0)
        parent["child_model_data"] = child_sub_array;
    
    return true;
}

bool XmlParser::loadRadios(kc_xml_node& sub_node, QJsonArray& out)
{
    QJsonObject radio_obj;
    if (sub_node.has_property("default_value")) {
        radio_obj["default_value"] = QString::fromStdString(sub_node.get_property("default_value"));
    }
    
    QJsonArray radio_values;
    
    auto& node = sub_node.get_first_child();
    while(node.valid()) {
        if (node.get_name() != "radio") return false;
        QJsonObject js_obj;
        if (node.has_property("value")) {
            js_obj["value"] = QString::fromStdString(node.get_property("value"));
        }
        if (node.has_property("desc")) {
            js_obj["desc"] = QString::fromLocal8Bit(node.get_property("desc").c_str());
        }
        if (node.has_property("image")) {
            js_obj["image"] = "file:///" + QCoreApplication::applicationDirPath() + "/"
                                + QString::fromLocal8Bit(node.get_property("image").c_str());
        }
        radio_values.append(js_obj);
        node = node.get_next_brother();
    }

    if (radio_values.size() > 0)
        radio_obj["radio_value"] = radio_values;
    out.append(radio_obj);
    
    return true;
}

bool XmlParser::loadSubs(kc_xml_node& module_node, QJsonArray& out)
{
    // Sub
    auto& sub_node = module_node.get_first_child();
    while(sub_node.valid()) {
        QJsonObject sub_js_obj;
        
        parseSubNode(sub_node, sub_js_obj);
        if (!sub_js_obj.isEmpty()) {
            out.append(sub_js_obj);
        }
        sub_node = sub_node.get_next_brother();
    }

    return true;
}

bool XmlParser::parseSubNode(kc_xml_node &sub_node, QJsonObject &sub_js_obj)
{
    if (sub_node.has_property("name")) {
        sub_js_obj["module_name"] = QString::fromStdString(sub_node.get_property("name"));
    }
    if (sub_node.has_property("desc")) {
        sub_js_obj["title"] = QString::fromLocal8Bit(sub_node.get_property("desc").c_str()); 
    }
    if (sub_node.has_property("show_type")) {
        std::string type = sub_node.get_property("show_type");
        if (type == "radio_group"){
            QJsonArray radio_array;
            
            // 这里只读取一个radio button
            loadRadios(sub_node, radio_array);
            if (radio_array.size() > 0){
                sub_js_obj["radio_model"] = radio_array;
                QJsonObject tmp0 = radio_array[0].toObject();
                QString default_value = tmp0["default_value"].toString();
                QString module_name = sub_js_obj["module_name"].toString();

                QJsonObject tmp1;
                QJsonArray tmp2;
                tmp1[module_name] = default_value;
                tmp2.append(tmp1);

                _value_json[module_name] = tmp2;
            }
        }
        else if (type == "double_combox") {
            QJsonArray double_combox_array;
            loadDoubleCombox(sub_node, double_combox_array);
            if (double_combox_array.size() > 0) {
                sub_js_obj["double_combox_model"] = double_combox_array;
            }
        }
        else if (type == "chassis_param") {
            loadChassisDefaultValue(sub_node);
        }
        sub_js_obj["show_type"] = QString::fromStdString(type);
    }
    if (sub_node.has_property("image")) {
        QJsonObject img_js_obj;
        img_js_obj["source"] = "file:///" + QCoreApplication::applicationDirPath() + "/" 
                                + QString::fromLocal8Bit(sub_node.get_property("image").c_str());
        if (sub_node.has_property("imageWidth")) {
            img_js_obj["width"] = QString::fromStdString(sub_node.get_property("imageWidth"));
        }
        else {
            img_js_obj["width"] = "300";
        }
        if (sub_node.has_property("imageHeight")) {
            img_js_obj["height"] = QString::fromStdString(sub_node.get_property("imageHeight"));
        }
        else {
            img_js_obj["height"] = "250";
        }
        sub_js_obj["image"] = img_js_obj;
    }
    if (sub_node.has_property("description")) {
        sub_js_obj["description"] = QString::fromLocal8Bit(sub_node.get_property("description").c_str());
    }

    QJsonArray param_js_obj_array;
    loadParams(sub_node, sub_js_obj, param_js_obj_array);
    if (param_js_obj_array.size() > 0)
        sub_js_obj["model"] = param_js_obj_array;

    return true;
}

bool XmlParser::loadModules(kc_xml_node& window_node, QJsonArray& out)
{
    auto& child_node = window_node.get_first_child();
    while(child_node.valid()) {
        if (child_node.get_name() == "Module") {
            // Module
            QJsonObject js_obj; 
            if (child_node.has_property("name")){
                js_obj["name"] = QString::fromStdString(child_node.get_property("name"));
            }
            if (child_node.has_property("desc")){
                js_obj["desc"] = QString::fromLocal8Bit(child_node.get_property("desc").c_str());
            }
            
            QJsonArray sub_js_obj_array;
            loadSubs(child_node, sub_js_obj_array);
            
            if (sub_js_obj_array.size() > 0)
                js_obj["model"] = sub_js_obj_array;
            out.append(js_obj);
        }
        else if (child_node.get_name() == "Special") {
            // 特殊节点
            auto& special_node = child_node.get_first_child();
            while(special_node.valid()) {
                if (special_node.has_property("name")) {
                    _special_node << QString::fromStdString(special_node.get_property("name"));
                }
                special_node = special_node.get_next_brother();
            }
        }

        child_node = child_node.get_next_brother();
    }

    return true;
}

bool XmlParser::loadDoubleCombox(kc_xml_node &sub_node, QJsonArray &out)
{
    auto& child_node = sub_node.get_first_child();
    while(child_node.valid()) {
        QJsonObject param_obj;
        if (child_node.has_property("name")) {
            param_obj["name"] = QString::fromStdString(child_node.get_property("name"));
        }
        if (child_node.has_property("desc")){
            param_obj["desc"] = QString::fromLocal8Bit(child_node.get_property("desc").c_str());
        }

        QJsonArray combox_array;
        auto& combox_node = child_node.get_first_child();
        while(combox_node.valid()){
            QJsonObject combox_obj;
            if (combox_node.has_property("value")){
                combox_obj["value"] = QString::fromStdString(combox_node.get_property("value"));
            }
            if (combox_node.has_property("desc")){
                combox_obj["desc"] = QString::fromLocal8Bit(combox_node.get_property("desc").c_str());
            }
            combox_array.append(combox_obj);
            combox_node = combox_node.get_next_brother();
        }

        if (combox_array.size() > 0){
            param_obj["model"] = combox_array;
        }

        if (!param_obj.isEmpty()) {
            out.append(param_obj);
        }
        child_node = child_node.get_next_brother();
    }
    return true;
}

bool XmlParser::loadChassisDefaultValue(kc_xml_node &sub_node)
{
    auto& option_node = sub_node.get_first_child();
    while(option_node.valid()) {
        if (option_node.get_name() == "option") {
            if (option_node.has_property("type")){
                QString type = QString::fromStdString(option_node.get_property("type"));
                QVariantMap val_map;
                auto& param_node = option_node.get_first_child();
                while(param_node.valid()) {
                    QString name, default_value;
                    if (param_node.has_property("name")) {
                        name = QString::fromStdString(param_node.get_property("name"));
                    }
                    if (param_node.has_property("default_value")) {
                        default_value = QString::fromStdString(param_node.get_property("default_value"));
                    }
                    val_map[name] = default_value;
                    param_node = param_node.get_next_brother();
                }
                if (val_map.size() > 0) {
                    _chassis_default_value[type] = val_map;
                }
            }
        }
        option_node = option_node.get_next_brother();
    }
    return true;
}

bool XmlParser::parseFieldMapXml()
{
    const QString file_path = qApp->applicationDirPath() + "/field_map.csv";
    
    QFile file(file_path);
    if (file.open(QIODevice::ReadOnly)) {
        QTextStream stream_text(&file);
        while (!stream_text.atEnd()) {
            QString line = stream_text.readLine();
            QStringList params = line.split(",");
            if (params.size() < 3) continue;
            QString wizard_name = params[0];
            QString type = params[1];
            QString value = params[2];
            QVariantMap v_map;
            v_map["type"] = type;
            v_map["value"] = value;
            _field_map[wizard_name] = v_map;
        }
        file.close();
    }
    else{
        return false;
    }
    
    return true;
}
