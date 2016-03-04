
INCLUDE = -I../../eigen/include/eigen3/
CXXFLAGS = -g -Wall -Wextra -O2 -std=c++11 -Wno-deprecated-declarations ${INCLUDE}
CXX=g++

#executable name
project=main

all: ${project}

#linking
${project} : main.o
	${CXX} $^ -o ${project}

#compile
main.o: main.cpp

clean:
	rm -f *~ *.o main