/*!
 * \file kc_time.h
 *
 * \author xwt
 * \date 十二月 2018
 *
 * \brief 时间类
 */
#pragma once

#include <string>

#include "kcnetlib/core/kc_dll_export.h"

namespace kc
{
	namespace core
	{
		//! 时间
		class KCNET_API kctime
		{
		public:
			//! 默认构造
			kctime();

			//! 根据秒值构造
			kctime(double seconds);

			//! 析构
			virtual ~kctime();

			//! 获取当前时间
			static kctime now();

			//! 延时
			static void sleep(const kctime &time);

			//! @brief 延时
			//! @time_ms 时间值，单位ms
			static void sleep(const unsigned int time_ms);

			//! 是否有效
			bool valid() const;

			//! 获取浮点数格式的时间值
			double get_time() const;

			//! 获取秒和微妙
			void get_time(int &sec, int &usec) const;

			//! 设置
			void set_time(double seconds);

			//! 设置
			void set_time(int sec, int usec);

			//! 拷贝赋值
			void operator=(const kctime &time);

			//! 是否相等
			bool operator==(const kctime &time);

			//! 是否不相等
			bool operator!=(const kctime &time);

			//! 计算差值，返回的是秒值
			double operator-(const kctime &time);

			//! 打印出字符串，格式 YYYY-MM-DD HH:mm::SS.UUUUUU
			std::string print() const;

		private:
			int m_sec;
			int m_usec;
		};

		//! 延时
		class delay
		{
		public:
			//! 延时，指定延时时间，单位s
			delay(double delay_sec = 1.0) :m_delay_sec(delay_sec) {}
			
			//! 重新开始记时
			void reset() { m_last_reset = kctime::now(); }

			//! 延时时间到
			bool time_up() { return kctime::now() - m_last_reset >= m_delay_sec; }

		protected:
			kctime	m_last_reset;
			double	m_delay_sec;
		};
	}
}