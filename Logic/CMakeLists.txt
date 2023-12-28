cmake_minimum_required(VERSION 3.16)


qt_add_library(Logic STATIC)


qt6_add_qml_module(Logic
    URI "Logic"
    RESOURCE_PREFIX "/qt/qml"
    VERSION 1.0
    SOURCES
    SOURCES
    SOURCES fileworker.h fileworker.cpp
    SOURCES
    SOURCES template.cpp
)
