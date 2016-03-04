
INCLUDE = -I../../eigen/include/eigen3/
CXXFLAGS = -g -Wall -Wextra -O2 -std=c++11 -Wno-deprecated-declarations ${INCLUDE}
CXX=g++

#executable name
project=main

all: ${project}

#linking
${project} : main.o point_set.o polynomial.o vec2.o fitting.o
	${CXX} $^ -o ${project}

#compile
main.o: main.cpp
point_set.o: point_set.cpp point_set.hpp vec2.hpp
polynomial.o: polynomial.cpp polynomial.hpp
vec2.o: vec2.cpp vec2.hpp
fitting.o: fitting.cpp fitting.hpp point_set.hpp polynomial.hpp 

clean:
	rm -f *~ *.o main