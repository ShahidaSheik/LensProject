#ifndef HAPTICCURVED_H
#define HAPTICCURVED_H
#include "hapticflat.h"

class HapticCurved : public HapticFlat
{
    Q_OBJECT
    Q_PROPERTY(float radius READ get_radius WRITE setRadius NOTIFY radiusChanged)
    Q_PROPERTY(float rise READ get_rise WRITE setRise NOTIFY riseChanged)
public:
    HapticCurved(QObject * parent = NULL);

    Q_INVOKABLE void setRadius(float r);
    Q_INVOKABLE float get_radius();

    Q_INVOKABLE void setRise(float ri);
    Q_INVOKABLE float get_rise();

signals:
    void radiusChanged();
    void riseChanged();

protected:
    float radius;
    float rise;
};

#endif // HAPTICCURVED_H
