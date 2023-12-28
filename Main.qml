import QtQuick
import UI
import Constants
import QtQuick.Controls
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

    StackView{
        id : navStack
        anchors.fill: parent
        initialItem: initPage
    }

    Component{
        id : initPage
        InitialPage{
         }
    }



    Component{
        id : setDefaults
        SetDefaults{
         }
    }


    color: systemTheme.base
}
