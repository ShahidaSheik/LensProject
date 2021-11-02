#include "posteriorspeheric.h"
#include "anteriorspherical.h"


PosteriorSpheric::PosteriorSpheric(QObject *parent) : AnteriorSpherical(parent)
{
    ProfileType = "Spherical";
    psbackLength = 0;
    latheRecipe = " ";
    MeasureSurface = false;
    radius = 20.2;
    psSqredgeStep = 0;
}

void PosteriorSpheric::set_psbacklen(float bl) {
    psbackLength = bl;
    emit psbacklenChanged();
}

float PosteriorSpheric::get_psbacklen() {
    return psbackLength;
}

void PosteriorSpheric::set_pssqredge(float sqredge) {
   psSqredgeStep = sqredge;
   emit pssqredgeChanged();
}

float PosteriorSpheric::get_pssqredge() {
    return psSqredgeStep;
}
