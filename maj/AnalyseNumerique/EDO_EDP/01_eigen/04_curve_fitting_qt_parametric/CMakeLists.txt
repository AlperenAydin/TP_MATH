cmake_minimum_required(VERSION 2.6)

project(main)

set(CMAKE_BUILD_TYPE debug)
set(CMAKE_CXX_FLAGS "-Wall -Wextra -O2 -std=c++11 -Wno-deprecated-declarations")


FIND_PACKAGE(Qt4 REQUIRED)
INCLUDE(${QT_USE_FILE})

file(
	GLOB
	source_files
	src/*.[ch]pp
)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories("../eigen/include/eigen3")

QT4_WRAP_UI(pgm_UI_H src/mainwindow.ui)
QT4_WRAP_CPP(source_files_moc src/window.hpp src/render_area.hpp)

add_executable(
	pgm
	${source_files}
	${pgm_UI_H}
	${source_files_moc}
)


TARGET_LINK_LIBRARIES(pgm ${QT_LIBRARIES})


