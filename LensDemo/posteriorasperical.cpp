#include "posteriorasperical.h"
#include "anteriorspherical.h"

PosteriorAsperical::PosteriorAsperical(QObject *parent) : AnteriorSpherical(parent)
{

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
