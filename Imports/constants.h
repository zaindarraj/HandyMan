#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <QObject>
#include <QQmlEngine>
#include <QString>

class Constants : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString appName READ appName NOTIFY nameChanged)
public:
    explicit Constants(QObject *parent = nullptr);
    QString appName() const;
    QString getAppName();
signals:
    void nameChanged();
private :
    QString m_appName = "Handy Man";


};

#endif // CONSTANTS_H
