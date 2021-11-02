#include "hapticvaulted.h"

HapticVaulted::HapticVaulted(QObject *  parent) : HapticFlat(parent)
{
    type = "Vaulted";
    diameter = 12;
    thickness = 0.17;
    rise = 0.25;
}

void HapticVaulted::setRise(float r)
{
    rise = r;
    emit riseChanged();
}

float HapticVaulted::get_rise()
{
    return rise;
}
