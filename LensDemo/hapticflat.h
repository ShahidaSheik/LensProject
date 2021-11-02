#ifndef HAPTICFLAT_H
#define HAPTICFLAT_H

#include <QObject>
class HapticFlat : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString type READ get_type WRITE setType NOTIFY typeChanged)
    Q_PROPERTY(int diameter READ get_diameter WRITE setDiameter NOTIFY diameterChanged)
    Q_PROPERTY(float thickness READ get_thickness WRITE setThickness NOTIFY thicknessChanged)

public:

    HapticFlat(QObject *parent = NULL);

    Q_INVOKABLE void setType(QString t);
    Q_INVOKABLE QString get_type();

    Q_INVOKABLE void setDiameter(int d);
    Q_INVOKABLE int get_diameter();

    Q_INVOKABLE void setThickness(float t);
    Q_INVOKABLE float get_thickness();

signals:
    void typeChanged();
    void diameterChanged();
    void thicknessChanged();

protected:
    QString type;
    int diameter;
    float thickness;

};

#endif // HAPTICFLAT_H
