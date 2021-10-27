#ifndef POSTERIORSPEHERIC_H
#define POSTERIORSPEHERIC_H

#include <QObject>
#include "sett.h"

class PosteriorSpheric : public Settings
{
    Q_OBJECT
    Q_PROPERTY (float psbackLength READ get_psbacklen WRITE set_psbacklen NOTIFY psbacklenChanged)
    Q_PROPERTY (QString latheRecipe READ get_latheRecipe WRITE setlatheRecipe NOTIFY latheRecipeChanged)
    Q_PROPERTY (float radius READ get_Radius WRITE setRadius NOTIFY radiusChanged)
    Q_PROPERTY (float psSqredgeStep READ get_pssqredge WRITE set_pssqredge NOTIFY pssqredgeChanged)

public:
    PosteriorSpheric(QObject * parent = NULL);

    Q_INVOKABLE void setlatheRecipe(QString);
    Q_INVOKABLE QString get_latheRecipe();

    Q_INVOKABLE void setRadius(float);
    Q_INVOKABLE float get_Radius();

    Q_INVOKABLE void set_psbacklen(float);
    Q_INVOKABLE float get_psbacklen();

    Q_INVOKABLE void set_pssqredge(float);
    Q_INVOKABLE float get_pssqredge();

signals:
   void latheRecipeChanged();
   void radiusChanged();
   void psbacklenChanged();
   void pssqredgeChanged();

protected:
    float psbackLength;
    QString latheRecipe;
    float radius;
    float psSqredgeStep;
};

#endif // POSTERIORSPEHERIC_H
