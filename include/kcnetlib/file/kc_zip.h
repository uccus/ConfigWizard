#pragma once

#include "kcnetlib/core/kc_dll_export.h"

#include <string>
namespace kc
{
	namespace file
	{
		class kc_zip_imp;
		
		//! 压缩解压缩模块
		class KCNET_API kc_zip
		{
		public:

			//! 构造函数
			kc_zip(void);

			//! 析构函数
			~kc_zip(void);

			//! @brief 压缩文件
			//! @param zip_file_path 压缩文件（zip）路径
			//! @param file_to_zip 进行压缩的文件
			bool zip_file(const std::string&zip_file_path, const std::string &file_to_zip);

			//! @brief 解压缩文件
			//! @param zip_file_path 压缩文件（zip）路径
			//! @param export_path 解压到的目录
			bool unzip_file(const std::string&zip_file_path, const std::string & export_path);

		protected:
			kc_zip_imp * m_zip_imp;
		};
	}
}