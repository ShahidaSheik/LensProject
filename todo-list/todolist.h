#ifndef TODOLIST_H
#define TODOLIST_H

#include <QObject>
#include <QVector>

struct ToDoItem {
    bool done;
    QString description;
};

class ToDoList : public QObject
{
    Q_OBJECT
public:
    explicit ToDoList(QObject *parent = nullptr);

    QVector<ToDoItem> items() const;

    bool setItemAt(int index, const ToDoItem &item);

    void showList();

signals:
    void preItemAppended();
    void postItemAppended();

public slots:
    void appendItems();


private:
    QVector<ToDoItem> mItems;

};

#endif // TODOLIST_H
