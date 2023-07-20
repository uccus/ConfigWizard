/*!
 * \file dds_server.h
 *
 * \author xwt
 * \date ʮ���� 2018
 *
 * \brief dds������, dds=Distributed Data Server �ֲ�ʽ���ݷ���
 */
#pragma once
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/serialization/kc_stream.h"

namespace kc
{
	namespace net
	{
		class dds_server_imp;

		//! dds���ݰ�ͷ��ʽ����
		struct dds_packet
		{
			std::string type;		// ���ݰ����ͣ�������msg��request��response
			std::string msg;
			std::string src_node;
			std::string dst_node;

			dds_packet() {}

			dds_packet(const std::string &type, const std::string & msg, const std::string &src_node, const std::string & dst_node)
			{
				this->dst_node = dst_node;
				this->msg = msg;
				this->src_node = src_node;
				this->type = type;
			}
		};

		//! �ֲ�ʽ���ݷ�����
		class KCNET_API dds_server
		{
		public:
			//! ���캯��
			dds_server();

			//! ��������
			virtual ~dds_server();

			//! ��������
			bool start(short port, const char *ip = "");

			//! ���ӵ���һ��dds���������ɹ����Ӻ�����dds�����ǻ�ͨ��
			bool connect_to_another_dds_server(const char *ip, short port);
			
			//! �÷�����ת������
			void transfer(kc::serialization::binary_stream &data);

		private:
			dds_server_imp *m_imp;
		};
	}
}