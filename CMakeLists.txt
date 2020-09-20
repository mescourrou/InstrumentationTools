cmake_minimum_required(VERSION 3.10)
project(InstrumentationTools)

option(BUILD_TEST "Compile Unit Tests" ON)

set(SOURCES "")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(THIRDPARTY_DIR "${CMAKE_SOURCE_DIR}/thirdparty")

#Profiling
option(PROFILING "Enable the profiling macro creation" ON)

set(SOURCE_DIR "${CMAKE_SOURCE_DIR}/src")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(BUILD_INCLUDE_GIT_INFOS "Include branch and commit informations on the executable" ON)

if (BUILD_INCLUDE_GIT_INFOS)
# Get the current working branch
execute_process(
  COMMAND git rev-parse --abbrev-ref HEAD
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  OUTPUT_VARIABLE GIT_BRANCH
  OUTPUT_STRIP_TRAILING_WHITESPACE
)

# Get the latest abbreviated commit hash of the working branch
execute_process(
  COMMAND git log -1 --format=%h
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  OUTPUT_VARIABLE GIT_COMMIT_HASH
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
endif()

option(BUILD_USE_FILESYSTEM "Use the filesystem from c++17" ON)

mark_as_advanced(BUILD_USE_FILESYSTEM)

set(FILESYSTEM_LIB)
if(BUILD_USE_FILESYSTEM)
    set(FILESYSTEM_LIB stdc++fs)
endif()
if (BUILD_TEST)
    enable_testing()
endif()

include(documentation)
add_doc_target()

add_subdirectory(${SOURCE_DIR})

