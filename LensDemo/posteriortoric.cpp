#include "posteriortoric.h"
#include "anteriortoric.h"

PosteriorToric::PosteriorToric(QObject *parent) : AnteriorToric(parent)
{
    ProfileType = "Toric";
    ptbackLength = 0;
    latheRecipe = "";
    majorRadius = 10;
    MeasureSurface = false;
    minorRadius = 15;
    ptSqredgeStep = 0;
}

void PosteriorToric::set_ptbacklen(float bl)
{
    ptbackLength = bl;
}

float PosteriorToric::get_ptbacklen()
{
 return ptbackLength;
}

void PosteriorToric::set_ptsqredge(float sqed)
{
    ptSqredgeStep = sqed;
}

float PosteriorToric::get_ptsqredge()
{
    return ptSqredgeStep;
}
