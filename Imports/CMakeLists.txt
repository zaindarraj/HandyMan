cmake_minimum_required(VERSION 3.16)



qt_add_library(Imports STATIC)

set_source_files_properties(Constants.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt6_add_qml_module(Imports
    URI "Imports"
    RESOURCE_PREFIX "/qt/qml"
    VERSION 1.0
    QML_FILES
    SOURCES constants.h constants.cpp
    QML_FILES StatsDataModel.qml
)


