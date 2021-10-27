#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "lensfile.h"
#include "lens.h"
#include "anteriorspherical.h"
#include "anteriortoric.h"
#include "anterioraspheric.h"
#include "posteriorspeheric.h"
#include "posteriortoric.h"
#include "posteriorasperical.h"
#include "mylensmodel.h"


int main(int argc, char *argv[])
{
   QApplication app(argc, argv);
   QQmlApplicationEngine engine;

   LensTree lenstree;
   MyLensModel mylens;
   AnteriorSpherical anspherical;
   AnteriorToric antoric;
   AnteriorAspheric anaspheric;
   PosteriorSpheric posspherical;
   PosteriorToric postoric;
   PosteriorAsperical posaspheric;

   engine.rootContext()->setContextProperty("lenstree", &lenstree);
   engine.rootContext()->setContextProperty("mylensmodel", &mylens);
   engine.rootContext()->setContextProperty("anteriorspherical", &anspherical);
   engine.rootContext()->setContextProperty("anteriortoric", &antoric);
   engine.rootContext()->setContextProperty("anterioraspheric", &anaspheric);
   engine.rootContext()->setContextProperty("posteriorspherical", &posspherical);
   engine.rootContext()->setContextProperty("posteriortoric", &postoric);
   engine.rootContext()->setContextProperty("posterioraspheric", &posaspheric);


   qmlRegisterType<LensFile>("com.mytexteditor.filerwritter", 1, 0, "FileRWritter");

   engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

   return app.exec();
}
