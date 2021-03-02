cmake_minimum_required(VERSION 3.10)

# set the project name
project(flatbuffer_wrapper)

set(FLATBUFFERS_SRC_DIR "../../node_modules/flatbuffers")

# Add FlatBuffers directly to our build. This defines the `flatbuffers` target.
add_subdirectory(${FLATBUFFERS_SRC_DIR}
                 ${CMAKE_CURRENT_BINARY_DIR}/flatbuffers-build
                 EXCLUDE_FROM_ALL)

# add the executable
add_executable(flatbuffer_wrapper main.cpp)

# Now simply link against flatbuffers as needed to your already declared target.
# The flatbuffers target carry header search path automatically if CMake > 2.8.11.
target_link_libraries(flatbuffer_wrapper PRIVATE flatbuffers)

