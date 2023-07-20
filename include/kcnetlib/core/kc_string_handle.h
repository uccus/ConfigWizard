/*!
 * \file kc_string_handle.h
 *
 * \author xwt
 * \date 十二月 2018
 *
 * \brief 字符串处理函数集
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
		//! 针对std::string的字符串处理函数
		namespace string_handle
		{
			//! @brief 分割字符串（一个分隔符）
			//! @param str：输入的字符串
			//! @param sep：分隔符，分隔符不得为空
			//! @param result：返回的字符串集合（不包含分隔符）
			void KCNET_API split(const std::string & str, const std::string & sep, std::vector< std::string > & result);

			//! @brief 分割字符串（多个分隔符）
			//! @param str：输入的字符串
			//! @param sep：分隔符集合
			//! @param result：返回的字符串集合（不包含分隔符）
			void KCNET_API split_multisep(const std::string & str, const std::vector<std::string> & sep, std::vector< std::string > & result);

			//! @brief 分割字符串（多个分隔符），返回值包含分隔符
			//! @param str：输入的字符串
			//! @param sep：分隔符集合
			//! @param result：返回的字符串集合（包含分隔符）
			void KCNET_API split_multisep_nodrop(const std::string & str, const std::vector<std::string> & sep, std::vector< std::string > & result_with_seps);


			//! @brief 以一个或多个空格作为分隔符分割字符串
			//! @param str：输入的字符串
			//! @param result：返回的字符串集合（不包含分隔符）
			void KCNET_API split_whitespace(const std::string & str, std::vector< std::string > & result);

			//! @brief 以换行作为分隔符分割字符串
			//! @param str：输入的字符串
			//! @param result：返回的字符串集合（不包含分隔符）
			void KCNET_API split_line(const std::string & str, std::vector< std::string > & result);

			//! @brief 删除指定字符
			//! @param str：输入的字符串
			//! @param ch：删除的字符
			//! @param return 删除后的字符串
			std::string KCNET_API remove_char(const std::string & str, const char ch);

			//! @brief 删除字符串首的空格
			//! @param str：输入的字符串
			//! @param return 删除后的字符串
			std::string KCNET_API trim_left(const std::string & str);

			//! @brief 删除字符串尾的空格
			//! @param str：输入的字符串
			//! @param return 删除后的字符串
			std::string KCNET_API trim_right(const std::string & str);

			//! @brief 移除字符串首尾的空格
			//! @param str：输入的字符串
			//! @param return 删除后的字符串
			std::string KCNET_API trim(const std::string & str);

			//! @brief 解析键值字符串集合，如 "key1=value1, key2=value2, ... "
			//! @param str：输入的字符串
			//! @param key_and_value 返回的键值字符串表
			bool KCNET_API parser_key_value(const std::string &str, std::map<std::string, std::string> &key_and_value);

			//! @brief 是否是整数
			//! @param str 输入的字符串
			//! @param value 输出的整数值
			//! @param support_flag 是否支持符号（正号或负号）
			bool KCNET_API is_int(const std::string &str, int *value = NULL, bool support_flag=false);

			//! @brief 按照格式返回字符串
			//! @param format 格式
			//! @param return 返回格式化后的字符串
			std::string KCNET_API printf_str(const char* format, ...);

#ifndef _WINDOWS
			//! @brief 字符串长度不含'\0'
			//! @param sz 要计算长度的字符串
			//! @param return 返回字符串长度
			int KCNET_API strlen(const char * sz);
#endif

			//! 数字转字符串 
			//! @param value 要转换的数值
			//! @param format 转换格式默认%d
			//! @param return 返回字符串
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

			//! 字符串比较，不区分大小写
			//! @param str1 比较的字符串1
			//! @param str2 比较的字符串2
			//! @param return 返回结果 true：字符串相等（不区分大小写）;  false：字符串不相等（不区分大小写）
			bool KCNET_API iequals(const std::string &str1, const std::string &str2);

		}
	}
}