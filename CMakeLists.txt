cmake_minimum_required(VERSION 3.13)
project(comp C)

set(CMAKE_C_STANDARD 11)

include_directories(.)

add_executable(comp
        emitter.c
        error.c
        global.h
        init.c
        lex.yy.c
        main.c
        parser.c
        symbol.c)
