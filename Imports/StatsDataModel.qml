import QtQuick

ListModel{
    id : availableStats
    ListElement{
        name : "Memory Stats"
        subItems : [
            ListElement{
                name : "Total RAM"
                uuid : "MemTotal"
                interval : 3600
            },
            ListElement{
                name : "Available RAM"
                uuid : "MemAvailable"
                interval : 1

            },
            ListElement{
                name : "Cached"
                uuid : "Cached"
                interval : 1

            }
        ]

    }




}
