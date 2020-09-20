find_package(glog REQUIRED)
find_package(json REQUIRED)

include_directories(${CMAKE_CURRENT_BINARY_DIR})

configure_file(config.hpp.in general_config.hpp @ONLY)


add_library(InstrumentationTools
        PerformanceTimer.cpp PerformanceTimer.hpp
        InstrumentationTimer.cpp InstrumentationTimer.hpp
        Instrumentor.cpp Instrumentor.hpp
        )
target_include_directories(InstrumentationTools PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(InstrumentationTools glog json)

if (BUILD_TEST)
    find_package(gtest REQUIRED)
    target_link_libraries(InstrumentationTools gtest)
    add_subdirectory(unit_tests)
endif()

