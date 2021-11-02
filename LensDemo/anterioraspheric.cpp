#include "anterioraspheric.h"

AnteriorAspheric::AnteriorAspheric(QObject *parent) : Settings(parent)
{
    A1 = 0;
    A2 = 0;
    A3 = 0;
    A4 = 0;
    basCurvature = 0.1;
    conicConstant = -1;
    latheRecipe = "";
    radiusCurvature = 10;
    ProfileType = "ASpherical";
    MeasureSurface = false;

}

void AnteriorAspheric::setA1(int aa)
{
   A1 = aa;
}

int AnteriorAspheric::get_A1()
{
  return A1;
}

void AnteriorAspheric::setA2(int ab)
{
    A2 = ab;
}

int AnteriorAspheric::get_A2()
{
    return A2;
}

void AnteriorAspheric::setA3(int ac)
{
    A3 = ac;
}

int AnteriorAspheric::get_A3()
{
    return A3;
}

void AnteriorAspheric::setA4(int ad)
{
    A4 = ad;
}

int AnteriorAspheric::get_A4()
{
    return A4;
}

void AnteriorAspheric::setbasCurvature(float bc)
{
    basCurvature = bc;
}

float AnteriorAspheric::get_basCurvature()
{
    return basCurvature;
}

void AnteriorAspheric::setconicConstant(float cc)
{
    conicConstant = cc;
}

float AnteriorAspheric::get_conicConstant()
{
    return conicConstant;
}

void AnteriorAspheric::setradiusCurvature(float rc)
{
    radiusCurvature = rc;
}

float AnteriorAspheric::get_radiusCurvature()
{
    return radiusCurvature;
}
