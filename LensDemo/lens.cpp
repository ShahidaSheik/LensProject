#include "lens.h"
//#include <QStandardItemModel>

LensTree::LensTree(QObject *parent)
  : QStandardItemModel(parent)
{
    QStandardItem *mylens = new QStandardItem;
    mylens->setData("MyLens",Name);
    appendRow(mylens);

    QStandardItem *anterior = new QStandardItem;
    anterior->setData("Anterior/Front",Name);
    mylens->appendRow(anterior);

    QStandardItem *posterior = new QStandardItem;
    posterior->setData("Posterior/Back",Name);
    mylens->appendRow(posterior);

    QStandardItem *haptic = new QStandardItem;
    haptic->setData("Haptic",Name);
    mylens->appendRow(haptic);

}

QModelIndex LensTree::getIndex(int row)
{
    return index(row, 0);
}

QHash<int, QByteArray> LensTree::roleNames() const
{
    QHash<int, QByteArray> names;
    names[Name] = "name";
    return names;
}
