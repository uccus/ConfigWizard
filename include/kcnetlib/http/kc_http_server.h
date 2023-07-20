#pragma once

#include "kcnetlib/core/kc_dll_export.h"
#include <string>

namespace kc
{
	namespace net
	{ 
		class http_server_imp;

		//! http服务器
		class KCNET_API http_server
		{
		public:
			//! 构造函数
			http_server();

			//! 析构函数
			virtual ~http_server();

			//! 启动服务器
			bool				start(int port, const char* address = "");

			//! 停止服务器
			bool				stop();

			//! @brief 服务器回调
			//! @param method ：http方法，如GET, POST等
			//! @param url ：访问的链接
			//! @param request_content ：客户端请求数据
			//! @param response_content ： 服务器应答数据
			//! @param response_content_type : 服务器应答数据类型，如：text/html  application/json
			virtual bool	serviceCallback(const std::string method, const std::string &url, const std::string &request_content, std::string &response_content, std::string &response_content_type) = 0;

		private:
			http_server_imp	*m_imp;
		};
	}
}