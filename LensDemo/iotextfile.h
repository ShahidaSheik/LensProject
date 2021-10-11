#ifndef IOTEXTFILE_H
#define IOTEXTFILE_H
#include <QObject>

class IOTextFile : public QObject
{
    Q_OBJECT

public:
    Q_PROPERTY(QString source
               READ source
               WRITE setSource
               NOTIFY sourceChanged)
    explicit IOTextFile(QObject *parent = 0);

    Q_INVOKABLE QString read();
    Q_INVOKABLE bool write(const QString& data);

    QString source() { return mSource; };

public slots:
    void setSource(const QString& source) { mSource = source; };

private:
    QString mSource;
};


#endif // IOTEXTFILE_H
