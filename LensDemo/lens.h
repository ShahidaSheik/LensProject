#ifndef LENS_H
#define LENS_H

#include <QObject>
#include <QStandardItemModel>
#include <QStandardItem>

class LensTree : public QStandardItemModel

{
public:
    explicit LensTree(QObject *parent = nullptr);
    enum{
       Name =Qt::UserRole,
    };

    Q_INVOKABLE QModelIndex getIndex(int row);

    QHash<int, QByteArray> roleNames() const override;
    QVector<LensTree> mItems;


signals:

};

#endif //LENS_H
