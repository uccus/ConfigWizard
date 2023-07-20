/*!
 * \file rpc_node.h
 *
 * \author xwt
 * \date 十二月 2018
 *
 * \brief 基于UDP的进程间通信类
 */
#pragma once
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/serialization/kc_archive.h"
#include "kcnetlib/udp/kc_udp.h"

namespace kc
{
	namespace net
	{
		//! 进程间通信模块
		class KCNET_API rpc_node : public udp
		{
		public:
			//! 进程间发送数据
			bool rpc_send(const kc::core::net_address &dst_addr, const kc::serialization::binary_stream &data);

			//! 接收其他进程数据回调
			virtual void rpc_receive_callback(const kc::core::net_address &src_addr, kc::serialization::binary_stream &data) {}

		protected:
			void receivefrom_callback(const kc::core::net_address &src_addr, const unsigned char *buf, int len);

		};
	}
}