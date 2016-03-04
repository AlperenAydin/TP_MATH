cmake_minimum_required(VERSION 2.6)

project(main)

set(CMAKE_BUILD_TYPE debug)
set(CMAKE_CXX_FLAGS "-Wall -Wextra -O2 -std=c++11 -Wno-deprecated-declarations")

file(
	GLOB_RECURSE
	source_files
	src/*.[ch]pp
)

include_directories("../eigen/include/eigen3/")

add_executable(
	main
	${source_files}
)

