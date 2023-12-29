import QtQuick 2.15
import QtQuick.Controls

Rectangle{
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
