if (NOT TARGET json)
add_library(json INTERFACE)
target_include_directories(json INTERFACE "${THIRDPARTY_DIR}/json/single_include/nlohmann")
endif()
