#pragma once

#include <vector>
#include <map>
#include "kcnetlib/serialization/kc_object.h"

namespace kc
{
	namespace serialization
	{
		//! 对象vector（存放的是对象指针）
		template<class objT>
		class object_ptr_vector : public std::vector<objT *>
		{
		public:
			//! 构造函数
			object_ptr_vector() {}

			//! 析构函数
			virtual ~object_ptr_vector() {}

			//! 析构所有对象
			void destroy()
			{
				for (auto it : *this)
				{
					delete (objT *)(it);
				}
				this->clear();
			}

			//! 序列化
			template<class archive_type>
			void serialize(archive_type &ar)
			{
				if (ar.is_load())
				{
					unsigned int size = 0;
					ar >> size;
					for (unsigned int i = 0; i < size; i++)
					{
						objT *obj = (objT *)ar.read_object();
						this->push_back(obj);
					}
				}
				else
				{
					ar << (unsigned int)this->size();
					for (auto it : *this)
					{
						ar.write_object(it);
					}
				}
			}

		};

		//! 对象map（存放的是对象指针）
		template<class keyT, class objT>
		class object_ptr_map : public std::map<keyT,objT*>
		{
		public:
			//! 构造函数
			object_ptr_map() {}

			//! 析构函数
			virtual ~object_ptr_map() {}

			//! 析构所有对象
			void destroy()
			{
				for (auto it : *this)
				{
					delete it.second;
				}
				this->clear();
			}

			//! 序列化
			template<class archive_type>
			void serialize(archive_type &ar)
			{
				if (ar.is_load())
				{
					unsigned int size = 0;
					ar >> size;
					for (unsigned int i = 0; i < size; i++)
					{
						keyT key;
						ar >> key;
						objT *obj = (objT *)ar.read_object();
						this->insert(std::make_pair(key, obj));
					}
				}
				else
				{
					ar << (unsigned int)this->size();
					for (auto it : *this)
					{
						ar << it.first;
						ar.write_object(it.second);
					}
				}
			}
		};
		
	}
}
