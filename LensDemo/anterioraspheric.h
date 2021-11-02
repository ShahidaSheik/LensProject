#ifndef ANTERIORASPHERIC_H
#define ANTERIORASPHERIC_H
#include <QObject>
#include "sett.h"

class AnteriorAspheric : public Settings
{
    Q_OBJECT
    Q_PROPERTY (int A1 READ get_A1 WRITE setA1 NOTIFY a1Changed)
    Q_PROPERTY (int A2 READ get_A2 WRITE setA2 NOTIFY a2Changed)
    Q_PROPERTY (int A3 READ get_A3 WRITE setA3 NOTIFY a3Changed)
    Q_PROPERTY (int A4 READ get_A4 WRITE setA4 NOTIFY a4Changed)
    Q_PROPERTY (float basCurvature READ get_basCurvature WRITE setbasCurvature NOTIFY basecurChanged)
    Q_PROPERTY (float conicConstant READ get_conicConstant WRITE setconicConstant NOTIFY conconsChanged)
    Q_PROPERTY (float radiusCurvature READ get_radiusCurvature WRITE setradiusCurvature NOTIFY radcurChanged)

public:
    AnteriorAspheric(QObject *parent = NULL);

    Q_INVOKABLE void setA1(int);
    Q_INVOKABLE int get_A1();

    Q_INVOKABLE void setA2(int);
    Q_INVOKABLE int get_A2();

    Q_INVOKABLE void setA3(int);
    Q_INVOKABLE int get_A3();

    Q_INVOKABLE void setA4(int);
    Q_INVOKABLE int get_A4();

    Q_INVOKABLE void setbasCurvature(float);
    Q_INVOKABLE float get_basCurvature();

    Q_INVOKABLE void setconicConstant(float);
    Q_INVOKABLE float get_conicConstant();

    Q_INVOKABLE void setradiusCurvature(float);
    Q_INVOKABLE float get_radiusCurvature();

signals:
   void a1Changed();
   void a2Changed();
   void a3Changed();
   void a4Changed();
   void basecurChanged();
   void conconsChanged();
   void radcurChanged();


protected:
    int A1,A2,A3,A4;
    float basCurvature;
    float conicConstant;
    float radiusCurvature;
};

#endif // ANTERIORASPHERIC_H
