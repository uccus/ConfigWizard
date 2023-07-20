/*!
 * \file dds_node.h
 *
 * \author xwt
 * \date 十二月 2018
 *
 * \brief dds网络节点, dds=Distributed Data Server 分布式数据服务
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

		//! @brief 分布式数据节点\n
		/**
		分布式数据服务包括消息和服务两种模型：消息是一对多的，服务是一对一的\n
		名称是消息和服务的唯一标识，不同的消息/服务名称必须不同\n
		节点可以订阅指定名称的消息和服务\n
		节点也可以向网络内发布指定名称的消息和服务\n
		*/
		class KCNET_API dds_node
		{
		public:
			//! 构造函数
			dds_node();

			//! 析构函数
			virtual ~dds_node();

			//! @brief 创建并连接到服务器
			//! @param server_addr 服务器地址
			//! @param node_name : 节点名称，节点名称要求唯一，可以不指定节点名称，系统会自动创建，可以通过get_node_name获取
			//! @param timeout 超时时间，单位ms
			bool create(const kc::core::net_address &server_addr, const char* node_name=NULL, int timeout = 1000);

			//! 获取节点名称
			std::string get_node_name() const;

			//! @brief 发布消息
			//! @param name 消息名称
			//! @param data 消息数据
			bool publish_message(const std::string name, const kc::serialization::binary_stream &data);

			//! @brief 添加订阅的消息
			//! @param name 消息名称
			bool add_subscribe_message(const std::string name);

			//! @brief 删除订阅的消息
			//! @param name 消息名称
			bool remove_subscribe_message(const std::string name);

			//! @brief 消息回调接口，当网络内有节点发布此节点订阅的消息，会通过该回调接口通知节点
			//! @param src_node_name 消息发布者的节点名称
			//! @param msg_name 消息名称
			//! @param msg_data 消息数据	
			virtual void on_message(const std::string src_node_name, const std::string msg_name, kc::serialization::binary_stream &msg_data) {}
			
			//! @brief 调用服务，无响应数据
			//! @param timeout 服务响应的超时时间，单位ms
			bool call_service(const std::string name, const kc::serialization::binary_stream &request, int timeout=1000);

			//! @brief 调用服务，有响应数据
			//! @param timeout 服务响应的超时时间，单位ms
			bool call_service(const std::string name, const kc::serialization::binary_stream &request, kc::serialization::binary_stream &response, int timeout = 1000);

			//! @brief 添加订阅的服务
			//! @param name 服务名称
			bool add_subscribe_service(const std::string name);

			//! @brief 删除订阅的服务
			//! @param name 服务名称
			bool remove_subscribe_service(const std::string name);

			//! @brief 服务回调接口，当网络内有节点调用此节点订阅的服务，会通过该回调接口通知节点
			//! @param src_node_name 服务调用者的节点名称
			//! @param msg_name 服务名称
			//! @param request 服务请求数据	
			//! @param response 服务应答数据，需要本节点赋值
			virtual bool on_service(const std::string src_node_name, const std::string msg_name, kc::serialization::binary_stream &request, kc::serialization::binary_stream &response) { return false; }
			
			//! 断开连接
			virtual bool destroy();

		private:
			dds_node_imp *m_imp;
		};
	}
}