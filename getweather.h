#ifndef GETWEATHER_H
#define GETWEATHER_H

#include <QObject>

class GetWeather : public QObject
{
    Q_OBJECT
public:
    explicit GetWeather(QObject *parent = nullptr);
    Q_INVOKABLE void responseWeatherAPI();
signals:

};

#endif // GETWEATHER_H
