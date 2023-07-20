#pragma once

#include "kcnetlib/core/kc_dll_export.h"

namespace kc
{
	namespace net
	{
		class tcp_client_imp;

		//! tcp客户端
		class KCNET_API tcp_client
		{
		public:

			//! 构造函数
			tcp_client();

			//! 析构函数
			virtual ~tcp_client();

			//! @brief 连接
			//! @param timeout 超时时间，单位ms，超时时间为0表示一直连接直到连上为止
			bool				connect(const char* server, int port, int timeout = 1000);

			//! 断开连接
			bool				disconnect();

			//! 检查连接是否完全断开
			bool				is_disconnected();

			//! 接收到服务器数据后回调
			virtual void	receiveCallback(const unsigned char *buf, const unsigned int len) {}

			//! 与服务器断开连接后回调
			virtual void	disconnectCallback() {};

			//! 发送数据
			int					send(const unsigned char* buffer, const unsigned int len);
		private:
			tcp_client_imp *m_imp;
		};
	}
}
