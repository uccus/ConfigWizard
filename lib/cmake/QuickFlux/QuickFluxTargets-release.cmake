#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "QuickFlux::quickflux" for configuration "Release"
set_property(TARGET QuickFlux::quickflux APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(QuickFlux::quickflux PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/quickflux.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS QuickFlux::quickflux )
list(APPEND _IMPORT_CHECK_FILES_FOR_QuickFlux::quickflux "${_IMPORT_PREFIX}/lib/quickflux.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
