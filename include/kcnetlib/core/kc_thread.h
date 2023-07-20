/*!
 * \file kc_thread.h
 * \date 2017/09/14 13:34
 *
 * \author Tim Xu
 * Contact: xuweiting@zjkczn.com
 *
 * \brief ѭ���߳�
 *
*/

#pragma once

#include "kc_dll_export.h"
#include <functional>

namespace kc
{
	namespace core
	{
		class loop_thread_imp;


		//! ѭ���̣߳�ѭ������run����
		class KCNET_API loop_thread
		{
		public:
			loop_thread();
			virtual ~loop_thread();

			//! ʹ���߱�������run������run�����ᱻѭ������
			virtual void run() {}

			//! ������delay��ʾÿ��run֮�����ʱʱ�䣨ms��
			bool create(unsigned int delay=0);

			//! ���٣����߳�Ҫ�ȵ�����run��������������٣�������run�������
			void kill();

			//! ���� ����ȷ���̱߳����٣���ֹ��run������á�
			void kill_to_die();

			//! ��ͣ����ͣ�󽫲��ٻص�run���������߳���Ȼ����
			void suspend();

			//! ��ͣ������ȷ���̱߳����𣬽�ֹ��run������ã���ͣ�󽫲��ٻص�run���������߳���Ȼ����
			void suspend_to_pause();

			//! ����
			void resume();

			//! �Ƿ�����
			bool alive();

			//! �Ƿ��������У�δ���п����Ǳ���ͣ��Ҳ�����Ǳ����٣�
			bool running();

		private:
			loop_thread_imp *m_imp;
		};


		//! ѭ��������ָ��һ������������һ��ѭ���߳�ѭ������
		// ����������ȫ�ֺ�����Ҳ���������Ա��������
		/*
		class TEST
		{
		public:
			TEST()
			{
				m_lf.create_function(std::bind(&TEST::test_func, this), 1000); // ����ʱ��1000ms
			}
			void test_func()
			{
				printf("test_func \n");
			}

		protected:
			kc::core::loop_function m_lf;
		};
		*/
		class loop_function : public loop_thread
		{
		public:
			loop_function() :loop_thread() {}

			//! ָ�������������߳�
			bool create_function(std::function<void()> func, unsigned int delay = 0) 
			{
				m_func = func;
				return loop_thread::create(delay);
			}

			virtual void run() 
			{
				if(m_func)
					m_func();
			}

			std::function<void()> m_func;
		};

	}
}