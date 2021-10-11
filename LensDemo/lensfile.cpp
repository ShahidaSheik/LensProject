#include "lensfile.h"
#include <QtQuick>
#include <QMessageBox>
#include <QRegularExpression>

LensFile :: LensFile (QObject * parent): QObject (parent)
{}

void LensFile :: saveFile (QString filedata)
{
    if (filedata.isEmpty ())
    {
        return;
    }
    QString filePath = m_fileName.right (m_fileName.length ()-8);
    QFile file (filePath);
    if (file.exists ())
    {
        file.remove ();
    }
    if (! file.open (QIODevice :: ReadWrite))
    {
        QMessageBox :: information (NULL, "prompt", "file open failed" + filePath);
        return;
    }
    QTextStream out(&file);
    out << filedata;
    emit sourceChanged();
    //file.close ();
}

void LensFile :: readFile ()
{
    QString filePath = m_fileName.right (m_fileName.length ()-8);
    QFile file (filePath);

    if (! file.open (QIODevice :: ReadWrite))
         QMessageBox :: information (NULL, "prompt", "file open failed" + filePath);

    QString line,prop;
    QVariant val;

    QTextStream str(&file);
    QRegularExpression re("^([a-zA-Z0-9\\s]+)*=([a-zA-Z0-9.\\s]+)*$");
    do{
       line = str.readLine();
       QRegularExpressionMatch match = re.match(line);
       if (match.hasMatch()) {
           prop = match.captured(1).trimmed();
           val = match.captured(2).trimmed();
           my_map.insert(prop,val);
       }
     }while(!line.isNull());
    //file.close();
    emit map_changed();
}
QVariantMap LensFile::get_map()
{
    QVariantMap rval;
    qDebug() << " INSIDE GET_MAP ";
    QMapIterator<QString,QVariant> it(my_map);
    while(it.hasNext()){
       it.next();
       rval.insert(it.key(),it.value());
    }
    return rval;
}
void LensFile :: closeFile()
{
    QString filepath = m_fileName.right (m_fileName.length () - 8);
    QFile file(filepath);
    file.close();
}


