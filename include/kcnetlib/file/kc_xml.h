#pragma once


#include "kcnetlib/core/kc_dll_export.h"

#include <string>
#include <vector>
using namespace std;


namespace kc
{
	namespace file
	{
		class kc_xml_node_imp;
		class kc_xml_file_imp;

		//! xml 节点
		class KCNET_API kc_xml_node
		{
		public:
			//! 构造函数
			kc_xml_node();

			//! 构造函数
			kc_xml_node(kc_xml_node_imp *node);

			//! 析构函数
			~kc_xml_node();

			//! 转换成字符串
			string				to_text();

			//! 加载字符串
			const char*			from_text(const char *ptr);

			//! 获取节点名称
			string				get_name() const;

			//! 设置节点名称
			void				set_name(const string &name);

			//! 获取节点内容
			string				get_content() const;

			//! 获取节点属性数量
			int					get_property_count() const;

			//! 获取节点属性
			bool				get_property(int nIndex, string &key, string &value) const;

			//! 检查是否有属性
			bool				has_property(const string &key) const;

			//! 获取属性值（字符串格式）
			string				get_property(const string &key) const;

			//! 获取属性值(字符串格式，带默认值)
			string				get_property(const string &key,const string & str_default) const;

			//! 获取属性值（bool格式）
			bool					get_property_bool(const string &key, bool bdefault = false) const;

			//! 获取属性值（整数格式）
			int					get_property_int(const string &key, int ndefault = -1) const;

			//! 获取属性值（整数格式，十六进制）
			void				get_property_hex(const string &key, const int value);


			//! 获取属性值（浮点数格式）
			float				get_property_float(const string &key, float ndefault = 0.0) const;

			//! 获取属性值（字节流）
			bool				get_property_mem(const string &key, unsigned char *pMem, unsigned int nLen);

			//! 设置属性值（字符串格式）
			void				set_property(const string &key, const string &value);

			//! 设置属性值（bool格式）
			void				set_property_bool(const string &key, const bool &value);

			//! 设置属性值（整数格式）
			void				set_property_int(const string &key, const int value);

			//! 设置属性值（整数格式，十六进制）
			void				set_property_hex(const string &key, const int value);

			//! 设置属性值（字节流）
			void				set_property_mem(const string &key, const unsigned char *pMem, unsigned int nLen);

			//! 设置属性值（浮点数）
			void				set_property_float(const string &key, const float value);

			//! 添加子节点
			kc_xml_node			add_node(std::string str_name = "");

			//! 删除所有子节点
			void				del_all_node();

			//! 删除子节点
			bool				delete_node(kc_xml_node *node);

			//! 是否有效
			bool				valid();

			//! 获取子节点数量
			int					get_child_count();

			//! 获取子节点
			kc_xml_node			get_child_at(int nIndex);

			//! 获取第一个子节点
			kc_xml_node			get_first_child();

			//! 获取下一个子节点
			kc_xml_node			get_next_brother();

			friend class kc_xml_file;
		protected:


			kc_xml_node_imp * m_xml_node_imp;
		};


		//! xml文件
		class KCNET_API kc_xml_file
		{
		public:

			//! 构造函数
			kc_xml_file();

			//! 析构函数
			~kc_xml_file();

			//! 从文件加载
			bool load(const string&  lpsFile, bool utf8 = false);

			//! 保存到文件
			bool save(const string&  lpsFile, bool utf8 = false);

			//! 获取根节点
			kc_xml_node get_root();

		protected:
			kc_xml_file_imp * m_xml_file_imp;
		};
	}
}
