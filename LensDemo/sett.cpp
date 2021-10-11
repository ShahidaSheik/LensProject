
#include "sett.h"

Settings::Settings(QObject *parent) : QObject (parent)
{

}

void Settings::setLensType(QString str){
     LensType = str;
}

QString Settings::get_LensType(){
    return LensType;
}

void Settings::setMeasureSurface(bool flag ){
    MeasureSurface = flag;
}

bool Settings::get_MeasureSurface(){
    return MeasureSurface;
}
