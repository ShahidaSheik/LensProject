#include "posteriorspeheric.h"
#include "sett.h"

PosteriorSpheric::PosteriorSpheric(QObject *parent) : Settings(parent)
{
    MeasureSurface = false;
    ProfileType = "Spherical";
    psbackLength = 0;
    latheRecipe = " ";
    MeasureSurface = false;
    radius = 20.2;
}

void PosteriorSpheric::set_psbacklen(float bl) {
    psbackLength = bl;
    emit psbacklenChanged();
}

float PosteriorSpheric::get_psbacklen() {
    return psbackLength;
}

void PosteriorSpheric::setlatheRecipe(QString r){
    latheRecipe = r;
    emit latheRecipeChanged();
}

QString PosteriorSpheric::get_latheRecipe(){
    return latheRecipe;
}

void PosteriorSpheric::setRadius(float r){
    radius = r;
    emit radiusChanged();
}

float PosteriorSpheric::get_Radius() {
    return radius;
}

void PosteriorSpheric::set_pssqredge(float sqredge) {
   psSqredgeStep = sqredge;
   emit pssqredgeChanged();
}

float PosteriorSpheric::get_pssqredge() {
    return psSqredgeStep;
}
