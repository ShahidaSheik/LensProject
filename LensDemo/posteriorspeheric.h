#ifndef POSTERIORSPEHERIC_H
#define POSTERIORSPEHERIC_H

#include <QObject>
#include "anteriorspherical.h"

class PosteriorSpeheric : public AnteriorSpherical
{
    Q_OBJECT
    Q_PROPERTY (float psbackLength READ get_psbacklen WRITE set_psbacklen NOTIFY psbacklenChanged)
    Q_PROPERTY (float psSqredgeStep READ get_pssqredge WRITE set_pssqredge NOTIFY pssqredgeChanged)

public:
    PosteriorSpeheric(QObject * parent = NULL);

    Q_INVOKABLE void set_psbacklen(float);
    Q_INVOKABLE float get_psbacklen();

    Q_INVOKABLE void set_pssqredge(float);
    Q_INVOKABLE float get_pssqredge();

signals:
   void psbacklenChanged();
   void pssqredgeChanged();

protected:
    float psbackLength;
    float psSqredgeStep;
};

#endif // POSTERIORSPEHERIC_H
