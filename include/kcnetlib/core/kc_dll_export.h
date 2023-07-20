/*!
 * \file kc_dll_export.h
 *
 * \author xwt
 * \date ʮ���� 2018
 *
 * \brief windows dll��������
 */
#pragma once

// windows�����ඨ��
#ifdef _WINDOWS
#ifdef KCNET_EXPORTS
#define KCNET_API __declspec(dllexport)
#else
#define KCNET_API __declspec(dllimport)
#endif
#else
#define KCNET_API
#endif
