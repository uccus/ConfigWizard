#pragma once

#include "kcnetlib/core/kc_dll_export.h"

namespace kc
{
	namespace net
	{
		class tcp_server_imp;

		//! tcp������
		class KCNET_API tcp_server
		{
		public:
			//! ���캯��
			tcp_server();

			//! ��������
			virtual ~tcp_server();

			//! ��������port�������˿ں�
			bool		start(int port, const char* address = "");

			//! ֹͣ����
			bool		stop();

			//! �ͻ������ӻص���connect_idΪ�ͻ�������id����ͬ�ͻ���connect_id��ͬ
			virtual void	acceptCallback(const int connect_id) {}

			//! ���յ��ͻ������ݺ�ص���connect_idΪ�ͻ�������id����ͬ�ͻ���connect_id��ͬ
			virtual void	receiveCallback(const int connect_id, const unsigned char *buf, const unsigned int len) {}

			//! �ͻ��˶Ͽ���ص���connect_idΪ�ͻ�������id����ͬ�ͻ���connect_id��ͬ
			virtual void	disconnectCallback(const int connect_id) {};

			//! �������ݣ�connect_idΪ�ͻ�������id����ͬ�ͻ���connect_id��ͬ
			int					send(const int connect_id, const unsigned char* buffer, const unsigned int len);

		private:
			tcp_server_imp * m_imp;
		};
	}
}