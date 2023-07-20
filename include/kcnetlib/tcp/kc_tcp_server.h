#pragma once

#include "kcnetlib/core/kc_dll_export.h"

namespace kc
{
	namespace net
	{
		class tcp_server_imp;

		//! tcp服务器
		class KCNET_API tcp_server
		{
		public:
			//! 构造函数
			tcp_server();

			//! 析构函数
			virtual ~tcp_server();

			//! 启动服务，port：监听端口号
			bool		start(int port, const char* address = "");

			//! 停止服务
			bool		stop();

			//! 客户端连接回调，connect_id为客户端连接id，不同客户端connect_id不同
			virtual void	acceptCallback(const int connect_id) {}

			//! 接收到客户端数据后回调，connect_id为客户端连接id，不同客户端connect_id不同
			virtual void	receiveCallback(const int connect_id, const unsigned char *buf, const unsigned int len) {}

			//! 客户端断开后回调，connect_id为客户端连接id，不同客户端connect_id不同
			virtual void	disconnectCallback(const int connect_id) {};

			//! 发送数据，connect_id为客户端连接id，不同客户端connect_id不同
			int					send(const int connect_id, const unsigned char* buffer, const unsigned int len);

		private:
			tcp_server_imp * m_imp;
		};
	}
}