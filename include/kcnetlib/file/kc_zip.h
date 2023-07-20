#pragma once

#include "kcnetlib/core/kc_dll_export.h"

#include <string>
namespace kc
{
	namespace file
	{
		class kc_zip_imp;
		
		//! ѹ����ѹ��ģ��
		class KCNET_API kc_zip
		{
		public:

			//! ���캯��
			kc_zip(void);

			//! ��������
			~kc_zip(void);

			//! @brief ѹ���ļ�
			//! @param zip_file_path ѹ���ļ���zip��·��
			//! @param file_to_zip ����ѹ�����ļ�
			bool zip_file(const std::string&zip_file_path, const std::string &file_to_zip);

			//! @brief ��ѹ���ļ�
			//! @param zip_file_path ѹ���ļ���zip��·��
			//! @param export_path ��ѹ����Ŀ¼
			bool unzip_file(const std::string&zip_file_path, const std::string & export_path);

		protected:
			kc_zip_imp * m_zip_imp;
		};
	}
}