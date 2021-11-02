#include "hapticcurved.h"

HapticCurved::HapticCurved(QObject * parent) : HapticFlat(parent)
{
    type = "Curved";
    diameter = 12;
    thickness = 0.17;
    radius = 18.7;
    rise = 0.2843;
}

void HapticCurved::setRadius(float r)
{
    radius = r;
    emit radiusChanged();
}

float HapticCurved::get_radius()
{
    return radius;
}

void HapticCurved::setRise(float ri)
{
    rise = ri;
    emit riseChanged();
}

float HapticCurved::get_rise()
{
    return rise;
}
