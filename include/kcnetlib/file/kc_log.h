#pragma once

#include "kcnetlib/core/kc_dll_export.h"


namespace kc
{
	namespace file
	{
		class log_imp;


		//! ��־��
		class KCNET_API log
		{
		public:
			//! ���캯��
			log();

			//! ��������
			virtual ~log();

			//! @brief ��ʼ��
			//! @param file_name ��־��ʼ�ļ�����
			//! @param file_dir ��־�洢Ŀ¼��Ĭ�ϴ洢�����г���Ŀ¼�µ�logĿ¼��
			//! @param print ��־�Ƿ�ͬʱ��ӡ
			//! @param max_file_num ����ļ���������־�ļ��������ļ������򸲸�������ļ�
			//! @param max_file_size ÿ���ļ��Ĵ�С���������ļ���С�������´���һ��
			//! @param asyn_log �Ƿ�����첽��־
			void init(const char *file_name = "log", const char *file_dir = 0, bool print = false, int max_file_num = 16, int max_file_size = 10 * 1024 * 1024, bool asyn_log = false, bool zip=false);

			//! д��־
			void write(const char* format, ...);

			//! д��־
			void write_str(const char *str );
			
		private:
			log_imp *m_imp;
		};
	}
}