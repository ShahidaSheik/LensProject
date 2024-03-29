#include "todomodelnew.h"
#include "todolist.h"

ToDoModelNew::ToDoModelNew(QObject *parent)
    : QAbstractListModel(parent), mList(nullptr)
{
}

int ToDoModelNew::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid() || !mList)
        return 0;

    // FIXME: Implement me!
    return mList->items().size();
}

QVariant ToDoModelNew::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !mList)
        return QVariant();

    const ToDoItem item = mList->items().at(index.row());
    switch(role)
    {
      case DoneRole:
        return QVariant(item.done);
      case DescriptionRole:
        return QVariant(item.description);
    }

    return QVariant();
}

bool ToDoModelNew::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!mList)
        return false;
    ToDoItem item = mList->items().at(index.row());
    switch(role) {
      case DoneRole:
            item.done = value.toBool();
            break;
      case DescriptionRole:
            item.description = value.toString();
            break;
    }
    if (mList->setItemAt(index.row(),item)) {
        emit dataChanged(index, index, QVector<int>() << role);

        return true;
    }
    return false;
}

Qt::ItemFlags ToDoModelNew::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

QHash<int, QByteArray> ToDoModelNew::roleNames() const
{
    QHash<int,QByteArray> names;
    names[DoneRole] = "done";
    names[DescriptionRole] = "description";
    return names;
}

ToDoList *ToDoModelNew::list()
{
    return mList;
}

void ToDoModelNew::setList(ToDoList *l)
{
    beginResetModel();
    if(mList)
        mList->disconnect(this);
    mList = l;
    if(mList)
    {
        connect(mList,&ToDoList::preItemAppended,this,[=]() {
                const int index = mList->items().size();
                beginInsertRows(QModelIndex(),index,index);
        } );
        connect(mList,&ToDoList::postItemAppended,this,[=]() {
            endInsertRows();
        } );
    }
    endResetModel();
}


