/*!
 * \file kc_ip.h
 *
 * \author xwt
 * \date ʮ���� 2018
 *
 * @brief ipv4�������ַ
 */
#pragma once

#include "kc_dll_export.h"
#include <string>

namespace kc
{
	namespace core
	{
		class kc_ip4_imp;

		//! kc_ipv4���ṩip��ַ�ķֽ⣬�ϲ���ת���Ƚӿ�
		class KCNET_API kc_ip4
		{
		public:
			//! Ĭ�Ϲ���
			kc_ip4();

			//! ͨ���ַ�������
			kc_ip4(const char *ip_str);

			//! ͨ���ַ�������
			kc_ip4(const std::string ip_str);

			//! ͨ��4�ֽ��������죬С�˸�ʽ
			kc_ip4(const unsigned int ip_ui);		

			//! ���죬b1~b4�ֱ���ip��ַ��1~4���ֽ�
			kc_ip4(const unsigned char b1, const unsigned char b2, const unsigned char b3, const unsigned char b4);

			//! ��������
			kc_ip4(const kc_ip4 &ip);

			//! ����
			virtual ~kc_ip4();

			//! �Ƿ�����Ч��IP
			bool valid() const;

			//! ������ֵ
			kc_ip4&  operator=(const kc_ip4 &ip);

			//! ���ã�����������ַ���
			bool set(const char *ip_str);

			//! ���ã�����������ַ���
			bool set(const std::string ip_str);

			//! ���ã����������С�˸�ʽ��ip��ַ
			bool set(const unsigned int ip_ui);			

			//!���ã�b1~b4�ֱ���ip��ַ��1~4���ֽ�
			bool set(const unsigned char b1, const unsigned char b2, const unsigned char b3, const unsigned char b4);
			
			//! ת�����ַ���
			std::string str() const;

			//! ת����32λ����
			unsigned int ui() const;

			//! ȡip��ַ��1���ֽ�
			unsigned char filed1() const;

			//! ȡip��ַ��2���ֽ�
			unsigned char field2() const;

			//! ȡip��ַ��3���ֽ�
			unsigned char field3() const;

			//! ȡip��ַ��4���ֽ�
			unsigned char field4() const;

		private:
			kc_ip4_imp *m_imp;
		};

		//! �����ַ������ip�Ͷ˿�
		class KCNET_API net_address
		{
		public:

			//! Ĭ�Ϲ���
			net_address();

			//! ͨ��ip�Ͷ˿ڹ���
			net_address(const char *ip, int port);

			//! ��������
			net_address(const net_address &addr);

			//! �Ƿ�����Ч�ĵ�ַ
			bool valid();

			//! ������ֵ
			net_address& operator=(const net_address &addr);

			//! �Ƿ���ͬ
			bool operator==(const net_address &addr);

			//! ��ȡip��ַ
			kc_ip4 get_ip() const;

			//! ��ȡ�ַ�����ʽ��ip��ַ
			std::string get_ip_str() const;

			//! ��ȡ�˿ں�
			short	get_port() const;

			//! ����ip
			void	set_ip(const kc_ip4 &ip);

			//! ���ö˿�
			void	set_port(short port);

		protected:
			kc_ip4 m_ip;
			short	m_port;

		};

	}
}
