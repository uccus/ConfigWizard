#pragma once

#include "kcnetlib/core/kc_dll_export.h"

#include <string>
#include <vector>

namespace kc
{
	namespace net
	{
		class http_client_imp;

		//! http客户端
		class KCNET_API http_client
		{
		public:
			//! 构造函数
			http_client();

			//! 析构函数
			virtual ~http_client();

			//! 连接, 超时时间为0表示一直连接直到连上为止
			bool connect(const char* server, int port, int timeout = 0);

			//! 断开连接
			bool disconnect();

			//! 是否连接断开
			bool is_disconnected() const;

			//! @brief 发送http请求
			//! @param http_method ：http方法，如GET, POST等
			//! @param url ：访问的链接
			//! @param content_type ：数据格式类型，如：text/html  application/json
			//! @param request_content ：请求数据
			//! @param response_content ： 服务器应答数据
			//! @param timeout ：超时时间
			bool http_call(const std::string http_method, const std::string url, const std::string content_type, const std::string request_content, std::string &response_content, int timeout=1000);

		private:
			http_client_imp *m_imp;
		};
	}
}