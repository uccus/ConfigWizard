/*!
 * \file kc_event.h
 * \date 2017/09/27 16:11
 *
 * \author Tim Xu
 * Contact: xuweiting@zjkczn.com
 *
 * \brief �¼�
 *
 * \note
*/

#pragma once

#include "kc_dll_export.h"

//! kcnetlib�����ռ�
namespace kc
{
	//! ����ģ��
	namespace core
	{
		class kcevent_imp;

		//! @brief �¼��࣬�̰߳�ȫ���ṩ��λ����λ�͵ȴ��ķ��� \n
		//! �¼��ഴ��ʱ����δ��λ״̬��������A�߳���wait����B�߳���set��A�߳��е�wait�᷵��
		class KCNET_API kcevent
		{
		public:
			kcevent();
			virtual ~kcevent();

			
			//! ��λ
			void set();

			//! ��λ
			void reset();

			//! �Ƿ���λ
			bool is_set() const;

			//!�ȴ��¼���λ��timeout_time��ʾ�ȴ���ʱʱ�䣬��λms��-1��ʾ���޵ȴ�
			bool wait(long timeout_time=-1);

		private:
			kcevent_imp*		m_imp;

		};
	}
}