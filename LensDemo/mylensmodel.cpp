#include "mylensmodel.h"

MyLensModel::MyLensModel(QObject *parent) : QObject(parent)
{
    name = "MyLens1";
    precision = 6;
    blankDiameter = 14.3;
    lensDiameter = 5.5;
}

void MyLensModel::setname(QString n)
{
    name = n;
    emit nameChanged();
}

QString MyLensModel::get_name()
{
    return name;
}

void MyLensModel::set_precision(int p)
{
    precision = p;
    emit precisionChanged();
}

int MyLensModel::get_precision()
{
    return precision;
}

void MyLensModel::set_blankDiam(float bd)
{
    blankDiameter = bd;
    emit blankDiamChanged();
}

float MyLensModel::get_blankDiam()
{
    return blankDiameter;
}

void MyLensModel::set_lensDiam(float ld)
{
    lensDiameter = ld;
    emit lensDiamChanged();
}

float MyLensModel::get_lensDiam()
{
    return lensDiameter;
}
