#include "anteriorspherical.h"
#include "sett.h"

AnteriorSpherical::AnteriorSpherical(QObject *parent)
    : Settings(parent)
{
    MeasureSurface = false;
    ProfileType = "Spherical";
    diopter = 1;
    FluidIOR = 1.334;
    materialIOR = 1.4914;
    specifyDiopter = true;
    latheRecipe = " ";
    radius = 7.35;
}

void AnteriorSpherical::setdiopter(int d) {
    diopter = d;
    emit diopterChanged();
}
int AnteriorSpherical::get_diopter() {
    return diopter;
}

void AnteriorSpherical::setFluidIOR(double fior){
    FluidIOR = fior;
    emit fluidiorChanged();
}

double AnteriorSpherical::get_FluidIOR(){
    return FluidIOR;
}

void AnteriorSpherical::setmaterialIOR(double mater){
    materialIOR = mater;
    emit matiorChanged();
}

double AnteriorSpherical::get_materialIOR(){
    return materialIOR;
}

void AnteriorSpherical::setspecifyDiopter(bool sd){
   specifyDiopter = sd;
   emit spedioChanged();
}

bool AnteriorSpherical::get_specifyDiopter(){
    return specifyDiopter;
}

void AnteriorSpherical::setRadius(float r){
    radius = r;
    emit radiusChanged();
}
float AnteriorSpherical::get_Radius() {
    return radius;
}











