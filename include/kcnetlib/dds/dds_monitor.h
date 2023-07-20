/*!
 * \file dds_monitor.h
 *
 * \author xwt
 * \date ʮ���� 2018
 *
 * \brief dds���������, dds=Distributed Data Server �ֲ�ʽ���ݷ���
 */
#pragma once
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/core/kc_ip.h"
#include "kcnetlib/serialization/kc_stream.h"
#include "kcnetlib/dds/dds_server.h"
#include <vector>

namespace kc
{
	//! ����ģ��
	namespace net
	{
		//! dds�ڵ���Ϣ
		struct DDS_NODE_INFO
		{
			std::string node_name;
			std::vector<std::string> subs_message;
			std::vector<std::string> subs_service;
		};

		class dds_monitor_imp;

		//! dds���������
		class KCNET_API dds_monitor
		{
		public:
			//! ���캯��
			dds_monitor();

			//! ��������
			virtual ~dds_monitor();

			//! @brief ���������ӵ�������
			//! @param server_addr ��������ַ
			//! @param timeout ��ʱʱ�䣬��λms
			bool create(const kc::core::net_address &server_addr, int timeout=1000);

			//! �Ͽ�����
			bool disconnect();

			//! ��ȡ�����ڵĽڵ��б�
			bool get_node_info( std::vector<DDS_NODE_INFO> &nodes_info) ;

			//! ���ջص������Խ��յ�����dds�����ڷ�������Ϣ�ͷ���
			virtual void on_dds_data(const dds_packet &packet, kc::serialization::binary_stream &data) = 0;

		protected:
			dds_monitor_imp *m_imp;
		};

	}
}