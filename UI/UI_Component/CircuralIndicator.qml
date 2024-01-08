import QtQuick
import QtQuick.Shapes


Item {
    id: progress
    implicitWidth: 250
    implicitHeight: 250
    // Properties
    // General
    property bool roundCap: true
    property int startAngle: -90
    property real maxValue: 100
    property real value: 50
    property int samples: 4
    // Drop Shadow
    property bool enableDropShadow: false
    property color dropShadowColor: "#20000000"
    property int dropShadowRadius: 10
    // Bg Circle
    property color bgColor: "transparent"
    property color bgStrokeColor: "#7e7e7e"
    property int strokeBgWidth: 16
    // Progress Circle
    property color progressColor: "#55aaff"
    property int progressWidth: 16
    // Text
    property string text: "%"
    property bool textShowValue: true
    property string textFontFamily: "Segoe UI"
    property int textSize: 12
    property color textColor: "#7c7c7c"
    state : "minSize"

    states : [
        State {
            name : "minSize"
            PropertyChanges{
                    target : progress; implicitWidth: 150;  implicitHeight: 150; strokeBgWidth : 10
            }
        }

    ]


    Shape{
        id: shape
        anchors.fill: parent
        layer.enabled: true
        layer.samples: progress.samples
        layer.effect: progress.enableDropShadow ? internal.dropShadow : null

        ShapePath{
            id: pathBG
            strokeColor: progress.bgStrokeColor
            fillColor: progress.bgColor
            strokeWidth: progress.strokeBgWidth
            capStyle: progress.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap

            PathAngleArc{
                radiusX: (progress.width / 2) - (progress.progressWidth / 2)
                radiusY: (progress.height / 2) - (progress.progressWidth / 2)
                centerX: progress.width / 2
                centerY: progress.height / 2
                startAngle: progress.startAngle
                sweepAngle: 360
            }
        }



    }
}
