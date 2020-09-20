find_package(gtest REQUIRED)
include(GoogleTest)

add_executable(InstrumentationTools_test
        InstrumentorTest.cpp InstrumentorTest.hpp)
target_link_libraries(InstrumentationTools_test gtest InstrumentationTools)
gtest_discover_tests(InstrumentationTools_test)

if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/data" AND IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/data")
add_custom_command(TARGET Tools_test POST_BUILD
  COMMAND "${CMAKE_COMMAND}" -E copy_directory
     "${CMAKE_CURRENT_SOURCE_DIR}/data"
     "${CMAKE_CURRENT_BINARY_DIR}/data"
  COMMENT "Copying test data output directory")
endif()

