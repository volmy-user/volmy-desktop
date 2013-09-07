cmake_minimum_required(VERSION 2.8.8)

project(volmy-desktop)
set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(TARGET Volmy)
set(SOURCES src/main.cpp src/mainwindow.cpp)

set(QTDIR /opt/qt5)
set(Qt5Core_DIR  ${QTDIR}/lib/cmake/Qt5Core)
find_package(Qt5Core REQUIRED)
set(Qt5Widgets_DIR  ${QTDIR}/lib/cmake/Qt5Widgets)
find_package(Qt5Widgets REQUIRED)
set(Qt5Quick_DIR  ${QTDIR}/lib/cmake/Qt5Quick)
find_package(Qt5Quick REQUIRED)

add_subdirectory(core)
include_directories(core/include)

qt5_add_resources(RESOURCES src/resources.qrc)

add_executable(${TARGET} ${SOURCES} ${RESOURCES})

target_link_libraries(${TARGET} volmycore)
qt5_use_modules(${TARGET} Core Widgets Quick)

