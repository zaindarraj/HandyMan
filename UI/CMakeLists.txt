cmake_minimum_required(VERSION 3.16)



qt_add_library(UI STATIC)


qt6_add_qml_module(UI
    URI "UI"
    RESOURCE_PREFIX "/qt/qml"
    VERSION 1.0
    QML_FILES InitialPage.qml
    RESOURCES assets/Icon.png
    QML_FILES SetDefaults.qml
)

add_subdirectory(UI_Component)

