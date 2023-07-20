/*!
 * \file kc_buffer.h
 *
 * \author xwt
 * \date 十二月 2018
 *
 * \brief 数据缓冲区，可以将数据存入和提取
 */
#pragma once

#include "kcnetlib/core/kc_dll_export.h"

namespace kc
{
	namespace core
	{
#define MAX_BUF_SIZE (1024*1024)

		class kcbuffer_imp;

		//! 数据缓冲区
		class KCNET_API kcbuffer
		{
			kcbuffer(unsigned int max_size = MAX_BUF_SIZE);
			virtual ~kcbuffer();

		public:
			//! 存放数据
			virtual bool push_back(const void *buf, const unsigned int len);

			//! 提取数据
			virtual bool pop_head(void *buf, const unsigned int len);

			//! 当前数据长度
			unsigned int size() const;

		private:
			kcbuffer_imp *m_imp;
		};
	}
}