#ifndef ANTERIORTORIC_H
#define ANTERIORTORIC_H

#include "sett.h"

class AnteriorToric : public Settings
{
    Q_OBJECT
    Q_PROPERTY (float majorRadius READ get_majRadius WRITE setmajRadius NOTIFY majradiusChanged)
    Q_PROPERTY (float minorRadius READ get_minRadius WRITE setminRadius NOTIFY minfluidiorChanged)
public:
    AnteriorToric(QObject * parent = NULL);

    Q_INVOKABLE void setmajRadius(float);
    Q_INVOKABLE float get_majRadius();


    Q_INVOKABLE void setminRadius(float);
    Q_INVOKABLE float get_minRadius();

signals:
   void majradiusChanged();
   void minfluidiorChanged();

protected:
    float majorRadius;
    float minorRadius;
};

#endif // ANTERIORTORIC_H
