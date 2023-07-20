#pragma once
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/core/kc_time.h"
#include "kcnetlib/core/kc_ip.h"
#include <string>

namespace kc
{
	namespace serialization
	{
		//! ���л�����������
		enum datatype
		{
			dt_null=0,
			dt_bool,
			dt_int,
			dt_uint,
			dt_float,
			dt_double,
			dt_string,
			dt_time,
			dt_net_address,
			dt_memory
		};

		//! ������������
		class KCNET_API binary_stream
		{
		public:
			//! ���캯��
			binary_stream();

			//! ��������
			binary_stream(const binary_stream &bin_stream);

			//! ��������
			virtual ~binary_stream();

			//! ������ֵ
			void operator=(const binary_stream &bin_stream);

			//! ���ļ�����
			bool load(const char * file);

			//! ���ֽ�������
			bool load(const unsigned char * buf, unsigned int len);

			//! �������ļ�
			bool store(const char * file);

			//! ��ȡ�ڴ�����
			const unsigned char *buf() const;

			//! ��ȡ���ݳ���
			unsigned int len() const;
			
			//! �Ӵ浵�ж�ȡ����
			bool operator >> (bool &value);
			//! �Ӵ浵�ж�ȡ����
			bool operator >> (int &value);
			//! �Ӵ浵�ж�ȡ����
			bool operator >> (unsigned int &value);
			//! �Ӵ浵�ж�ȡ����
			bool operator >> (float &value);
			//! �Ӵ浵�ж�ȡ����
			bool operator >> (double &value);
			//! �Ӵ浵�ж�ȡ����
			bool operator >> (std::string &value);
			//! �Ӵ浵�ж�ȡ����
			bool operator >> (kc::core::kctime &value);
			//! �Ӵ浵�ж�ȡ����
			bool operator >> (kc::core::net_address &value);

			//! ������д��浵
			void operator<<(bool value);
			//! ������д��浵
			void operator<<(int value);
			//! ������д��浵
			void operator<<(unsigned int value);
			//! ������д��浵
			void operator<<(float value);
			//! ������д��浵
			void operator<<(double value);
			//! ������д��浵
			void operator<<(const char * value);
			//! ������д��浵
			void operator<<(std::string value);
			//! ������д��浵
			void operator<<(kc::core::kctime value);
			//! ������д��浵
			void operator<<(kc::core::net_address value);

			//! �Ӵ浵�ж�ȡ����
			bool read(void *buf, unsigned int len);
			//! ������д��浵
			void write(const void *buf, unsigned int len);

			//! �Ƿ���Զ�ȡ
			bool can_read();

			//! �۲���һ���������ͣ����۲죬�����ģ�
			datatype watch_next_dt();

			//! �۲���һ�����ݵĳ��ȣ����۲죬�����ģ�
			unsigned int watch_next_len();

			//! �ƶ���ָ��λ��
			void seek(unsigned int pos);

		private:
			void clear();

			inline bool read_dt(datatype dt);
			inline void write_dt(datatype dt);

			inline bool read_variable(datatype dt, void *buf, unsigned int len);
			inline void write_variable(datatype dt, const void *buf, unsigned int len);

			inline bool read_buf( void *buf, unsigned int len);
			inline void write_buf( const void *buf, unsigned int len);

		protected:
			unsigned char *m_buf;
			unsigned int		m_buf_len;
			unsigned int		m_data_len;
			unsigned int		m_data_pos;
		};


		class KCNET_API json_stream
		{
		public:

			//! ���캯��
			json_stream();

			//! ��������
			virtual ~json_stream();

			//! ������ֵ
			void operator=(const json_stream &bs);

			//! ���ļ�����
			bool load(const char * file);

			//! ���ַ�������
			bool load(const std::string &str);

			//! �ƶ���ָ��λ��
			void seek(unsigned int pos);

			//! �������ļ�
			bool store(const char * file);

			//! ���浽�ַ���
			std::string store();

			//! �Ӵ浵�ж�ȡ����
			void operator >> (bool &value);
			//! �Ӵ浵�ж�ȡ����
			void operator >> (int &value);
			//! �Ӵ浵�ж�ȡ����
			void operator >> (unsigned int &value);
			//! �Ӵ浵�ж�ȡ����
			void operator >> (float &value);
			//! �Ӵ浵�ж�ȡ����
			void operator >> (double &value);
			//! �Ӵ浵�ж�ȡ����
			void operator >> (std::string &value);
			//! �Ӵ浵�ж�ȡ����
			void operator >> (kc::core::kctime &value);

			//! ������д��浵
			void operator<<(bool value);
			//! ������д��浵
			void operator<<(int value);
			//! ������д��浵
			void operator<<(unsigned int value);
			//! ������д��浵
			void operator<<(float value);
			//! ������д��浵
			void operator<<(double value);
			//! ������д��浵
			void operator<<(const char * value);
			//! ������д��浵
			void operator<<(std::string value);
			//! ������д��浵
			void operator<<(kc::core::kctime value);

		protected:
			void clear();
		protected:
			void *	m_json_obj;
			int		m_pos;
		};

	}
}