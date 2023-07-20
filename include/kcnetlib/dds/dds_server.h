/*!
 * \file dds_server.h
 *
 * \author xwt
 * \date 十二月 2018
 *
 * \brief dds服务器, dds=Distributed Data Server 分布式数据服务
 */
#pragma once
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/serialization/kc_stream.h"

namespace kc
{
	namespace net
	{
		class dds_server_imp;

		//! dds数据包头格式定义
		struct dds_packet
		{
			std::string type;		// 数据包类型，包括：msg、request、response
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

		//! 分布式数据服务器
		class KCNET_API dds_server
		{
		public:
			//! 构造函数
			dds_server();

			//! 析构函数
			virtual ~dds_server();

			//! 启动服务
			bool start(short port, const char *ip = "");

			//! 连接到另一个dds服务器，成功连接后两个dds网络是互通的
			bool connect_to_another_dds_server(const char *ip, short port);
			
			//! 让服务器转发数据
			void transfer(kc::serialization::binary_stream &data);

		private:
			dds_server_imp *m_imp;
		};
	}
}