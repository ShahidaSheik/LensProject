#ifndef ANTERIORSPHERICAL_H
#define ANTERIORSPHERICAL_H

#include <QObject>
#include <QStandardItemModel>
#include <QStandardItem>
#include "anterioraspheric.h"
#include "sett.h"

class AnteriorSpherical : public Settings
{
    Q_OBJECT
    Q_PROPERTY (float radius READ get_Radius WRITE setRadius NOTIFY radiusChanged)
    Q_PROPERTY (double FluidIOR READ get_FluidIOR WRITE setFluidIOR NOTIFY fluidiorChanged)
    Q_PROPERTY (int majoyD READ get_majoyD WRITE setmajoyD NOTIFY majdChanged)
    Q_PROPERTY (double materialIOR READ get_materialIOR WRITE setmaterialIOR NOTIFY matiorChanged)
    Q_PROPERTY (int minorD READ get_minorD WRITE setminorD NOTIFY mindChanged)
    Q_PROPERTY (bool specifyDiopter READ get_specifyDiopter WRITE setspecifyDiopter NOTIFY spedioChanged)

public:
    AnteriorSpherical(QObject *parent = NULL);

    Q_INVOKABLE void setRadius(float);
    Q_INVOKABLE float get_Radius();

    Q_INVOKABLE void setFluidIOR(double);
    Q_INVOKABLE double get_FluidIOR();

    Q_INVOKABLE void setmajoyD(int);
    Q_INVOKABLE int get_majoyD();

    Q_INVOKABLE void setmaterialIOR(double);
    Q_INVOKABLE double get_materialIOR();

    Q_INVOKABLE void setminorD(int);
    Q_INVOKABLE int get_minorD();

    Q_INVOKABLE void setspecifyDiopter(bool);
    Q_INVOKABLE bool get_specifyDiopter();

signals:
   void radiusChanged();
   void fluidiorChanged();
   void majdChanged();
   void matiorChanged();
   void mindChanged();
   void spedioChanged();

protected:
   float radius;
    double FluidIOR;
    int majoyD;
    double materialIOR;
    int minorD;
    bool specifyDiopter;
};

#endif // ANTERIORSPHERICAL_H
