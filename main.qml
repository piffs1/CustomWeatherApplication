import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: mainWnd
    visible: true
    minimumWidth: 668
    minimumHeight: 468
    //width: 668
    //height: 468
    title: "Custom Weather Application"

    Image {
        source: "moscow-russia-kremlin-city-616.jpg"
        fillMode: Image.PreserveAspectCrop
        anchors.fill:parent
    }

    Rectangle {
        id: footerWthr
        readonly property int footerHeight: 162
        width: mainWnd.width
        height: footerHeight
        y: mainWnd.height-footerHeight
        color: Qt.rgba(0,0,0.2,0.6);


        ///BLOCK TODAY BEGIN
        /// SUN

        Image {
            id: imgDailyWeather
            readonly property int sunWidth: 70
            source: "sunny.svg"
            width: sunWidth
            height: sunWidth
            x: 35
            y: rectToday.y
        }

        //TODAY TEXT
        Rectangle {
            id: rectToday
            x:125
            y:44
            radius: 5
            width:48
            height:19
            color: "gray"
            Text {
                text: "TODAY"
                anchors.centerIn: parent
                color: "white"

            }
        }

        Text{
            x:125
            y:75
            text: "12 °"
            font {
                bold: true
                pixelSize: 30
                family: "Arial"

            }
            color: "white"
        }
        ///BLOCK TODAY END
        ///BLOCK WEEK BEGIN

        readonly property var listDays: [
            ["TUE","sunny.svg","12°"],
            ["WED","sunny_cloudy.svg","10°"],
            ["THU","cloudy.svg","8°"],
            ["FRI","sunny_rain.svg","8°"],
            ["SAT","easy_cloud.svg","4°"],
            ["SUN","snow.svg","-2°"]
        ]

        Repeater {
            id: rpt
            property alias listDays: footerWthr.listDays
            readonly property int offsetX: 240
            model: listDays
            //DAY OF
            Rectangle {
                id: _dlgt
                Rectangle {
                    x:/*baseX*/ rpt.offsetX + /*offset*/ index*((mainWnd.width - rpt.offsetX)/rpt.listDays.length)
                    y: 44
                    width: 32
                    height: 17
                    radius: 5
                    color: "gray"
                    Text {
                        text: rpt.listDays[index][0]
                        anchors.centerIn: parent
                        color: "white"

                    }
                }

                Image {
                    source: rpt.listDays[index][1]
                    width: 35
                    height: 35
                    x: rpt.offsetX + index*((mainWnd.width - rpt.offsetX)/rpt.listDays.length)
                    y:70
                }

                Text{
                    x:rpt.offsetX + index*((mainWnd.width - rpt.offsetX)/rpt.listDays.length)
                    y:116
                    text: rpt.listDays[index][2]
                    color: "white"
                    font {
                        bold: true
                        pixelSize: 30
                        family: "Arial"
                    }
                }
            }
        }
        ///BLOCK WEEK END
    }

    ///BLOCK CITY/COUNTRY BEGIN
    ///CITY
    Text {
        id:txtCity
        color: "white"
        x:mainWnd.width - 55 - width
        y:75
        text: "Moscow"
        font.pixelSize: 26
        font.family: "Arial"
    }
    ///COUNTRY
    Text {
        id: txtCountry
        color: "white"
        x:  txtCity.x + txtCity.width - width
        y: txtCity.y + txtCity.height + 7
        text: "Russia"
        font.pixelSize: 14
        font.family: "Arial"
    }
    ///BLOCK CITY/COUNTRY END

    ///BLOCK TIME/DAY BEGIN
    Text {
        id: txtTime
        x:58
        y:58
        text: "12:30"
        font.family: "Arial"
        font.pixelSize: 48
        color: "white"
    }

    Text {
        id: txt_am_pm
        font.family: "Arial"
        font.pixelSize: 18
        x: txtTime.x + txtTime.width + /*offset*/ 10
        y: txtTime.y + txtTime.height - height
        text: "PM"
        color: "white"
    }
    ///BLOCK TIME/DAY END
    Text {
        x: txtTime.x
        y: txtTime.y + txtTime.height + 15
        text: "Monday, 2 February 2015"
        font.family: "Arial"
        font.pixelSize: 16
        color: "white"
    }
    ///BLOCK DAY/
    Timer {
        interval: 1000*5
        running: true
        repeat: true
        onTriggered: {
            weather.responseWeatherAPI();
        }
    }
}
