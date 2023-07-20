#pragma once

#include <string>
#include "kcnetlib/core/kc_dll_export.h"


namespace kc
{
	namespace file
	{
		// 内存文件，为解决多线程读写文件内容不同步的问题
		// 文件内容在内存中，文件内容变换会将内容更新到硬盘（更新到硬盘时间取决于操作系统）
		class KCNET_API memory_file
		{
		public:
			static std::string read(const std::string &file_path);
			static void write(const std::string &file_path, const std::string &file_data);
		};

		// 异步写文件，为解决频繁写文件导致系统IO过高导致写文件延时的问题
		// 通过内置线程将数据写入指定文件（更新到硬盘时间取决于操作系统）
		class async_write_file_imp;
		class KCNET_API async_write_file
		{
		public:
			async_write_file();
			virtual ~async_write_file();
			bool open(const std::string &file_path);
			bool close();
			bool append(const std::string &file_data);

		private:
			async_write_file_imp *m_imp;
		};
	}
}