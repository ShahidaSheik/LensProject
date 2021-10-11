#ifndef LENSFILE
#define LENSFILE

#include <QObject>
#include <qvariant.h>
#include <QFile>

class LensFile: public QObject
{
    Q_OBJECT
    Q_PROPERTY (QString m_fileName READ getFileName WRITE setFileName NOTIFY sourceChanged)
    Q_PROPERTY(QMap<QString,QVariant> my_map READ get_map NOTIFY map_changed);

public:
   LensFile (QObject * parent = NULL);//QString filename,

   Q_INVOKABLE void saveFile (QString filedata);
   Q_INVOKABLE void readFile ();

   Q_INVOKABLE QString getFileName () { return m_fileName;}
   Q_INVOKABLE void setFileName (QString filename) { m_fileName = filename;}

   Q_INVOKABLE QVariantMap get_map();
   void fill_map();

   Q_INVOKABLE void closeFile();
signals:
   void sourceChanged();
   void map_changed();

private:
   QString m_fileName;
   QMap<QString, QVariant> my_map;
};

#endif
