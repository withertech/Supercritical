cmake_minimum_required(VERSION 3.12)

project(supercritical)
message(STATUS "===================")
message(STATUS "CONFIGURING critlib")
message(STATUS "===================")
# Setup the make environment. #
################################
# Activate very verbose makefiles.
set(CMAKE_VERBOSE_MAKEFILE ON)
# Allow else() and endif() constructs (with empty parentheses)
set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON) #To use with clang-tidy, not supported w/ MSVC generator.

# Setup the cmake directory containing numerous cmake scripts and macros.
set(CMAKE_MODULE_PATH "${supercritical_SOURCE_DIR}/cmake")
set(CMAKE_INSTALL_PREFIX "/usr")
set(OUTPUT_LIB
  "${CMAKE_SOURCE_DIR}/lib/lib/core/io.bc"
  "${CMAKE_SOURCE_DIR}/lib/lib/core/math.bc"
)
add_custom_command(
OUTPUT ${OUTPUT_LIB}
COMMAND clang-10 -O4 -emit-llvm ${CMAKE_SOURCE_DIR}/lib/lib/core/io.cpp -c -o ${CMAKE_SOURCE_DIR}/lib/lib/core/io.bc -pthread
COMMAND clang-10 -O4 -emit-llvm ${CMAKE_SOURCE_DIR}/lib/lib/core/math.cpp -c -o ${CMAKE_SOURCE_DIR}/lib/lib/core/math.bc -pthread
)
add_custom_target(critlib ALL DEPENDS ${OUTPUT_LIB})
install(DIRECTORY ./include DESTINATION lib/supercritical FILES_MATCHING PATTERN "*.crit")
install(DIRECTORY ./lib DESTINATION lib/supercritical FILES_MATCHING PATTERN "*.bc")
