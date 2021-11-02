#ifndef POSTERIORASPERICAL_H
#define POSTERIORASPERICAL_H

#include "anterioraspheric.h"

class PosteriorAsperical : public AnteriorAspheric
{
    Q_OBJECT
    Q_PROPERTY (float pabackLength READ get_pabacklen WRITE set_pabacklen NOTIFY pabacklenChanged)
    Q_PROPERTY (float paSqredgeStep READ get_pasqredge WRITE set_pasqredge NOTIFY pasqredgeChanged)

public:
    PosteriorAsperical(QObject * parent = NULL);

    Q_INVOKABLE void set_pabacklen(float);
    Q_INVOKABLE float get_pabacklen();

    Q_INVOKABLE void set_pasqredge(float);
    Q_INVOKABLE float get_pasqredge();

signals:
   void pabacklenChanged();
   void pasqredgeChanged();

protected:
    float pabackLength;
    float paSqredgeStep;

};

#endif // POSTERIORASPERICAL_H
