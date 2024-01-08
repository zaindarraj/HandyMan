import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import StatItem
import UIComponent


Rectangle{
    id : homePage
    color : systemTheme.base

    property int columns: 3

    states: [
        State {
            name: "Maximize"
            PropertyChanges {
                target: homePage; width : mainWindow.maximumWidth; height : mainWindow.maximumHeight

            }
        }
    ]

    Component.onCompleted: {
        stateGroup.maximize()
        state : "Maximize"

    }

    //for full screen
    GridLayout{
                    columns: homePage.columns
                    anchors.fill: parent
                    Component.onCompleted: {
                    }

                    Repeater {
                            model: statsManager.list.length
                            delegate: CircuralIndicator{
                                Layout.alignment: Qt.AlignCenter
                            }

                        }
                }








}
