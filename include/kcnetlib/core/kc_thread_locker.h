/*!
 * \file kc_thread_locker.h
 * \date 2017/09/14 13:55
 *
 * \author Tim Xu
 * Contact: xuweiting@zjkczn.com
 *
 * \brief �߳���
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

		//! �߳���
		class KCNET_API locker
		{
		public:

			//! ���캯��
			locker();

			//! ��������
			virtual ~locker();

			//! ����
			void lock();

			//! ����
			void unlock();

		private:
			locker_imp *m_imp;
		};

		//! �߳�����װ�࣬Ϊ����ʹ��, ���캯��������������������
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

