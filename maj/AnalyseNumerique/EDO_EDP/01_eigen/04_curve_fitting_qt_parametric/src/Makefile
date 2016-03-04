
#base directory of Qt files
QT_DIR_BASE=/usr/include/qt4

#specific include directories for Qt
QT_INCLUDE=-I${QT_DIR_BASE} -I${QT_DIR_BASE}/QtCore -I${QT_DIR_BASE}/QtGui

#specific include directory for Eigen
EIGEN_INCLUDE=-I../../eigen/include/eigen3/

#specific lib dependecies for Qt
QT_DEPENDENCIES=-lQtCore -lQtGui

#Qt MOC
MOC=moc-qt4

#Qt Uic
UIC=uic-qt4


#Compilation flags
CXXFLAGS= -g -Wall -Wextra -std=c++11 -Wno-deprecated-declarations ${QT_INCLUDE} ${EIGEN_INCLUDE}
#Linking flags
LDFLAGS=-pthread ${QT_DEPENDENCIES}
#Compiler
CXX=g++


main: main.o window.o moc_window.o render_area.o moc_render_area.o vec2.o point_set.o polynomial.o fitting.o vec2_parameterized.o
	${CXX} $^ -o $@ ${LDFLAGS}

main.o: main.cpp window.hpp

point_set.o: point_set.cpp point_set.hpp vec2_parameterized.hpp vec2.hpp
polynomial.o: polynomial.cpp polynomial.hpp vec2.hpp
vec2.o: vec2.cpp vec2.hpp
vec2_parameterized.o: vec2_parameterized.cpp vec2_parameterized.hpp vec2.hpp

window.o: window.cpp window.hpp ui_mainwindow.h render_area.hpp
moc_window.o: moc_window.cpp window.hpp
moc_window.cpp: window.hpp
	${MOC} $< -o $@ ${QT_INCLUDE}

render_area.o: render_area.cpp render_area.hpp fitting.hpp polynomial.hpp point_set.hpp vec2.hpp vec2_parameterized.hpp
render_area.o: moc_render_area.cpp render_area.hpp
moc_render_area.cpp: render_area.hpp
	${MOC} $< -o $@ ${QT_INCLUDE}


ui_mainwindow.h: mainwindow.ui
	${UIC} $< -o $@

clean:
	rm -f *~ *.o moc_* ui_* main
