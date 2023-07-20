#pragma once

#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/core/kc_event.h"
#include "kcnetlib/core/kc_ip.h"

namespace kc
{
	namespace net
	{
		class udp_imp;

		//! udpͨ��ģ��
		class KCNET_API udp
		{
		public:

			//! ���캯��
			udp();

			//! ��������
			virtual ~udp();

			//! ����udp socket��ipΪ�ձ�ʾ��������ip�Ķ˿�
			bool create(short port, const char *ip = "");

			//! ����udp socket��ipΪ�ձ�ʾ��������ip�Ķ˿�
			bool create(const kc::core::net_address &addr);

			//! @brief ���ջص�
			//! @param src_addr ���ݷ��ͷ��������ַ
			virtual void receivefrom_callback(const kc::core::net_address &src_addr, const unsigned char *buf, int len) {}

			//! @brief ��������
			//! @param src_addr ���ݷ��͵�Ŀ�������ַ
			int sendto(const kc::core::net_address &dst_addr, const unsigned char *buf, int len );

		private:
			udp_imp *m_imp;
		};

	}
}