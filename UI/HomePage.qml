import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import StatItem
Rectangle{
    color : systemTheme.base

    //for full screen



            Rectangle {
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth : parent.width/2
                Layout.preferredHeight: parent.height/2
                radius: 10
                color : systemTheme.highlight
                GridLayout{
                    columns: 3
                    anchors.fill: parent
                    Component.onCompleted: {
                        console.log(statsManager.list[0].value)
                    }

                    Repeater {
                        Component.onCompleted: {
                        }

                            model: statsManager.list.length
                            delegate: Text{
                                text : statsManager.list[index].value
                            }

                        }
                }


                }





}
