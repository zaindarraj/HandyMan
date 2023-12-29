#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <Logic/fileworker.h>
#include <Imports/constants.h>
#include "Logic/statsmanager.h"
static QObject *example_qobject_singletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    Constants* constants = new Constants();
    return constants;
}
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<StatItem*>("StatItem", 1, 0, "StatItem");
    qmlRegisterType<StatsManager>("StatsManager", 1, 0, "StatsManager");
    const QUrl url(u"qrc:/HandyMan/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    qmlRegisterSingletonType<Constants>("Constants", 1, 0, "Constants", example_qobject_singletontype_provider);
    Constants constants;
    app.setApplicationName(constants.getAppName());
    app.setOrganizationName(constants.getAppName());
    engine.load(url);



    return app.exec();
}
