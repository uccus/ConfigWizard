#pragma once
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/core/kc_time.h"
#include "kcnetlib/core/kc_ip.h"
#include <string>

namespace kc
{
	namespace serialization
	{
		//! 序列化的数据类型
		enum datatype
		{
			dt_null=0,
			dt_bool,
			dt_int,
			dt_uint,
			dt_float,
			dt_double,
			dt_string,
			dt_time,
			dt_net_address,
			dt_memory
		};

		//! 二进制流对象
		class KCNET_API binary_stream
		{
		public:
			//! 构造函数
			binary_stream();

			//! 拷贝构造
			binary_stream(const binary_stream &bin_stream);

			//! 析构函数
			virtual ~binary_stream();

			//! 拷贝赋值
			void operator=(const binary_stream &bin_stream);

			//! 从文件加载
			bool load(const char * file);

			//! 从字节流加载
			bool load(const unsigned char * buf, unsigned int len);

			//! 保存至文件
			bool store(const char * file);

			//! 获取内存数据
			const unsigned char *buf() const;

			//! 获取数据长度
			unsigned int len() const;
			
			//! 从存档中读取数据
			bool operator >> (bool &value);
			//! 从存档中读取数据
			bool operator >> (int &value);
			//! 从存档中读取数据
			bool operator >> (unsigned int &value);
			//! 从存档中读取数据
			bool operator >> (float &value);
			//! 从存档中读取数据
			bool operator >> (double &value);
			//! 从存档中读取数据
			bool operator >> (std::string &value);
			//! 从存档中读取数据
			bool operator >> (kc::core::kctime &value);
			//! 从存档中读取数据
			bool operator >> (kc::core::net_address &value);

			//! 将数据写入存档
			void operator<<(bool value);
			//! 将数据写入存档
			void operator<<(int value);
			//! 将数据写入存档
			void operator<<(unsigned int value);
			//! 将数据写入存档
			void operator<<(float value);
			//! 将数据写入存档
			void operator<<(double value);
			//! 将数据写入存档
			void operator<<(const char * value);
			//! 将数据写入存档
			void operator<<(std::string value);
			//! 将数据写入存档
			void operator<<(kc::core::kctime value);
			//! 将数据写入存档
			void operator<<(kc::core::net_address value);

			//! 从存档中读取数据
			bool read(void *buf, unsigned int len);
			//! 将数据写入存档
			void write(const void *buf, unsigned int len);

			//! 是否可以读取
			bool can_read();

			//! 观察下一个数据类型（仅观察，不消耗）
			datatype watch_next_dt();

			//! 观察下一个数据的长度（仅观察，不消耗）
			unsigned int watch_next_len();

			//! 移动到指定位置
			void seek(unsigned int pos);

		private:
			void clear();

			inline bool read_dt(datatype dt);
			inline void write_dt(datatype dt);

			inline bool read_variable(datatype dt, void *buf, unsigned int len);
			inline void write_variable(datatype dt, const void *buf, unsigned int len);

			inline bool read_buf( void *buf, unsigned int len);
			inline void write_buf( const void *buf, unsigned int len);

		protected:
			unsigned char *m_buf;
			unsigned int		m_buf_len;
			unsigned int		m_data_len;
			unsigned int		m_data_pos;
		};


		class KCNET_API json_stream
		{
		public:

			//! 构造函数
			json_stream();

			//! 析构函数
			virtual ~json_stream();

			//! 拷贝赋值
			void operator=(const json_stream &bs);

			//! 从文件加载
			bool load(const char * file);

			//! 从字符串加载
			bool load(const std::string &str);

			//! 移动到指定位置
			void seek(unsigned int pos);

			//! 保存至文件
			bool store(const char * file);

			//! 保存到字符串
			std::string store();

			//! 从存档中读取数据
			void operator >> (bool &value);
			//! 从存档中读取数据
			void operator >> (int &value);
			//! 从存档中读取数据
			void operator >> (unsigned int &value);
			//! 从存档中读取数据
			void operator >> (float &value);
			//! 从存档中读取数据
			void operator >> (double &value);
			//! 从存档中读取数据
			void operator >> (std::string &value);
			//! 从存档中读取数据
			void operator >> (kc::core::kctime &value);

			//! 将数据写入存档
			void operator<<(bool value);
			//! 将数据写入存档
			void operator<<(int value);
			//! 将数据写入存档
			void operator<<(unsigned int value);
			//! 将数据写入存档
			void operator<<(float value);
			//! 将数据写入存档
			void operator<<(double value);
			//! 将数据写入存档
			void operator<<(const char * value);
			//! 将数据写入存档
			void operator<<(std::string value);
			//! 将数据写入存档
			void operator<<(kc::core::kctime value);

		protected:
			void clear();
		protected:
			void *	m_json_obj;
			int		m_pos;
		};

	}
}