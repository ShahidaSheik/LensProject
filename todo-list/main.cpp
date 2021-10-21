#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "todomodelnew.h"
#include "todolist.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    qmlRegisterType<ToDoModelNew>("ToDo",1,0,"ToDoModel");
    qmlRegisterUncreatableType<ToDoList>("ToDo",1,0,"ToDoList", QStringLiteral("ToDoList shouild not be created in QML"));

    ToDoList  tdl;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty(QStringLiteral("toDoList"),&tdl);

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    engine.load(url);

    return app.exec();
}
