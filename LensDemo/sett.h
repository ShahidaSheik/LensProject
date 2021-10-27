#ifndef SETT_H
#define SETT_H

#include <QObject>

class Settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY (QString ProfileType READ get_ProfileType WRITE setProfileType NOTIFY profiletypeChanged)
    Q_PROPERTY (bool MeasureSurface READ get_MeasureSurface WRITE setMeasureSurface NOTIFY meassurChanged)

public:
    Settings(QObject *parent = NULL);

    Q_INVOKABLE void setProfileType(QString);
    Q_INVOKABLE QString get_ProfileType();

    Q_INVOKABLE void setMeasureSurface(bool);
    Q_INVOKABLE bool get_MeasureSurface();

signals:
   void profiletypeChanged();
   void meassurChanged();

protected:
    QString ProfileType;
    bool MeasureSurface;
};

#endif // SETT_H
