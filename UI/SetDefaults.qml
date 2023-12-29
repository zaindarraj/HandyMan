import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Imports

Rectangle{

    color : systemTheme.base



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
                    model : StatsDataModel{}
                    delegate: Rectangle{
                            width : 200
                            radius: 10
                            color : systemTheme.button
                            implicitWidth : column.implicitWidth
                            implicitHeight: column.implicitHeight
                            Column{
                                id : column
                                ButtonGroup {
                                       id: childGroup
                                       exclusive: false
                                       checkState: parentBox.checkState
                                   }
                                CheckBox {
                                        id: parentBox
                                        text: qsTr(name)
                                        checkState: childGroup.checkState
                                    }

                                Repeater{
                                    model : subItems
                                    CheckBox {
                                            text: qsTr(name)
                                            leftPadding: indicator.width
                                            ButtonGroup.group: childGroup
                                        }
                                }
                            }
                    }
                }
            }
            Item{
                Layout.fillWidth: true
                Layout.preferredWidth: 1
                Layout.preferredHeight: 300
                ColumnLayout{
                    anchors.fill: parent
                    Item{
                        width : 200
                        Text{
                            text : "Select the system stats to monitor!"
                            wrapMode: Text.WordWrap
                            width : parent.width
                            font.bold: true
                            font.pointSize: 16
                            color : systemTheme.text

                        }
                    }

                    Item{
                        width : 200
                        Text{
                            text : "The selected stats will be monitored in respect to the general frequancy they change in."
                            wrapMode: Text.WordWrap
                            width : parent.width
                            font.italic: true
                            font.pointSize: 8

                        }
                    }
                    Item{

                        Button{
                            text : qsTr("Finish")
                        }
                    }





                }


            }
        }
    }
}
