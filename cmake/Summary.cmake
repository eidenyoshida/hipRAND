function (print_configuration_summary)
    message(STATUS "")
    message(STATUS "******** Summary ********")
    message(STATUS "General:")
    message(STATUS "  System                     : ${CMAKE_SYSTEM_NAME}")
    message(STATUS "  HIP ROOT                   : ${HIP_ROOT_DIR}")
    message(STATUS "  C++ compiler               : ${CMAKE_CXX_COMPILER}")
    message(STATUS "  C++ compiler version       : ${CMAKE_CXX_COMPILER_VERSION}")
    string(STRIP "${CMAKE_CXX_FLAGS}" CMAKE_CXX_FLAGS_STRIP)
    message(STATUS "  CXX flags                  : ${CMAKE_CXX_FLAGS_STRIP}")
if (USE_CUDA)
    string(REPLACE ";" " " HIP_NVCC_FLAGS_STRIP "${HIP_NVCC_FLAGS}")
    string(STRIP "${HIP_NVCC_FLAGS_STRIP}" HIP_NVCC_FLAGS_STRIP)
    string(REPLACE ";" " " HIP_CPP_CONFIG_FLAGS_STRIP "${HIP_CPP_CONFIG_FLAGS}")
    string(STRIP "${HIP_CPP_CONFIG_FLAGS_STRIP}" HIP_CPP_CONFIG_FLAGS_STRIP)
    message(STATUS "  HIP flags                  : ${HIP_CPP_CONFIG_FLAGS_STRIP}")
    message(STATUS "  NVCC flags                 : ${HIP_NVCC_FLAGS_STRIP}")
endif()
    message(STATUS "  Build type                 : ${CMAKE_BUILD_TYPE}")
    message(STATUS "  Install prefix             : ${CMAKE_INSTALL_PREFIX}")
if(HIP_COMPILER STREQUAL "hcc" OR HIP_COMPILER STREQUAL "clang")
    message(STATUS "  Device targets             : ${AMDGPU_TARGETS}")
else()
    message(STATUS "  Device targets             : ${NVGPU_TARGETS}")
endif()
    message(STATUS "")
    message(STATUS "  BUILD_SHARED_LIBS          : ${BUILD_SHARED_LIBS}")
    message(STATUS "  BUILD_FORTRAN_WRAPPER      : ${BUILD_FORTRAN_WRAPPER}")
    message(STATUS "  BUILD_TEST                 : ${BUILD_TEST}")
    message(STATUS "  BUILD_BENCHMARK            : ${BUILD_BENCHMARK}")
    message(STATUS "  BUILD_ADDRESS_SANITIZER    : ${BUILD_ADDRESS_SANITIZER}")
    message(STATUS "  DEPENDENCIES_FORCE_DOWNLOAD: ${DEPENDENCIES_FORCE_DOWNLOAD}")
endfunction()
