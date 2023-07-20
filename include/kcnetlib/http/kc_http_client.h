#pragma once

#include "kcnetlib/core/kc_dll_export.h"

#include <string>
#include <vector>

namespace kc
{
	namespace net
	{
		class http_client_imp;

		//! http�ͻ���
		class KCNET_API http_client
		{
		public:
			//! ���캯��
			http_client();

			//! ��������
			virtual ~http_client();

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
			//! @param response_content �� ������Ӧ������
			//! @param timeout ����ʱʱ��
			bool http_call(const std::string http_method, const std::string url, const std::string content_type, const std::string request_content, std::string &response_content, int timeout=1000);

		private:
			http_client_imp *m_imp;
		};
	}
}