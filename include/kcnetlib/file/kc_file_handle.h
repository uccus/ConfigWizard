#pragma once
#include "kcnetlib/core/kc_dll_export.h"

#include <string>

namespace kc
{
	//! 文件操作
	namespace file
	{
		//! 文件操作接口
		namespace file_handle
		{
			//! 获取当前运行目录
			std::string KCNET_API current_dir();

			//! 获取文件名/目录名，如 C:\foo.txt  返回文件名：foo.txt		如C:\foo\	返回目录名：foo
			std::string KCNET_API base_name_of_path(const std::string &path);

			//! 获取目录 如 C:\foo.txt  返回目录：C:\     如 C:\foo\	返回目录：C:\	
			std::string KCNET_API dir_name(const std::string &path);

			//! @brief 分割路径，如 C:\foo.txt 返回 C:\、foo 、txt
			//! @param dir：目录
			//! @param file_base_name：文件名，不含后缀
			//! @param ext：文件后缀
			void KCNET_API split_path(const std::string &path, std::string &dir, std::string &file_base_name, std::string &ext);

			//! 文件是否存在
			bool KCNET_API file_exist(const std::string &file);

			//! 获取文件大小
			unsigned int KCNET_API file_size(const std::string &file);

			//! 将文件读取到读取字符串
			std::string KCNET_API read_string_from_file(const std::string &file);

			//! @brief 将字符串写入文件（文件不存在会新建）
			//! @param append: 表明是否将字符串追加到文件末尾
			bool KCNET_API write_string_to_file(const std::string &file, const std::string &content, bool append = false);



			//! @brief 创建文件
			//! @param over_write_if_exist：文件存在是否覆盖
			bool KCNET_API create_file(const std::string &file, bool over_write_if_exist = false);

			//! 删除文件
			bool KCNET_API delete_file(const std::string &file);

			//! 删除目录下所有文件
			bool KCNET_API delete_files_in_dir(const std::string &dir);

			//! 创建目录
			bool KCNET_API create_dir(const std::string &dir);

			//! @brief 删除目录
			//! @param delete_file_in_dir：是否同时删除目录下文件
			bool KCNET_API delete_dir(const std::string &dir, bool delete_file_in_dir = false);
		}
	}
}