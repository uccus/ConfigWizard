#pragma once

#include <string>
#include "kcnetlib/core/kc_dll_export.h"


namespace kc
{
	namespace file
	{
		// �ڴ��ļ���Ϊ������̶߳�д�ļ����ݲ�ͬ��������
		// �ļ��������ڴ��У��ļ����ݱ任�Ὣ���ݸ��µ�Ӳ�̣����µ�Ӳ��ʱ��ȡ���ڲ���ϵͳ��
		class KCNET_API memory_file
		{
		public:
			static std::string read(const std::string &file_path);
			static void write(const std::string &file_path, const std::string &file_data);
		};

		// �첽д�ļ���Ϊ���Ƶ��д�ļ�����ϵͳIO���ߵ���д�ļ���ʱ������
		// ͨ�������߳̽�����д��ָ���ļ������µ�Ӳ��ʱ��ȡ���ڲ���ϵͳ��
		class async_write_file_imp;
		class KCNET_API async_write_file
		{
		public:
			async_write_file();
			virtual ~async_write_file();
			bool open(const std::string &file_path);
			bool close();
			bool append(const std::string &file_data);

		private:
			async_write_file_imp *m_imp;
		};
	}
}