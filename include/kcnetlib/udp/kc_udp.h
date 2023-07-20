#pragma once

#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/core/kc_event.h"
#include "kcnetlib/core/kc_ip.h"

namespace kc
{
	namespace net
	{
		class udp_imp;

		//! udp通信模块
		class KCNET_API udp
		{
		public:

			//! 构造函数
			udp();

			//! 析构函数
			virtual ~udp();

			//! 创建udp socket，ip为空表示监听所有ip的端口
			bool create(short port, const char *ip = "");

			//! 创建udp socket，ip为空表示监听所有ip的端口
			bool create(const kc::core::net_address &addr);

			//! @brief 接收回调
			//! @param src_addr 数据发送方的网络地址
			virtual void receivefrom_callback(const kc::core::net_address &src_addr, const unsigned char *buf, int len) {}

			//! @brief 发送数据
			//! @param src_addr 数据发送的目标网络地址
			int sendto(const kc::core::net_address &dst_addr, const unsigned char *buf, int len );

		private:
			udp_imp *m_imp;
		};

	}
}