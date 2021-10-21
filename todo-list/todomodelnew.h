#ifndef TODOMODELNEW_H
#define TODOMODELNEW_H

#include <QAbstractListModel>

class ToDoList;

class ToDoModelNew : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(ToDoList *list READ list WRITE setList NOTIFY listSet);

public:
    explicit ToDoModelNew(QObject *parent = nullptr);

    enum {
        DoneRole = Qt::UserRole,
        DescriptionRole
    };

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

     virtual QHash<int,QByteArray> roleNames() const override;

    ToDoList* list();
    void setList(ToDoList* l);

signals:
    void listSet();

private:
    ToDoList *mList;

};

#endif // TODOMODELNEW_H
