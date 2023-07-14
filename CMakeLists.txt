cmake_minimum_required(VERSION 3.12)

set(PROJECT_NAME ConfigurationWizard)
project(${PROJECT_NAME} CXX)

set(OUTPUT_NAME ${PROJECT_NAME})
if (CMAKE_BUILD_TYPE STREQUAL Debug)
    set(OUTPUT_NAME ${PROJECT_NAME}D)
endif()

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_definitions(-D_WINDOWS -DCONFIGURATIN_WIZARD_EXPORTS)
add_compile_options(/utf-8)

find_package(Qt5 COMPONENTS Quick Gui REQUIRED)

# set(QRC_SOURCE_FILES src/configuration_wizard.qrc)
set(QRC_SOURCE_FILES src-/configuration_wizard.qrc)
qt5_add_resources(QRC_FILES ${QRC_SOURCE_FILES})
# aux_source_directory(src SRC)
aux_source_directory(src- SRC)

add_library(${OUTPUT_NAME} SHARED ${SRC} ${QRC_FILES})

target_include_directories(${OUTPUT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_directories(${OUTPUT_NAME} PUBLIC lib)
target_link_libraries(${OUTPUT_NAME} PRIVATE Qt5::Gui Qt5::Quick quickfluxd)

#############################################
aux_source_directory(test TEST_SRC)
add_executable(wizard_test ${TEST_SRC})
# target_include_directories(wizard_test PUBLIC src)
target_include_directories(wizard_test PUBLIC src-)
target_link_directories(wizard_test PUBLIC lib)
target_link_libraries(wizard_test ${OUTPUT_NAME})