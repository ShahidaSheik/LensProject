#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "lensfile.h"
#include "lens.h"
#include "lenspropmodel.h"
#include "anteriorspherical.h"
#include "anteriortoric.h"
#include "anterioraspheric.h"
#include "posteriorspeheric.h"
#include "posteriortoric.h"
#include "posteriorasperical.h"
#include <QtQml>

int main(int argc, char *argv[])
{
   QApplication app(argc, argv);

   QQmlApplicationEngine engine;

   LensTree lenstree;
   LensModel lenspropmodel;
   AnteriorSpherical anteriorspherical;
   AnteriorToric anteriortoric;
   AnteriorAspheric anterioraspheric;
   PosteriorSpeheric posteriorspeherical;
   PosteriorToric posteriortoric;
   PosteriorAsperical posterioraspheric;

   engine.rootContext()->setContextProperty("lenstree", &lenstree);
   engine.rootContext()->setContextProperty("lensmodel", &lenspropmodel);
   engine.rootContext()->setContextProperty("anteriorspherical", &anteriorspherical);
   engine.rootContext()->setContextProperty("anteriortoric", &anteriortoric);
   engine.rootContext()->setContextProperty("anterioraspheric", &anterioraspheric);
   engine.rootContext()->setContextProperty("posteriorspherical", &posteriorspeherical);
   engine.rootContext()->setContextProperty("posteriortoric", &posteriortoric);
   engine.rootContext()->setContextProperty("posterioraspheric", &posterioraspheric);


   qmlRegisterType<LensFile>("com.mytexteditor.filerwritter", 1, 0, "FileRWritter");

   engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

   return app.exec();
}
