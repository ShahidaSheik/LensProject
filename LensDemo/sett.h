#ifndef SETT_H
#define SETT_H

#include <QObject>

class Settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY (QString LensType READ get_LensType WRITE setLensType NOTIFY lenstypeChanged)
    Q_PROPERTY (bool MeasureSurface READ get_MeasureSurface WRITE setMeasureSurface NOTIFY meassurChanged)

public:
    Settings(QObject *parent = NULL);

    Q_INVOKABLE void setLensType(QString);
    Q_INVOKABLE QString get_LensType();

    Q_INVOKABLE void setMeasureSurface(bool);
    Q_INVOKABLE bool get_MeasureSurface();

signals:
   void lenstypeChanged();
   void meassurChanged();

protected:
    QString LensType;
    bool MeasureSurface;
};

#endif // SETT_H
