cmake_minimum_required(VERSION 3.16)

project(HandyMan VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
set(CPACK_PACKAGE_NAME "HandyMan")
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_PACKAGE_CONTACT shithedark@gmail.com)

set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
set(CPACK_PACKAGE_ARCHITECTURE "amd64")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "9")
set(CPACK_PACKAGE_VERSION_PATCH "0")
include(CPack)
qt_standard_project_setup()

qt_add_executable(appHandyMan
    main.cpp
)

qt_add_qml_module(appHandyMan
    URI HandyMan
    VERSION 1.0
    QML_FILES Main.qml
)

add_subdirectory(Imports)
add_subdirectory(Logic)

add_subdirectory(UI)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appHandyMan PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appHandyMan
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appHandyMan
    PRIVATE Qt6::Quick Importsplugin Logicplugin UIplugin UIComponentplugin
)

include(GNUInstallDirs)
install(TARGETS appHandyMan
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
