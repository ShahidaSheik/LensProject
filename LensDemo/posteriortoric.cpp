#include "posteriortoric.h"
#include "anteriortoric.h"

PosteriorToric::PosteriorToric(QObject *parent) : AnteriorToric(parent)
{}

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
