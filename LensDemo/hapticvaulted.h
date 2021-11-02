#ifndef HAPTICVAULTED_H
#define HAPTICVAULTED_H

#include "hapticflat.h"

class HapticVaulted : public HapticFlat
{
    Q_OBJECT
    Q_PROPERTY(float rise READ get_rise WRITE setRise NOTIFY riseChanged)

public:
    HapticVaulted(QObject * parent = NULL);

    Q_INVOKABLE void setRise(float r);
    Q_INVOKABLE float get_rise();

signals:
    void riseChanged();

protected:
    float rise;
};

#endif // HAPTICVAULTED_H
