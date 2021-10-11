#include "anteriorspherical.h"
#include "sett.h"

AnteriorSpherical::AnteriorSpherical(QObject *parent)
    : Settings(parent)
{}

void AnteriorSpherical::setRadius(float r)
{
    radius = r;
}

float AnteriorSpherical::get_Radius()
{
     return radius;
}



void AnteriorSpherical::setFluidIOR(double fior)
{
    FluidIOR = fior;
}

double AnteriorSpherical::get_FluidIOR()
{
    return FluidIOR;
}

void AnteriorSpherical::setmajoyD(int maj)
{
    majoyD = maj;
}

int AnteriorSpherical::get_majoyD()
{
    return majoyD;
}

void AnteriorSpherical::setmaterialIOR(double mater)
{
    materialIOR = mater;
}

double AnteriorSpherical::get_materialIOR()
{
    return materialIOR;
}

void AnteriorSpherical::setminorD(int min)
{
    minorD = min;
}

int AnteriorSpherical::get_minorD()
{
    return minorD;
}

void AnteriorSpherical::setspecifyDiopter(bool)
{

}

bool AnteriorSpherical::get_specifyDiopter()
{
    return specifyDiopter;
}

