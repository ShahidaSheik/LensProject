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
    Q_PROPERTY (int diopter READ get_diopter WRITE setdiopter NOTIFY diopterChanged)
    Q_PROPERTY (double FluidIOR READ get_FluidIOR WRITE setFluidIOR NOTIFY fluidiorChanged)
    Q_PROPERTY (double materialIOR READ get_materialIOR WRITE setmaterialIOR NOTIFY matiorChanged)
    Q_PROPERTY (bool specifyDiopter READ get_specifyDiopter WRITE setspecifyDiopter NOTIFY spedioChanged)
    Q_PROPERTY (QString latheRecipe READ get_latheRecipe WRITE setlatheRecipe NOTIFY latheRecipeChanged)
    Q_PROPERTY (float radius READ get_Radius WRITE setRadius NOTIFY radiusChanged)

public:
    AnteriorSpherical(QObject *parent = NULL);

    Q_INVOKABLE void setdiopter(int);
    Q_INVOKABLE int get_diopter();

    Q_INVOKABLE void setFluidIOR(double);
    Q_INVOKABLE double get_FluidIOR();

    Q_INVOKABLE void setmaterialIOR(double);
    Q_INVOKABLE double get_materialIOR();

    Q_INVOKABLE void setspecifyDiopter(bool);
    Q_INVOKABLE bool get_specifyDiopter();

    Q_INVOKABLE void setlatheRecipe(QString);
    Q_INVOKABLE QString get_latheRecipe();

    Q_INVOKABLE void setRadius(float);
    Q_INVOKABLE float get_Radius();

signals:
   void diopterChanged();
   void fluidiorChanged();
   void matiorChanged();
   void spedioChanged();
   void latheRecipeChanged();
   void radiusChanged();

protected:
    int diopter;
    double FluidIOR;
    double materialIOR;
    bool specifyDiopter;
    QString latheRecipe;
    float radius;
};

#endif // ANTERIORSPHERICAL_H
