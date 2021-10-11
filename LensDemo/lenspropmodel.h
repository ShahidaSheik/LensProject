#ifndef LENSPROPMODEL_H
#define LENSPROPMODEL_H

#include <QObject>
#include <QStandardItemModel>
#include <QStandardItem>

class LensModel : public QStandardItemModel

{
public:
    LensModel(QObject *parent = nullptr);
    enum{
       Name =Qt::UserRole,
       Value
    };
    Q_INVOKABLE void setValue(const QModelIndex &index, double value);
    Q_INVOKABLE double getValue(const QModelIndex &index);
    Q_INVOKABLE QModelIndex getIndex(int row);

    QHash<int, QByteArray> roleNames() const override;
    QVector<LensModel> mItems;


signals:

};

#endif // LENSPROPMODEL_H
