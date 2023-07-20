#pragma once
#include "kcnetlib/core/kc_dll_export.h"
#include "kcnetlib/serialization/kc_archive.h"
#include <set>
#include <map>

namespace kc
{
	//! ���л�
	namespace serialization
	{
		//! ���л��Ķ���֧�����л�������Դ�object��������
		class KCNET_API object
		{
		public:
			//! ���캯��
			object();

			//! ��������
			virtual ~object();

			//! ����������أ����ض�������
			virtual const char * get_object_name() const = 0;

			//! �����жϣ��жϵ�ǰ�����Ƿ���ָ������
			bool is_kind_of(const char *object_name) const;

			//! ���䣬ͨ�������ƴ������
			static object *create_object(const char *class_name);

			//! ���л�
			virtual void serialize(binary_archive &ar);

			//! ���л�
			virtual void serialize(json_archive &ar);

		};

		//! xml��ʽ��object
		class KCNET_API xml_object:public object
		{
		public:
			//! ���캯��
			xml_object(xml_object * ptr_parent =NULL);
			
			//! ��������
			virtual ~xml_object();

			//! ��ȡ������
			xml_object *get_parent() { return m_parent; }

			//! ���л�
			virtual void serialize(xml_archive &ar);

		protected:
			// ���ݲ���
			void		set_parent(xml_object * ptr_parent) { m_parent = ptr_parent; }

			void		set_property(const std::string &str_key, const std::string &str_value);
			std::string get_property(const std::string &str_key);

			void		set_property_bool(const string key, const bool value);
			bool		get_property_bool(const string key);

			void		set_property_int(const string key, const int value);
			int			get_property_int(const string key);

			double		get_property_double(const string key);
			void		set_property_double(const string key, const double value);

			void		add_child(const string type, xml_object *pChild);
			int			get_children_count(const string type);
			xml_object *get_child(const string  type, int index);
			void		remove_child(const string type,xml_object * ptr_child);

		protected:
			// �Ӷ���������Ӧ�Ӷ���ʵ���ļ���
			std::map<std::string, std::vector<xml_object *> *>	m_map_children; 
			std::map<std::string, std::string>				m_propertys;	// ����
			xml_object *									m_parent;		// ������
			friend class xml_archive;
		};
		

		//! ����ע��
		typedef kc::serialization::object* (*create_object_ptr)(void);
		class KCNET_API kc_object_register
		{
		public:
			kc_object_register(const char * object_name, create_object_ptr method);
		};

	}
}



//////////////////////////////////////////////////////////////////////////
//! @brief ����궨��

/**
ʹ�þ�����
h�ļ���
class test_object : public kc::serialization::object
{
	DECLARE_KCOBJECT(test_object)
	test_object();
};

cpp�ļ���
IMPLEMENT_KCOBJECT(test_object)
test_object::test_object()
{
....
}
*/

//! ������ ������h�ļ�
#define DECLARE_KCOBJECT(class_name) \
public:\
static kc::serialization::object *create_class()	{ return new class_name(); } \
virtual const char * get_object_name()  const { return  #class_name; }

//! ʵ�֣�������cpp�ļ�
#define IMPLEMENT_KCOBJECT(class_name) \
static const kc::serialization::kc_object_register obj_reg_##class_name(#class_name, class_name::create_class );


// xml_object �������Զ���
#define KC_XMLOBJ_PROPERTY(name) std::string get_##name(){ return get_property(#name); }		\
void set_##name(const std::string & value){ set_property(#name, value); }



#define KC_XMLOBJ_CHILDREN(name,class_name) int get_count_##name(){return get_children_count(#name);}\
class_name * get_##class_name(const int index){return (class_name *)get_child(#name,index);}\
class_name * add_##class_name() {class_name * new_class = new class_name(); add_child(#name,new_class); return new_class;}\
void remove_##class_name(class_name * ptr_child) {remove_child(#name,ptr_child);}
