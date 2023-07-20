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

		//! redis�ͻ���
		class KCNET_API redis_client
		{
		public:
			redis_client();
			virtual ~redis_client();

			//! �������ݿ�
			bool redis_connect(const char *ip = "127.0.0.1", int port = 6379, const char *password = NULL, int timeout_ms = 1000);

			//! �Ͽ�����
			bool disconnect();

			//! ��������Ƿ�����
			bool ping();

			// ö�ٷ���������key
			bool enum_key(const std::string &key_pattern, std::vector<std::string> &keys);

			//! ɾ����
			bool delete_key(const std::string &key);

			//! ��ȡ��ֵ
			bool get(const std::string &key, std::string &value);

			//! ��ȡ��ֵ��ֵΪkc::serialization::binary_stream����
			bool get_binary_stream(const std::string &key, kc::serialization::binary_stream &bin_stream);

			//! ���ü�ֵ
			bool set(const std::string &key, const std::string &value, int expire=-1);

			//! ���ü�ֵ��ֵΪkc::serialization::binary_stream����
			bool set_binary_stream(const std::string &key, const kc::serialization::binary_stream &bin_stream, int expire = -1);

			//! ��ȡhash��
			bool hget(const std::string &key, const std::string &field, std::string &value);
			//! ����hash��
			bool hset(const std::string &key, const std::string &field, const std::string &value);
			bool hmset(const std::string &key, const std::map<std::string, std::string> &value);

			//! ��ȡ�б��������
			bool lget(const std::string &key, std::string &value);

			//! ����Ԫ�ص��б������
			bool lpush(const std::string &key, const std::string &value);

			//! ��ȡ�б����Ҳ�Ԫ�ز��Ƴ�
			bool rpop(const std::string &key, std::string &value);

			//! ��ȡ�б����Ҳ�Ԫ�ز��Ƴ��������� timeout ��ʱʱ�䣬��λs
			bool brpop(const std::string &key, std::string &value, int timeout = 1);

			//! �ü��б����ݣ�����start~stop
			bool ltrim(const std::string &key, int start, int stop);

			//! ��ȡ�б�Ԫ������
			int lsize(const std::string &key);

			//! ɾ���б���������
			bool lclear(const std::string &key);

		private:
			redis_client_data *m_data;
		};
	}
}