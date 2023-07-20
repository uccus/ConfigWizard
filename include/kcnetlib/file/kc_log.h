#pragma once

#include "kcnetlib/core/kc_dll_export.h"


namespace kc
{
	namespace file
	{
		class log_imp;


		//! 日志类
		class KCNET_API log
		{
		public:
			//! 构造函数
			log();

			//! 析构函数
			virtual ~log();

			//! @brief 初始化
			//! @param file_name 日志初始文件名称
			//! @param file_dir 日志存储目录，默认存储在运行程序目录下的log目录下
			//! @param print 日志是否同时打印
			//! @param max_file_num 最大文件数量，日志文件超过该文件数，则覆盖最早的文件
			//! @param max_file_size 每个文件的大小，超过该文件大小，则重新创建一个
			//! @param asyn_log 是否采用异步日志
			void init(const char *file_name = "log", const char *file_dir = 0, bool print = false, int max_file_num = 16, int max_file_size = 10 * 1024 * 1024, bool asyn_log = false, bool zip=false);

			//! 写日志
			void write(const char* format, ...);

			//! 写日志
			void write_str(const char *str );
			
		private:
			log_imp *m_imp;
		};
	}
}