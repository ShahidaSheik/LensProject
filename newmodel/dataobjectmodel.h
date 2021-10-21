#ifndef DATAOBJECTMODEL_H
#define DATAOBJECTMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QQmlListProperty>

class DataObjectModel : public QAbstractListModel
{
    Q_OBJECT

    Q_DISABLE_COPY(DataObjectModel)
    Q_PROPERTY(int count READ count WRITE setcount NOTIFY countChanged)

    // Add these two lines
    Q_PROPERTY(QQmlListProperty<QObject> content READ content NOTIFY contentChanged)
    Q_CLASSINFO("DefaultProperty", "content")


public:
    explicit DataObjectModel(QObject *parent = nullptr);
    QQmlListProperty<QObject> content();

    Q_INVOKABLE void insert(QObject * o, int i);
    Q_INVOKABLE void append(QObject * o);
    Q_INVOKABLE QObject* get(int i);

    int rowCount(const QModelIndex &p) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    int count() const;
    void setcount(int newCount);

signals:
    void countChanged(int);
    void contentChanged();

public slots:
    static void dataObjectAppend(QQmlListProperty<QObject> *list, QObject *e);
    static int dataObjectCount(QQmlListProperty<QObject> *list);
    static QObject* dataObjectAt(QQmlListProperty<QObject> *list, int i);
    static void dataObjectClear(QQmlListProperty<QObject> *list);

private:
    int m_count;
    QList<QObject *> m_data;
};

#endif // DATAOBJECTMODEL_H
