#pragma once

#include "kcnetlib/core/kc_dll_export.h"

namespace kc
{
	namespace net
	{
		class tcp_client_imp;

		//! tcp�ͻ���
		class KCNET_API tcp_client
		{
		public:

			//! ���캯��
			tcp_client();

			//! ��������
			virtual ~tcp_client();

			//! @brief ����
			//! @param timeout ��ʱʱ�䣬��λms����ʱʱ��Ϊ0��ʾһֱ����ֱ������Ϊֹ
			bool				connect(const char* server, int port, int timeout = 1000);

			//! �Ͽ�����
			bool				disconnect();

			//! ��������Ƿ���ȫ�Ͽ�
			bool				is_disconnected();

			//! ���յ����������ݺ�ص�
			virtual void	receiveCallback(const unsigned char *buf, const unsigned int len) {}

			//! ��������Ͽ����Ӻ�ص�
			virtual void	disconnectCallback() {};

			//! ��������
			int					send(const unsigned char* buffer, const unsigned int len);
		private:
			tcp_client_imp *m_imp;
		};
	}
}
