# Install script for directory: /fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen/src/SparseLU" TYPE FILE FILES
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_panel_bmod.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_SupernodalMatrix.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_copy_to_ucol.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_Utils.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_pivotL.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_relax_snode.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_gemm_kernel.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLUImpl.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_pruneL.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_Structs.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_heap_relax_snode.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_Memory.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_kernel_bmod.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_column_dfs.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_panel_dfs.h"
    "/fs02/share/users/alperen.aydin/home/TP_math/maj/AnalyseNumerique/EDO_EDP/01_eigen/eigen_src/eigen/Eigen/src/SparseLU/SparseLU_column_bmod.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

