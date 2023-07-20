#pragma once
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/core/kc_time.h"
#include "kc_stream.h"
#include <string>
#include "kcnetlib/file/kc_xml.h"

namespace kc
{
	namespace serialization
	{
		class object;
		class xml_object;

		//! 存档
		class KCNET_API archive
		{
		public:
			//! 存档模式，保存模式/加载模式
			enum MODE {STORE=0,LOAD=1};

			//! 构造函数
			archive(MODE mode=STORE):m_mode(mode) {}

			//! 析构函数
			virtual ~archive() {}

			//! 是否加载模式
			inline bool is_load() const { return m_mode==LOAD; }

			//! 是否保存模式
			inline bool is_store() const { return m_mode == STORE; }

		protected:
			MODE m_mode;
		};

		//! 二进制存档对象
		class KCNET_API binary_archive : public archive, public binary_stream
		{
		public:
			//! 构造函数
			binary_archive(archive::MODE mode = archive::STORE);

			//! 析构函数
			binary_archive(const binary_stream &bin_stream, archive::MODE mode = archive::STORE);

			//! 从存档中读取对象
			object *read_object();

			//! 将对象写入存档
			void write_object(object *obj);

		};

		//! json存档对象
		class KCNET_API json_archive : public archive, public json_stream
		{
		private:
			json_archive(void *json_obj, archive::MODE mode);

		public:
			//! 构造函数
			json_archive(archive::MODE mode = archive::STORE);;

			//! 从存档中读取对象
			object *read_object();

			//! 将对象写入存档
			void write_object(object *obj);

		};

		//! xml存档对象
		class KCNET_API xml_archive : public archive, public kc::file::kc_xml_node
		{
		public:
			//! 构造函数
			xml_archive(archive::MODE mode = archive::STORE);

			//! 构造函数
			xml_archive(const kc::file::kc_xml_node &xml_node, archive::MODE mode = archive::STORE);

			//! 从存档中读取对象
			xml_object *read_object(xml_object * ptr_parent = NULL);

			//! 将对象写入存档
			void write_object(xml_object *obj);

		};
	}
}


// 属性序列化宏定义
#define SERIALIZE_PROPERTY(ar, property) \
if (ar.is_load()){ ar >> property; } else { ar << property;}

#define SERIALIZE_ENUM(ar, type, property) \
if (ar.is_load()){ int value=0; ar >> value; property=(type)value; } else { ar << (int)property;}

#define BINARY_SERIALIZE_STRUCT(ar, type, property) \
if (ar.is_load()){ ar.read(&property, sizeof(type)); } else { ar.write(&property, sizeof(type)); }

#define  SERIALIZE_VECTOR(ar, type ,vector_property) \
if (ar.is_load())	{ unsigned int size = 0; ar >> size; for (int i=0;i<size;i++) { type value; ar >> value; vector_property.push_back(value); } }\
else { ar << (unsigned int)vector_property.size(); for (auto it = vector_property.begin(); it != vector_property.end(); it++){	ar << (*it);} }

#define SERIALIZE_STRUCT_VECTOR(ar,type,vector_property)\
if (ar.is_load())	{ unsigned int size = 0; ar >> size; for (int i=0;i<size;i++) { type *value = new type(); ar.read(value,sizeof(type)); vector_property.push_back(value); } }\
else { ar << (unsigned int)vector_property.size(); for (auto it = vector_property.begin(); it != vector_property.end(); it++){	ar.write((*it),sizeof(type));} }

#define  SERIALIZE_SET(ar, type ,vector_property) \
if (ar.is_load())	{ unsigned int size = 0; ar >> size; for (int i=0;i<size;i++) { type value; ar >> value; vector_property.insert(value); } }\
else { ar << (unsigned int)vector_property.size(); for (auto it = vector_property.begin(); it != vector_property.end(); it++){	ar << (*it);} }

