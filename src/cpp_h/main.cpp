#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QUuid>
#include <QQmlEngine>
/*#include "KTools/uuidslist.h"
#include "KTools/options.h"
#include "KTools/Kff/metainfofs.h"
#include "KTools/Kff/manager.h"
#include "KTools/Kff/rawstream.h"
#include "KTools/Kff/fixedtypes.h"
#include "KTools/Kff/variabletypes.h"
*/

#include "KTools/src/cpp_h/options.h"

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

    //KTools::Kff::registerTypesForQml();

    static KTools::Options *options = new KTools::Options();
    /*FsHandler *fsExplorerHandle = new FsHandler();
    KTools::Kff::MetainfoFs db(options);
    ImageStorage::Interface imageStorage(&db);

    UuidsList::ids.init(&UuidsList::ids);
    UuidsList::ids.createItems(20);

    engine.rootContext()->setContextProperty("uuidsList", &UuidsList::ids);
    engine.rootContext()->setContextProperty("fsExplorerHandle", fsExplorerHandle);
    engine.rootContext()->setContextProperty("imageStorage", &imageStorage);
    engine.load(url);

    testFunction();*/

    return app.exec();
}


//_DECLARE_METATYPE(KTools::Kff::NameInfo)
//Q_DECLARE_METATYPE(KTools::Kff::NameInfoList)
