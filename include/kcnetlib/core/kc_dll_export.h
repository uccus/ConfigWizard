/*!
 * \file kc_dll_export.h
 *
 * \author xwt
 * \date 十二月 2018
 *
 * \brief windows dll导出定义
 */
#pragma once

// windows导出类定义
#ifdef _WINDOWS
#ifdef KCNET_EXPORTS
#define KCNET_API __declspec(dllexport)
#else
#define KCNET_API __declspec(dllimport)
#endif
#else
#define KCNET_API
#endif
