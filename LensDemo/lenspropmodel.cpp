#include "lenspropmodel.h"

LensModel::LensModel(QObject *parent)
  : QStandardItemModel(parent)
{
    setColumnCount(1);

    QStandardItem *misc = new QStandardItem;
    misc->setData("Misc",Name);
    misc->setData("Misc",Value);
    appendRow(misc);

    QStandardItem *name = new QStandardItem;
    name->setData("Name",Name);
    name->setData("MyLens",Value);
    misc->appendRow(name);

    QStandardItem *precision = new QStandardItem;
    precision->setData("Precision",Name);
    precision->setData(6,Value);
    misc->appendRow(precision);

    QStandardItem *settings = new QStandardItem;
    settings->setData("Settings",Name);
    settings->setData("Settings",Value);
    appendRow(settings);

    QStandardItem *blankdiam = new QStandardItem;
    blankdiam->setData("Blank Diameter",Name);
    blankdiam->setData(14.3,Value);
    settings->appendRow(blankdiam);

    QStandardItem *lensdiam = new QStandardItem;
    lensdiam->setData("Lens Diameter",Name);
    lensdiam->setData(5.5,Value);
    settings->appendRow(lensdiam);

}
void LensModel::setValue(const QModelIndex &index, double value)
{
    itemFromIndex(index)->setData(value, Value);
}

double LensModel::getValue(const QModelIndex &index)
{
    return itemFromIndex(index)->data(Value).toDouble();
}

QModelIndex LensModel::getIndex(int row)
{
    return index(row, 0);
}

QHash<int, QByteArray> LensModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[Name] = "name";
    names[Value] = "value";
    return names;
}
