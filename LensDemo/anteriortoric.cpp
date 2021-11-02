#include "anteriortoric.h"

AnteriorToric::AnteriorToric(QObject *parent) : Settings(parent)
{
    ProfileType = "Toric";
    MeasureSurface = false;
    latheRecipe = "";
    majorRadius = 10;
    minorRadius = 15;
}

void AnteriorToric::setmajRadius(float majr)
{
    majorRadius = majr;
}

float AnteriorToric::get_majRadius()
{
    return majorRadius;
}

void AnteriorToric::setminRadius(float minr)
{
    minorRadius = minr;
}

float AnteriorToric::get_minRadius()
{
    return minorRadius;
}


