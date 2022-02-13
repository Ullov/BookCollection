#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QUuid>
#include <QQmlEngine>

#include <curl/curl.h>
#include "KTools/src/cpp_h/options.h"
#include "KTools/src/cpp_h/uuidslist.h"
#include "searchclient.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    curl_global_init(CURL_GLOBAL_ALL);
    static KTools::Options *options = new KTools::Options();
    SearchClient sc;
    sc.init();

    //KTools::Kff::registerTypesForQml();


    //KTools::Kff::MetainfoFs db(options);

    UuidsList::ids.init(&UuidsList::ids);
    UuidsList::ids.createItems(20);

    engine.rootContext()->setContextProperty("uuidsList", &UuidsList::ids);
    engine.load(url);

    return app.exec();
}


//_DECLARE_METATYPE(KTools::Kff::NameInfo)
//Q_DECLARE_METATYPE(KTools::Kff::NameInfoList)
