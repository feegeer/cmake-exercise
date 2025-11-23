cmake_minimum_required(VERSION 3.24)

project("CMakeExercise")

find_package(Boost REQUIRED COMPONENTS container filesystem)

find_package(deal.II REQUIRED CONFIG)
deal_ii_initialize_cached_variables()

find_package(yaml-cpp REQUIRED)

add_library(fem fem/fem.cpp)
deal_ii_setup_target(fem)

add_library(filesystem filesystem/filesystem.cpp)
add_library(flatset flatset/flatset.cpp)

add_library(yamlParser yamlParser/yamlParser.cpp)
target_link_libraries(yamlParser PRIVATE yaml-cpp)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE fem filesystem flatset yamlParser  ${Boost_FILESYSTEM_LIBRARY} ${Boost_SYSTEM_LIBRARY})
