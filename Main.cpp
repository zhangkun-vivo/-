#include <FelgoApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlEngine>
#include "Connect.h"


int main(int argc, char *argv[])
{

    QGuiApplication app(argc,argv);
    qmlRegisterType<Connect>("com.Server", 1, 0, "Server");
    QQmlApplicationEngine engine;
       FelgoApplication felgo;
       Connect ser_con;
          felgo.initialize(&engine);
          felgo.setLicenseKey(PRODUCT_LICENSE_KEY);

     felgo.setMainQmlFileName(QStringLiteral("qml/Menu.qml"));
         engine.rootContext()->setContextProperty("server",&ser_con);
       engine.load(QUrl (QStringLiteral("qml/Menu.qml")));
      // QQmlComponent component(&engine,QUrl::fromLocalFile("Global2.qml"))
             //  object = component.create();
         if(engine.rootObjects().isEmpty())
           return -1;
       return app.exec();
}
