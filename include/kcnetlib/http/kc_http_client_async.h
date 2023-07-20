#pragma once

#include "kcnetlib/core/kc_dll_export.h"

#include <string>
#include <vector>

namespace kc
{
	namespace net
	{
		class http_client_async_imp;

		//! http�ͻ��ˣ��첽��
		class KCNET_API http_client_async
		{
		public:
			//! ���캯��
			http_client_async();

			//! ��������
			virtual ~http_client_async();

			//! ����, ��ʱʱ��Ϊ0��ʾһֱ����ֱ������Ϊֹ
			bool connect(const char* server, int port, int timeout = 0);

			//! �Ͽ�����
			bool disconnect();

			//! �Ƿ����ӶϿ�
			bool is_disconnected() const;

			//! @brief ����http����
			//! @param http_method ��http��������GET, POST��
			//! @param url �����ʵ�����
			//! @param content_type �����ݸ�ʽ���ͣ��磺text/html  application/json
			//! @param request_content ����������
			bool http_request(const std::string http_method, const std::string url, const std::string content_type, const std::string request_content);
			
			//! @brief http���ջص�
			//! @param response_content �� ������Ӧ������
			virtual void http_recv_callback(const std::string &response_content) {}

		private:
			http_client_async_imp *m_imp;
		};
	}
}