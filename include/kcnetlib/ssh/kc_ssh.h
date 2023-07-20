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

			// 连接
			bool connect(const std::string &server_ip, const std::string &user, const std::string &psw, const int port = 22);

			// 只连接ssh
			bool connect_ssh(const std::string &server_ip, const std::string &user, const std::string &psw, const int port = 22);

			// 只连接sftp
			bool connect_sftp(const std::string &server_ip, const std::string &user, const std::string &psw, const int port = 22);

			// 断开连接
			void disconnect();

			// 连接状态
			bool is_connected();

			// 发送ssh命令
			bool shell_command(const std::string &command);

			// 下载文件到服务器
			bool download_file(const std::string &local_file_path, const std::string &server_file_path);

			// 从服务器上载文件
			bool upload_file(const std::string &local_file_path, const std::string &server_file_path);

			// 断线回调接口
			virtual void on_disconnect() {};

			virtual void receiveCallback(const std::string recv) {};

		protected:
			kc_ssh_imp * m_ssh_imp;
		};
	}
}

