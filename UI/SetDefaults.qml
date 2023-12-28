import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Rectangle{

    color : systemTheme.base

    ListModel{
        id : availableStats
        ListElement{
            name : "Total RAM"
            uuid : "MemTotal"
        }
        ListElement{
            name : "Total RAM"
            uuid : "MemTotal"
        }
        ListElement{
            name : "Total RAM"
            uuid : "MemTotal"
        }
        ListElement{
            name : "Total RAM"
            uuid : "MemTotal"
        }
        ListElement{
            name : "Total RAM"
            uuid : "MemTotal"
        }
        ListElement{
            name : "Total RAM"
            uuid : "MemTotal"
        }
    }

    Rectangle {
        anchors.margins: 40
        anchors.fill: parent
        radius: 10
        color : systemTheme.highlight
        RowLayout{
            anchors.fill: parent
            Item{
                Layout.fillWidth: true
                Layout.preferredWidth: 1
                Layout.preferredHeight: 200

                ListView{
                    spacing : 20
                    width : 220
                    height : 300
                    ScrollBar.vertical: ScrollBar {
                         policy: ScrollBar.AlwaysOn
                    }
                    boundsBehavior: Flickable.StopAtBounds
                    boundsMovement: Flickable.StopAtBounds

                    anchors.centerIn: parent
                    model : availableStats
                    delegate: Rectangle{
                            width : 200
                            height : 50
                            radius: 10
                            color : systemTheme.button
                            CheckBox{
                                anchors.top: parent.top
                                anchors.bottom : parent.bottom
                                text : name
                            }
                    }
                }
            }
        }
    }
}
