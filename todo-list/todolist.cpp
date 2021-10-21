#include "todolist.h"
#include <iostream>

ToDoList::ToDoList(QObject *parent) : QObject(parent)
{
  mItems.append({true,QStringLiteral("Wash the care")});
  mItems.append({false,QStringLiteral("fix the sink")});
  mItems.append({false,QStringLiteral("cook the food")});
}

QVector<ToDoItem> ToDoList::items() const
{
    return mItems;
}

bool ToDoList::setItemAt(int index, const ToDoItem &item)
{
    if(index < 0 || index >= mItems.size())
        return false;
    const ToDoItem &oldItem = mItems.at(index);

    if(item.done == oldItem.done && item.description == oldItem.description)
        return false;
    mItems[index] = item;
    return true;
}

void ToDoList::showList() {
    ToDoItem item;
    for(int i = 0; i < mItems.size();i++) {
        item = mItems.at(i);
        printf("Done = %d",item.done);

    }
}

void ToDoList::appendItems()
{
    emit preItemAppended();
    ToDoItem item;
    item.done = false;
    mItems.append(item);
}
