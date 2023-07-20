/*!
 * \file kc_time.h
 *
 * \author xwt
 * \date ʮ���� 2018
 *
 * \brief ʱ����
 */
#pragma once

#include <string>

#include "kcnetlib/core/kc_dll_export.h"

namespace kc
{
	namespace core
	{
		//! ʱ��
		class KCNET_API kctime
		{
		public:
			//! Ĭ�Ϲ���
			kctime();

			//! ������ֵ����
			kctime(double seconds);

			//! ����
			virtual ~kctime();

			//! ��ȡ��ǰʱ��
			static kctime now();

			//! ��ʱ
			static void sleep(const kctime &time);

			//! @brief ��ʱ
			//! @time_ms ʱ��ֵ����λms
			static void sleep(const unsigned int time_ms);

			//! �Ƿ���Ч
			bool valid() const;

			//! ��ȡ��������ʽ��ʱ��ֵ
			double get_time() const;

			//! ��ȡ���΢��
			void get_time(int &sec, int &usec) const;

			//! ����
			void set_time(double seconds);

			//! ����
			void set_time(int sec, int usec);

			//! ������ֵ
			void operator=(const kctime &time);

			//! �Ƿ����
			bool operator==(const kctime &time);

			//! �Ƿ����
			bool operator!=(const kctime &time);

			//! �����ֵ�����ص�����ֵ
			double operator-(const kctime &time);

			//! ��ӡ���ַ�������ʽ YYYY-MM-DD HH:mm::SS.UUUUUU
			std::string print() const;

		private:
			int m_sec;
			int m_usec;
		};

		//! ��ʱ
		class delay
		{
		public:
			//! ��ʱ��ָ����ʱʱ�䣬��λs
			delay(double delay_sec = 1.0) :m_delay_sec(delay_sec) {}
			
			//! ���¿�ʼ��ʱ
			void reset() { m_last_reset = kctime::now(); }

			//! ��ʱʱ�䵽
			bool time_up() { return kctime::now() - m_last_reset >= m_delay_sec; }

		protected:
			kctime	m_last_reset;
			double	m_delay_sec;
		};
	}
}