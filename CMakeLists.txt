# Copyright (c) 2013 Artem Andreenko <mio@volmy.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

cmake_minimum_required(VERSION 2.8.8)

project(volmy-desktop)
set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(TARGET Volmy)
set(SOURCES src/main.cpp src/mainwindow.cpp)
file(GLOB_RECURSE SRC src)

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

