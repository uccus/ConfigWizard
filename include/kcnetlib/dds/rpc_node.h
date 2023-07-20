/*!
 * \file rpc_node.h
 *
 * \author xwt
 * \date ʮ���� 2018
 *
 * \brief ����UDP�Ľ��̼�ͨ����
 */
#pragma once
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/serialization/kc_archive.h"
#include "kcnetlib/udp/kc_udp.h"

namespace kc
{
	namespace net
	{
		//! ���̼�ͨ��ģ��
		class KCNET_API rpc_node : public udp
		{
		public:
			//! ���̼䷢������
			bool rpc_send(const kc::core::net_address &dst_addr, const kc::serialization::binary_stream &data);

			//! ���������������ݻص�
			virtual void rpc_receive_callback(const kc::core::net_address &src_addr, kc::serialization::binary_stream &data) {}

		protected:
			void receivefrom_callback(const kc::core::net_address &src_addr, const unsigned char *buf, int len);

		};
	}
}