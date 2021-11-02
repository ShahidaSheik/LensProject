
#include "sett.h"

Settings::Settings(QObject *parent) : QObject (parent)
{

}

void Settings::setProfileType(QString str){
     ProfileType = str;
}

QString Settings::get_ProfileType(){
    return ProfileType;
}

void Settings::setMeasureSurface(bool flag ){
    MeasureSurface = flag;
}

bool Settings::get_MeasureSurface(){
    return MeasureSurface;
}

void Settings::setlatheRecipe(QString r){
    latheRecipe = r;
    emit latheRecipeChanged();
}

QString Settings::get_latheRecipe(){
    return latheRecipe;
}
