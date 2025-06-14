cmake_minimum_required(VERSION 4.0)

project(audio_player)

add_compile_options(-Wall -Wextra -Werror)

set(PORTAUDIO_ROOT /opt/homebrew/opt/portaudio)

set(SRCS 
    main.cpp
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ../)

add_executable(audio_player ${SRCS})

target_include_directories(audio_player PRIVATE ${PORTAUDIO_ROOT}/include)
target_link_directories(audio_player PRIVATE ${PORTAUDIO_ROOT}/lib)
target_link_libraries(audio_player PRIVATE portaudiocpp portaudio)

