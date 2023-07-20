/*!
 * \file kc_event.h
 * \date 2017/09/27 16:11
 *
 * \author Tim Xu
 * Contact: xuweiting@zjkczn.com
 *
 * \brief 事件
 *
 * \note
*/

#pragma once

#include "kc_dll_export.h"

//! kcnetlib命名空间
namespace kc
{
	//! 基础模块
	namespace core
	{
		class kcevent_imp;

		//! @brief 事件类，线程安全，提供置位、复位和等待的方法 \n
		//! 事件类创建时处于未置位状态，可以在A线程中wait，在B线程中set后，A线程中的wait会返回
		class KCNET_API kcevent
		{
		public:
			kcevent();
			virtual ~kcevent();

			
			//! 置位
			void set();

			//! 复位
			void reset();

			//! 是否置位
			bool is_set() const;

			//!等待事件置位，timeout_time表示等待超时时间，单位ms，-1表示无限等待
			bool wait(long timeout_time=-1);

		private:
			kcevent_imp*		m_imp;

		};
	}
}