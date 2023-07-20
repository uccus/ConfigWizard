/*!
 * \file kc_buffer.h
 *
 * \author xwt
 * \date ʮ���� 2018
 *
 * \brief ���ݻ����������Խ����ݴ������ȡ
 */
#pragma once

#include "kcnetlib/core/kc_dll_export.h"

namespace kc
{
	namespace core
	{
#define MAX_BUF_SIZE (1024*1024)

		class kcbuffer_imp;

		//! ���ݻ�����
		class KCNET_API kcbuffer
		{
			kcbuffer(unsigned int max_size = MAX_BUF_SIZE);
			virtual ~kcbuffer();

		public:
			//! �������
			virtual bool push_back(const void *buf, const unsigned int len);

			//! ��ȡ����
			virtual bool pop_head(void *buf, const unsigned int len);

			//! ��ǰ���ݳ���
			unsigned int size() const;

		private:
			kcbuffer_imp *m_imp;
		};
	}
}