#include "dataobjectmodel.h"

DataObjectModel::DataObjectModel(QObject *parent) : QAbstractListModel(parent), m_count(0)
{

}

QQmlListProperty<QObject> DataObjectModel::content()
{
    return QQmlListProperty<QObject>(this,
                                         0,
                                         &DataObjectModel::dataObjectAppend,
                                         &DataObjectModel::dataObjectCount,
                                         &DataObjectModel::dataObjectAt,
                                         &DataObjectModel::dataObjectClear);
}

void DataObjectModel::dataObjectAppend(QQmlListProperty<QObject> *list, QObject *o)
{
    DataObjectModel *dom = qobject_cast<DataObjectModel*>(list->object);
    if (dom && o) {
        dom->append(o);
    }
}

int DataObjectModel::dataObjectCount(QQmlListProperty<QObject> *list)
{
    DataObjectModel *dom = qobject_cast<DataObjectModel*>(list->object);
    if (dom) {
        return dom->m_data.count();
    }
    return 0;
}

QObject *DataObjectModel::dataObjectAt(QQmlListProperty<QObject> *list, int i)
{
    DataObjectModel *dom = qobject_cast<DataObjectModel*>(list->object);
    if (dom) {
        return dom->get(i);
    }
    return 0;
}

void DataObjectModel::dataObjectClear(QQmlListProperty<QObject> *list)
{
    DataObjectModel *dom = qobject_cast<DataObjectModel*>(list->object);
    if (dom) {
        dom->m_data.clear();
    }
}
void DataObjectModel::insert(QObject *o, int i)
{
    beginInsertRows(QModelIndex(), i, i);
        m_data.insert(i, o);

        // Emit changed signals
        emit countChanged(count());

        endInsertRows();
}

void DataObjectModel::append(QObject *o)
{
    int i = m_data.size();
        beginInsertRows(QModelIndex(), i, i);
        m_data.append(o);

        // Emit changed signals
        emit countChanged(count());

        endInsertRows();
}

QObject *DataObjectModel::get(int i)
{
    if(i < 0 || i >= m_data.count()) {
            return m_data.at(count());
        }
        return m_data.at(i);
}

int DataObjectModel::rowCount(const QModelIndex &p) const
{
    Q_UNUSED(p)
    return m_data.size();
}

QVariant DataObjectModel::data(const QModelIndex &index, int role) const
{
    Q_UNUSED(role)
    return QVariant::fromValue(m_data[index.row()]);
}

QHash<int, QByteArray> DataObjectModel::roleNames() const
{
    static QHash<int, QByteArray> *pHash;
        if (!pHash) {
            pHash = new QHash<int, QByteArray>;
            (*pHash)[Qt::UserRole + 1] = "dataObject";
        }
        return *pHash;
}

int DataObjectModel::count() const
{
    return m_count;
}

void DataObjectModel::setcount(int newCount)
{
    if (m_count == newCount)
        return;
    m_count = newCount;
    emit countChanged(count());
}
