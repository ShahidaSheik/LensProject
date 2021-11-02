#ifndef SETT_H
#define SETT_H

#include <QObject>

class Settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY (QString ProfileType READ get_ProfileType WRITE setProfileType NOTIFY profiletypeChanged)
    Q_PROPERTY (bool MeasureSurface READ get_MeasureSurface WRITE setMeasureSurface NOTIFY meassurChanged)
    Q_PROPERTY (QString latheRecipe READ get_latheRecipe WRITE setlatheRecipe NOTIFY latheRecipeChanged)

public:
    Settings(QObject *parent = NULL);

    Q_INVOKABLE void setProfileType(QString);
    Q_INVOKABLE QString get_ProfileType();

    Q_INVOKABLE void setMeasureSurface(bool);
    Q_INVOKABLE bool get_MeasureSurface();

    Q_INVOKABLE void setlatheRecipe(QString);
    Q_INVOKABLE QString get_latheRecipe();

signals:
   void profiletypeChanged();
   void meassurChanged();
   void latheRecipeChanged();

protected:
    QString ProfileType;
    bool MeasureSurface;
    QString latheRecipe;
};

#endif // SETT_H
