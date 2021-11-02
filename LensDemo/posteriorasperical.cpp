#include "posteriorasperical.h"
#include "anterioraspheric.h"

PosteriorAsperical::PosteriorAsperical(QObject *parent) : AnteriorAspheric(parent)
{
    ProfileType = "ASpherical";
    A1 = 0;
    A2 = 0;
    A3 = 0;
    A4 = 0;
    pabackLength = 0;
    basCurvature = 0.1;
    conicConstant = -1;
    latheRecipe = "";
    MeasureSurface = false;
    radiusCurvature = 10;
    paSqredgeStep = 0;
}
void PosteriorAsperical::set_pabacklen(float bl)
{
    pabackLength = bl;
}

float PosteriorAsperical::get_pabacklen()
{
    return pabackLength;
}

void PosteriorAsperical::set_pasqredge(float sqredge)
{
   paSqredgeStep = sqredge;
}

float PosteriorAsperical::get_pasqredge()
{
    return paSqredgeStep;
}
