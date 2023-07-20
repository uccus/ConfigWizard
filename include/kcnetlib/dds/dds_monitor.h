/*!
 * \file dds_monitor.h
 *
 * \author xwt
 * \date 十二月 2018
 *
 * \brief dds网络监视器, dds=Distributed Data Server 分布式数据服务
 */
#pragma once
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/core/kc_ip.h"
#include "kcnetlib/serialization/kc_stream.h"
#include "kcnetlib/dds/dds_server.h"
#include <vector>

namespace kc
{
	//! 网络模块
	namespace net
	{
		//! dds节点信息
		struct DDS_NODE_INFO
		{
			std::string node_name;
			std::vector<std::string> subs_message;
			std::vector<std::string> subs_service;
		};

		class dds_monitor_imp;

		//! dds网络监视器
		class KCNET_API dds_monitor
		{
		public:
			//! 构造函数
			dds_monitor();

			//! 析构函数
			virtual ~dds_monitor();

			//! @brief 创建并连接到服务器
			//! @param server_addr 服务器地址
			//! @param timeout 超时时间，单位ms
			bool create(const kc::core::net_address &server_addr, int timeout=1000);

			//! 断开连接
			bool disconnect();

			//! 获取网络内的节点列表
			bool get_node_info( std::vector<DDS_NODE_INFO> &nodes_info) ;

			//! 接收回调，可以接收到所有dds网络内发布的消息和服务
			virtual void on_dds_data(const dds_packet &packet, kc::serialization::binary_stream &data) = 0;

		protected:
			dds_monitor_imp *m_imp;
		};

	}
}