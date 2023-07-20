#pragma once

#include "kcnetlib/core/kc_dll_export.h"
#include <string>

namespace kc
{
	namespace net
	{ 
		class http_server_imp;

		//! http������
		class KCNET_API http_server
		{
		public:
			//! ���캯��
			http_server();

			//! ��������
			virtual ~http_server();

			//! ����������
			bool				start(int port, const char* address = "");

			//! ֹͣ������
			bool				stop();

			//! @brief �������ص�
			//! @param method ��http��������GET, POST��
			//! @param url �����ʵ�����
			//! @param request_content ���ͻ�����������
			//! @param response_content �� ������Ӧ������
			//! @param response_content_type : ������Ӧ���������ͣ��磺text/html  application/json
			virtual bool	serviceCallback(const std::string method, const std::string &url, const std::string &request_content, std::string &response_content, std::string &response_content_type) = 0;

		private:
			http_server_imp	*m_imp;
		};
	}
}