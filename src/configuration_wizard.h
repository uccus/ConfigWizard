﻿#pragma once

#ifdef _WINDOWS
#ifdef CONFIGURATIN_WIZARD_EXPORTS
#define CONFIGURATION_WIZARD_API __declspec(dllexport)
#else
#define CONFIGURATION_WIZARD_API __declspec(dllimport)
#endif
#else
#define CONFIGURATION_WIZARD_API
#endif

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus
       
    int CONFIGURATION_WIZARD_API showConfigurationWizard();

#ifdef __cplusplus
}
#endif // __cplusplus