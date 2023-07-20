/*!
 * \file kc_thread.h
 * \date 2017/09/14 13:34
 *
 * \author Tim Xu
 * Contact: xuweiting@zjkczn.com
 *
 * \brief 循环线程
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


		//! 循环线程，循环调用run函数
		class KCNET_API loop_thread
		{
		public:
			loop_thread();
			virtual ~loop_thread();

			//! 使用者必须重载run函数，run函数会被循环调用
			virtual void run() {}

			//! 创建，delay表示每次run之后的延时时间（ms）
			bool create(unsigned int delay=0);

			//! 销毁，但线程要等到本次run运行完后真正销毁，可以在run里面调用
			void kill();

			//! 销毁 阻塞确认线程被销毁，禁止在run里面调用。
			void kill_to_die();

			//! 暂停，暂停后将不再回调run函数，但线程仍然存在
			void suspend();

			//! 暂停，阻塞确认线程被挂起，禁止在run里面调用，暂停后将不再回调run函数，但线程仍然存在
			void suspend_to_pause();

			//! 继续
			void resume();

			//! 是否被销毁
			bool alive();

			//! 是否正在运行（未运行可能是被暂停，也可能是被销毁）
			bool running();

		private:
			loop_thread_imp *m_imp;
		};


		//! 循环函数，指定一个函数，创建一个循环线程循环调用
		// 函数可以是全局函数，也可以是类成员函数，如
		/*
		class TEST
		{
		public:
			TEST()
			{
				m_lf.create_function(std::bind(&TEST::test_func, this), 1000); // 周期时间1000ms
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

			//! 指定函数，创建线程
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