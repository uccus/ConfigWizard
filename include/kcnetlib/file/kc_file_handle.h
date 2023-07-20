#pragma once
#include "kcnetlib/core/kc_dll_export.h"

#include <string>

namespace kc
{
	//! �ļ�����
	namespace file
	{
		//! �ļ������ӿ�
		namespace file_handle
		{
			//! ��ȡ��ǰ����Ŀ¼
			std::string KCNET_API current_dir();

			//! ��ȡ�ļ���/Ŀ¼������ C:\foo.txt  �����ļ�����foo.txt		��C:\foo\	����Ŀ¼����foo
			std::string KCNET_API base_name_of_path(const std::string &path);

			//! ��ȡĿ¼ �� C:\foo.txt  ����Ŀ¼��C:\     �� C:\foo\	����Ŀ¼��C:\	
			std::string KCNET_API dir_name(const std::string &path);

			//! @brief �ָ�·������ C:\foo.txt ���� C:\��foo ��txt
			//! @param dir��Ŀ¼
			//! @param file_base_name���ļ�����������׺
			//! @param ext���ļ���׺
			void KCNET_API split_path(const std::string &path, std::string &dir, std::string &file_base_name, std::string &ext);

			//! �ļ��Ƿ����
			bool KCNET_API file_exist(const std::string &file);

			//! ��ȡ�ļ���С
			unsigned int KCNET_API file_size(const std::string &file);

			//! ���ļ���ȡ����ȡ�ַ���
			std::string KCNET_API read_string_from_file(const std::string &file);

			//! @brief ���ַ���д���ļ����ļ������ڻ��½���
			//! @param append: �����Ƿ��ַ���׷�ӵ��ļ�ĩβ
			bool KCNET_API write_string_to_file(const std::string &file, const std::string &content, bool append = false);



			//! @brief �����ļ�
			//! @param over_write_if_exist���ļ������Ƿ񸲸�
			bool KCNET_API create_file(const std::string &file, bool over_write_if_exist = false);

			//! ɾ���ļ�
			bool KCNET_API delete_file(const std::string &file);

			//! ɾ��Ŀ¼�������ļ�
			bool KCNET_API delete_files_in_dir(const std::string &dir);

			//! ����Ŀ¼
			bool KCNET_API create_dir(const std::string &dir);

			//! @brief ɾ��Ŀ¼
			//! @param delete_file_in_dir���Ƿ�ͬʱɾ��Ŀ¼���ļ�
			bool KCNET_API delete_dir(const std::string &dir, bool delete_file_in_dir = false);
		}
	}
}