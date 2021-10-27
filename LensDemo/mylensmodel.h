#ifndef MYLENSMODEL_H
#define MYLENSMODEL_H

#include <QObject>
#include <QStandardItemModel>
#include <QStandardItem>

class MyLensModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY (QString name READ get_name WRITE setname NOTIFY nameChanged)
    Q_PROPERTY (int precision READ get_precision WRITE set_precision NOTIFY precisionChanged)
    Q_PROPERTY (float blankDiameter READ get_blankDiam WRITE set_blankDiam NOTIFY blankDiamChanged)
    Q_PROPERTY (float lensDiameter READ get_lensDiam WRITE set_lensDiam NOTIFY lensDiamChanged)

public:
    MyLensModel(QObject *parent = NULL);

    Q_INVOKABLE void setname(QString);
    Q_INVOKABLE QString get_name();

    Q_INVOKABLE void set_precision(int);
    Q_INVOKABLE int get_precision();

    Q_INVOKABLE void set_blankDiam(float);
    Q_INVOKABLE float get_blankDiam();

    Q_INVOKABLE void set_lensDiam(float);
    Q_INVOKABLE float get_lensDiam();

signals:
   void nameChanged();
   void precisionChanged();
   void blankDiamChanged();
   void lensDiamChanged();

protected:
    QString name;
    int precision;
    float blankDiameter;
    float lensDiameter;

};


#endif // MYLENSMODEL_H
