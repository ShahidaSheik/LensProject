#include "posteriorspeheric.h"
#include "anteriorspherical.h"

PosteriorSpeheric::PosteriorSpeheric(QObject *parent) : AnteriorSpherical(parent)
{

}
void PosteriorSpeheric::set_psbacklen(float bl)
{
    psbackLength = bl;
}

float PosteriorSpeheric::get_psbacklen()
{
    return psbackLength;
}

void PosteriorSpeheric::set_pssqredge(float sqredge)
{
   psSqredgeStep = sqredge;
}

float PosteriorSpeheric::get_pssqredge()
{
    return psSqredgeStep;
}
