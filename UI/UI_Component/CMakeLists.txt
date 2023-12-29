cmake_minimum_required(VERSION 3.16)



qt_add_library(UIComponent STATIC)


qt6_add_qml_module(UIComponent
    URI "UIComponent"
    RESOURCE_PREFIX "/qt/qml"
    VERSION 1.0
    QML_FILES
    assets/background.jpeg
    QML_FILES SetDefaultsDelegate.qml

)


