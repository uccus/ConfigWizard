/*!
 * \file dds_node.h
 *
 * \author xwt
 * \date ʮ���� 2018
 *
 * \brief dds����ڵ�, dds=Distributed Data Server �ֲ�ʽ���ݷ���
 */
#pragma once
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/core/kc_ip.h"
#include "kcnetlib/udp/kc_udp.h"
#include "kcnetlib/serialization/kc_archive.h"

namespace kc
{
	namespace net
	{
		class dds_node_imp;

		//! @brief �ֲ�ʽ���ݽڵ�\n
		/**
		�ֲ�ʽ���ݷ��������Ϣ�ͷ�������ģ�ͣ���Ϣ��һ�Զ�ģ�������һ��һ��\n
		��������Ϣ�ͷ����Ψһ��ʶ����ͬ����Ϣ/�������Ʊ��벻ͬ\n
		�ڵ���Զ���ָ�����Ƶ���Ϣ�ͷ���\n
		�ڵ�Ҳ�����������ڷ���ָ�����Ƶ���Ϣ�ͷ���\n
		*/
		class KCNET_API dds_node
		{
		public:
			//! ���캯��
			dds_node();

			//! ��������
			virtual ~dds_node();

			//! @brief ���������ӵ�������
			//! @param server_addr ��������ַ
			//! @param node_name : �ڵ����ƣ��ڵ�����Ҫ��Ψһ�����Բ�ָ���ڵ����ƣ�ϵͳ���Զ�����������ͨ��get_node_name��ȡ
			//! @param timeout ��ʱʱ�䣬��λms
			bool create(const kc::core::net_address &server_addr, const char* node_name=NULL, int timeout = 1000);

			//! ��ȡ�ڵ�����
			std::string get_node_name() const;

			//! @brief ������Ϣ
			//! @param name ��Ϣ����
			//! @param data ��Ϣ����
			bool publish_message(const std::string name, const kc::serialization::binary_stream &data);

			//! @brief ��Ӷ��ĵ���Ϣ
			//! @param name ��Ϣ����
			bool add_subscribe_message(const std::string name);

			//! @brief ɾ�����ĵ���Ϣ
			//! @param name ��Ϣ����
			bool remove_subscribe_message(const std::string name);

			//! @brief ��Ϣ�ص��ӿڣ����������нڵ㷢���˽ڵ㶩�ĵ���Ϣ����ͨ���ûص��ӿ�֪ͨ�ڵ�
			//! @param src_node_name ��Ϣ�����ߵĽڵ�����
			//! @param msg_name ��Ϣ����
			//! @param msg_data ��Ϣ����	
			virtual void on_message(const std::string src_node_name, const std::string msg_name, kc::serialization::binary_stream &msg_data) {}
			
			//! @brief ���÷�������Ӧ����
			//! @param timeout ������Ӧ�ĳ�ʱʱ�䣬��λms
			bool call_service(const std::string name, const kc::serialization::binary_stream &request, int timeout=1000);

			//! @brief ���÷�������Ӧ����
			//! @param timeout ������Ӧ�ĳ�ʱʱ�䣬��λms
			bool call_service(const std::string name, const kc::serialization::binary_stream &request, kc::serialization::binary_stream &response, int timeout = 1000);

			//! @brief ��Ӷ��ĵķ���
			//! @param name ��������
			bool add_subscribe_service(const std::string name);

			//! @brief ɾ�����ĵķ���
			//! @param name ��������
			bool remove_subscribe_service(const std::string name);

			//! @brief ����ص��ӿڣ����������нڵ���ô˽ڵ㶩�ĵķ��񣬻�ͨ���ûص��ӿ�֪ͨ�ڵ�
			//! @param src_node_name ��������ߵĽڵ�����
			//! @param msg_name ��������
			//! @param request ������������	
			//! @param response ����Ӧ�����ݣ���Ҫ���ڵ㸳ֵ
			virtual bool on_service(const std::string src_node_name, const std::string msg_name, kc::serialization::binary_stream &request, kc::serialization::binary_stream &response) { return false; }
			
			//! �Ͽ�����
			virtual bool destroy();

		private:
			dds_node_imp *m_imp;
		};
	}
}