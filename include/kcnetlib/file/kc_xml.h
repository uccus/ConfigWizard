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

		//! xml �ڵ�
		class KCNET_API kc_xml_node
		{
		public:
			//! ���캯��
			kc_xml_node();

			//! ���캯��
			kc_xml_node(kc_xml_node_imp *node);

			//! ��������
			~kc_xml_node();

			//! ת�����ַ���
			string				to_text();

			//! �����ַ���
			const char*			from_text(const char *ptr);

			//! ��ȡ�ڵ�����
			string				get_name() const;

			//! ���ýڵ�����
			void				set_name(const string &name);

			//! ��ȡ�ڵ�����
			string				get_content() const;

			//! ��ȡ�ڵ���������
			int					get_property_count() const;

			//! ��ȡ�ڵ�����
			bool				get_property(int nIndex, string &key, string &value) const;

			//! ����Ƿ�������
			bool				has_property(const string &key) const;

			//! ��ȡ����ֵ���ַ�����ʽ��
			string				get_property(const string &key) const;

			//! ��ȡ����ֵ(�ַ�����ʽ����Ĭ��ֵ)
			string				get_property(const string &key,const string & str_default) const;

			//! ��ȡ����ֵ��bool��ʽ��
			bool					get_property_bool(const string &key, bool bdefault = false) const;

			//! ��ȡ����ֵ��������ʽ��
			int					get_property_int(const string &key, int ndefault = -1) const;

			//! ��ȡ����ֵ��������ʽ��ʮ�����ƣ�
			void				get_property_hex(const string &key, const int value);


			//! ��ȡ����ֵ����������ʽ��
			float				get_property_float(const string &key, float ndefault = 0.0) const;

			//! ��ȡ����ֵ���ֽ�����
			bool				get_property_mem(const string &key, unsigned char *pMem, unsigned int nLen);

			//! ��������ֵ���ַ�����ʽ��
			void				set_property(const string &key, const string &value);

			//! ��������ֵ��bool��ʽ��
			void				set_property_bool(const string &key, const bool &value);

			//! ��������ֵ��������ʽ��
			void				set_property_int(const string &key, const int value);

			//! ��������ֵ��������ʽ��ʮ�����ƣ�
			void				set_property_hex(const string &key, const int value);

			//! ��������ֵ���ֽ�����
			void				set_property_mem(const string &key, const unsigned char *pMem, unsigned int nLen);

			//! ��������ֵ����������
			void				set_property_float(const string &key, const float value);

			//! ����ӽڵ�
			kc_xml_node			add_node(std::string str_name = "");

			//! ɾ�������ӽڵ�
			void				del_all_node();

			//! ɾ���ӽڵ�
			bool				delete_node(kc_xml_node *node);

			//! �Ƿ���Ч
			bool				valid();

			//! ��ȡ�ӽڵ�����
			int					get_child_count();

			//! ��ȡ�ӽڵ�
			kc_xml_node			get_child_at(int nIndex);

			//! ��ȡ��һ���ӽڵ�
			kc_xml_node			get_first_child();

			//! ��ȡ��һ���ӽڵ�
			kc_xml_node			get_next_brother();

			friend class kc_xml_file;
		protected:


			kc_xml_node_imp * m_xml_node_imp;
		};


		//! xml�ļ�
		class KCNET_API kc_xml_file
		{
		public:

			//! ���캯��
			kc_xml_file();

			//! ��������
			~kc_xml_file();

			//! ���ļ�����
			bool load(const string&  lpsFile, bool utf8 = false);

			//! ���浽�ļ�
			bool save(const string&  lpsFile, bool utf8 = false);

			//! ��ȡ���ڵ�
			kc_xml_node get_root();

		protected:
			kc_xml_file_imp * m_xml_file_imp;
		};
	}
}
