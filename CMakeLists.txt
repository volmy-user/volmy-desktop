cmake_minimum_required(VERSION 2.8.8)

project(volmy-desktop)

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(TARGET Volmy)
set(SOURCES src/main.cpp)

set(QTDIR /opt/qt5)
set(Qt5Widgets_DIR  ${QTDIR}/lib/cmake/Qt5Widgets)
find_package(Qt5Widgets REQUIRED)

add_subdirectory(core)

include_directories(core/include)

add_executable(${TARGET} ${SOURCES})

target_link_libraries(${TARGET} volmycore)
qt5_use_modules(${TARGET} Widgets)
