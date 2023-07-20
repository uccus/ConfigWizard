/*!
 * \file kc_ip.h
 *
 * \author xwt
 * \date 十二月 2018
 *
 * @brief ipv4的网络地址
 */
#pragma once

#include "kc_dll_export.h"
#include <string>

namespace kc
{
	namespace core
	{
		class kc_ip4_imp;

		//! kc_ipv4，提供ip地址的分解，合并，转换等接口
		class KCNET_API kc_ip4
		{
		public:
			//! 默认构造
			kc_ip4();

			//! 通过字符串构造
			kc_ip4(const char *ip_str);

			//! 通过字符串构造
			kc_ip4(const std::string ip_str);

			//! 通过4字节整数构造，小端格式
			kc_ip4(const unsigned int ip_ui);		

			//! 构造，b1~b4分别是ip地址第1~4个字节
			kc_ip4(const unsigned char b1, const unsigned char b2, const unsigned char b3, const unsigned char b4);

			//! 拷贝构造
			kc_ip4(const kc_ip4 &ip);

			//! 析构
			virtual ~kc_ip4();

			//! 是否是有效的IP
			bool valid() const;

			//! 拷贝赋值
			kc_ip4&  operator=(const kc_ip4 &ip);

			//! 设置，输入参数是字符串
			bool set(const char *ip_str);

			//! 设置，输入参数是字符串
			bool set(const std::string ip_str);

			//! 设置，输入参数是小端格式的ip地址
			bool set(const unsigned int ip_ui);			

			//!设置，b1~b4分别是ip地址第1~4个字节
			bool set(const unsigned char b1, const unsigned char b2, const unsigned char b3, const unsigned char b4);
			
			//! 转换成字符串
			std::string str() const;

			//! 转换成32位整数
			unsigned int ui() const;

			//! 取ip地址第1个字节
			unsigned char filed1() const;

			//! 取ip地址第2个字节
			unsigned char field2() const;

			//! 取ip地址第3个字节
			unsigned char field3() const;

			//! 取ip地址第4个字节
			unsigned char field4() const;

		private:
			kc_ip4_imp *m_imp;
		};

		//! 网络地址，包括ip和端口
		class KCNET_API net_address
		{
		public:

			//! 默认构造
			net_address();

			//! 通过ip和端口构造
			net_address(const char *ip, int port);

			//! 拷贝构造
			net_address(const net_address &addr);

			//! 是否是有效的地址
			bool valid();

			//! 拷贝赋值
			net_address& operator=(const net_address &addr);

			//! 是否相同
			bool operator==(const net_address &addr);

			//! 获取ip地址
			kc_ip4 get_ip() const;

			//! 获取字符串格式的ip地址
			std::string get_ip_str() const;

			//! 获取端口号
			short	get_port() const;

			//! 设置ip
			void	set_ip(const kc_ip4 &ip);

			//! 设置端口
			void	set_port(short port);

		protected:
			kc_ip4 m_ip;
			short	m_port;

		};

	}
}
