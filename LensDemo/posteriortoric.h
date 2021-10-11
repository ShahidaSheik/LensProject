#ifndef POSTERIORTORIC_H
#define POSTERIORTORIC_H
#include "anteriortoric.h"

class PosteriorToric : public AnteriorToric
{
    Q_OBJECT

    Q_PROPERTY (float ptbackLength READ get_ptbacklen WRITE set_ptbacklen NOTIFY ptbacklenChanged)
    Q_PROPERTY (float ptSqredgeStep READ get_ptsqredge WRITE set_ptsqredge NOTIFY ptsqredgeChanged)

public:
    PosteriorToric(QObject * parent = NULL);

    Q_INVOKABLE void set_ptbacklen(float);
    Q_INVOKABLE float get_ptbacklen();

    Q_INVOKABLE void set_ptsqredge(float);
    Q_INVOKABLE float get_ptsqredge();

signals:
   void ptbacklenChanged();
   void ptsqredgeChanged();

protected:
    float ptbackLength;
    float ptSqredgeStep;

};

#endif // POSTERIORTORIC_H
