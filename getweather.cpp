#include "getweather.h"
#include <QDebug>
GetWeather::GetWeather(QObject *parent) : QObject(parent)
{

}

void GetWeather::responseWeatherAPI()
{
    qDebug() << "Response sended!";
}
