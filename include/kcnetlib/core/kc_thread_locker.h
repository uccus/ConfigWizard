/*!
 * \file kc_thread_locker.h
 * \date 2017/09/14 13:55
 *
 * \author Tim Xu
 * Contact: xuweiting@zjkczn.com
 *
 * \brief 线程锁
 *
 * \note
*/

#pragma once

#include "kc_dll_export.h"

namespace kc
{
	namespace core
	{
		class locker_imp;

		//! 线程锁
		class KCNET_API locker
		{
		public:

			//! 构造函数
			locker();

			//! 析构函数
			virtual ~locker();

			//! 上锁
			void lock();

			//! 解锁
			void unlock();

		private:
			locker_imp *m_imp;
		};

		//! 线程锁包装类，为方便使用, 构造函数上锁，析构函数解锁
		class locker_wrapper
		{
		public:
			locker_wrapper(locker *lk)
			{
				m_locker = lk;
				m_locker->lock();
			}
			virtual ~locker_wrapper()
			{
				m_locker->unlock();
			}
		private:
			locker *m_locker;
		};
	}
}

