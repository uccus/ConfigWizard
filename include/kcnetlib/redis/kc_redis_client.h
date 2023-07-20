#pragma once
#include <vector>
#include <map>
#include <string>
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/serialization/kc_stream.h"
namespace kc
{
	namespace net
	{
		class redis_client_data;

		//! redis客户端
		class KCNET_API redis_client
		{
		public:
			redis_client();
			virtual ~redis_client();

			//! 连接数据库
			bool redis_connect(const char *ip = "127.0.0.1", int port = 6379, const char *password = NULL, int timeout_ms = 1000);

			//! 断开连接
			bool disconnect();

			//! 检测连接是否正常
			bool ping();

			// 枚举符合条件的key
			bool enum_key(const std::string &key_pattern, std::vector<std::string> &keys);

			//! 删除键
			bool delete_key(const std::string &key);

			//! 获取键值
			bool get(const std::string &key, std::string &value);

			//! 获取键值（值为kc::serialization::binary_stream对象）
			bool get_binary_stream(const std::string &key, kc::serialization::binary_stream &bin_stream);

			//! 设置键值
			bool set(const std::string &key, const std::string &value, int expire=-1);

			//! 设置键值（值为kc::serialization::binary_stream对象）
			bool set_binary_stream(const std::string &key, const kc::serialization::binary_stream &bin_stream, int expire = -1);

			//! 获取hash表
			bool hget(const std::string &key, const std::string &field, std::string &value);
			//! 设置hash表
			bool hset(const std::string &key, const std::string &field, const std::string &value);
			bool hmset(const std::string &key, const std::map<std::string, std::string> &value);

			//! 获取列表左侧数据
			bool lget(const std::string &key, std::string &value);

			//! 插入元素到列表最左侧
			bool lpush(const std::string &key, const std::string &value);

			//! 获取列表最右侧元素并移除
			bool rpop(const std::string &key, std::string &value);

			//! 获取列表最右侧元素并移除（阻塞） timeout 超时时间，单位s
			bool brpop(const std::string &key, std::string &value, int timeout = 1);

			//! 裁剪列表内容，保留start~stop
			bool ltrim(const std::string &key, int start, int stop);

			//! 获取列表元素数量
			int lsize(const std::string &key);

			//! 删除列表所有内容
			bool lclear(const std::string &key);

		private:
			redis_client_data *m_data;
		};
	}
}