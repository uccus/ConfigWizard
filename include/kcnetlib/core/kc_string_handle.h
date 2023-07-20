/*!
 * \file kc_string_handle.h
 *
 * \author xwt
 * \date ʮ���� 2018
 *
 * \brief �ַ�����������
 */
#pragma once

#include "kcnetlib/core/kc_dll_export.h"

#include <string>
#include <vector>
#include <map>
#include <assert.h>



namespace kc
{
	namespace core
	{
		//! ���std::string���ַ���������
		namespace string_handle
		{
			//! @brief �ָ��ַ�����һ���ָ�����
			//! @param str��������ַ���
			//! @param sep���ָ������ָ�������Ϊ��
			//! @param result�����ص��ַ������ϣ��������ָ�����
			void KCNET_API split(const std::string & str, const std::string & sep, std::vector< std::string > & result);

			//! @brief �ָ��ַ���������ָ�����
			//! @param str��������ַ���
			//! @param sep���ָ�������
			//! @param result�����ص��ַ������ϣ��������ָ�����
			void KCNET_API split_multisep(const std::string & str, const std::vector<std::string> & sep, std::vector< std::string > & result);

			//! @brief �ָ��ַ���������ָ�����������ֵ�����ָ���
			//! @param str��������ַ���
			//! @param sep���ָ�������
			//! @param result�����ص��ַ������ϣ������ָ�����
			void KCNET_API split_multisep_nodrop(const std::string & str, const std::vector<std::string> & sep, std::vector< std::string > & result_with_seps);


			//! @brief ��һ�������ո���Ϊ�ָ����ָ��ַ���
			//! @param str��������ַ���
			//! @param result�����ص��ַ������ϣ��������ָ�����
			void KCNET_API split_whitespace(const std::string & str, std::vector< std::string > & result);

			//! @brief �Ի�����Ϊ�ָ����ָ��ַ���
			//! @param str��������ַ���
			//! @param result�����ص��ַ������ϣ��������ָ�����
			void KCNET_API split_line(const std::string & str, std::vector< std::string > & result);

			//! @brief ɾ��ָ���ַ�
			//! @param str��������ַ���
			//! @param ch��ɾ�����ַ�
			//! @param return ɾ������ַ���
			std::string KCNET_API remove_char(const std::string & str, const char ch);

			//! @brief ɾ���ַ����׵Ŀո�
			//! @param str��������ַ���
			//! @param return ɾ������ַ���
			std::string KCNET_API trim_left(const std::string & str);

			//! @brief ɾ���ַ���β�Ŀո�
			//! @param str��������ַ���
			//! @param return ɾ������ַ���
			std::string KCNET_API trim_right(const std::string & str);

			//! @brief �Ƴ��ַ�����β�Ŀո�
			//! @param str��������ַ���
			//! @param return ɾ������ַ���
			std::string KCNET_API trim(const std::string & str);

			//! @brief ������ֵ�ַ������ϣ��� "key1=value1, key2=value2, ... "
			//! @param str��������ַ���
			//! @param key_and_value ���صļ�ֵ�ַ�����
			bool KCNET_API parser_key_value(const std::string &str, std::map<std::string, std::string> &key_and_value);

			//! @brief �Ƿ�������
			//! @param str ������ַ���
			//! @param value ���������ֵ
			//! @param support_flag �Ƿ�֧�ַ��ţ����Ż򸺺ţ�
			bool KCNET_API is_int(const std::string &str, int *value = NULL, bool support_flag=false);

			//! @brief ���ո�ʽ�����ַ���
			//! @param format ��ʽ
			//! @param return ���ظ�ʽ������ַ���
			std::string KCNET_API printf_str(const char* format, ...);

#ifndef _WINDOWS
			//! @brief �ַ������Ȳ���'\0'
			//! @param sz Ҫ���㳤�ȵ��ַ���
			//! @param return �����ַ�������
			int KCNET_API strlen(const char * sz);
#endif

			//! ����ת�ַ��� 
			//! @param value Ҫת������ֵ
			//! @param format ת����ʽĬ��%d
			//! @param return �����ַ���
			template<typename num_datatype>
			std::string num_to_string(const num_datatype & value, const char * format = "%d")
			{
				assert(strlen(format) <= 32);
				char szValue[128] = { 0 };
#if _WINDOWS
				sprintf_s(szValue, 128, format, value);
#else
				snprintf(szValue, 128, format, value);
#endif
				return szValue;
			}

			//! �ַ����Ƚϣ������ִ�Сд
			//! @param str1 �Ƚϵ��ַ���1
			//! @param str2 �Ƚϵ��ַ���2
			//! @param return ���ؽ�� true���ַ�����ȣ������ִ�Сд��;  false���ַ�������ȣ������ִ�Сд��
			bool KCNET_API iequals(const std::string &str1, const std::string &str2);

		}
	}
}