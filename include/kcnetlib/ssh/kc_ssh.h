#include "kcnetlib/core/kc_dll_export.h"
#include <string>

#pragma once


namespace kc
{
	namespace net
	{
		class kc_ssh_imp;
		class KCNET_API kc_ssh
		{
		public:
			kc_ssh();
			virtual ~kc_ssh();

			// ����
			bool connect(const std::string &server_ip, const std::string &user, const std::string &psw, const int port = 22);

			// ֻ����ssh
			bool connect_ssh(const std::string &server_ip, const std::string &user, const std::string &psw, const int port = 22);

			// ֻ����sftp
			bool connect_sftp(const std::string &server_ip, const std::string &user, const std::string &psw, const int port = 22);

			// �Ͽ�����
			void disconnect();

			// ����״̬
			bool is_connected();

			// ����ssh����
			bool shell_command(const std::string &command);

			// �����ļ���������
			bool download_file(const std::string &local_file_path, const std::string &server_file_path);

			// �ӷ����������ļ�
			bool upload_file(const std::string &local_file_path, const std::string &server_file_path);

			// ���߻ص��ӿ�
			virtual void on_disconnect() {};

			virtual void receiveCallback(const std::string recv) {};

		protected:
			kc_ssh_imp * m_ssh_imp;
		};
	}
}

