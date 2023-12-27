import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
Rectangle{
    id : initialPage
    color : systemTheme.base
    anchors.fill: parent
    //for full screen


        ColumnLayout{
            anchors.fill: parent
            Rectangle {
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth : parent.width/2
                Layout.preferredHeight: parent.height/2
                radius: 10
                color : "slategray"
                Image{
                    anchors.fill: parent
                    source: "./assets/Icon.png"
                    fillMode: Image.PreserveAspectFit
                    width: sourceSize.width
                    height: sourceSize.height
                }
                }
            Button{
                id: createAccount
                text : qsTr("Register Your Account")
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: parent.width*0.3

        }
            Button{
                id: skipfornow
                text : qsTr("Skip for now")
                Layout.alignment: Qt.AlignCenter
                Layout.bottomMargin: 20
                Layout.preferredWidth: parent.width*0.3
        }



    }
}




