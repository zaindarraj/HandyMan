import QtQuick
import UI
import Constants
import Qt5Compat.GraphicalEffects
Window {
    id : mainWindow
    minimumWidth: 640
    minimumHeight: 480
    maximumWidth : 640
    maximumHeight:  480
    visible: true
    title :Constants.appName


    SystemPalette{
        id: systemTheme
        colorGroup: SystemPalette.Active
    }

    InitialPage{}

    color: systemTheme.base
}
