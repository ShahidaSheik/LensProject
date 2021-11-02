#include "hapticflat.h"

HapticFlat::HapticFlat(QObject * parent) : QObject(parent)
{
    type = "Flat";
    diameter = 12;
    thickness = 0.17;
}

void HapticFlat::setType(QString t)
{
    type = t;
    emit typeChanged();
}

QString HapticFlat::get_type()
{
    return type;
}

void HapticFlat::setDiameter(int d)
{
    diameter = d;
    emit diameterChanged();
}

int HapticFlat::get_diameter()
{
    return diameter;
}

void HapticFlat::setThickness(float t)
{
    thickness = t;
    emit thicknessChanged();
}

float HapticFlat::get_thickness()
{
    return thickness;
}
