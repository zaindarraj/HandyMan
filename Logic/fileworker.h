#ifndef FILEWORKER_H
#define FILEWORKER_H

#include <QObject>
#include <QThread>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QRegularExpression>
#include "statitem.h"
class FileWorker : public QThread
{
    Q_OBJECT
public:
    FileWorker(const int&interval);
    void run()override;
    int getInterval()const;

signals:
    void message(const QString& message);
public slots :
    void addStat(StatItem* statItem);
    void removeStat(StatItem* statItem);

private :
    QList<StatItem*> m_statsItems;
    int m_interval; // in seconds.
    QFile m_meminfo = QFile("/proc/meminfo");
    QRegularExpression rx = QRegularExpression("\\d+");
    QRegularExpression alpharx = QRegularExpression("(?<name>\\w+)");
    QString getStringFromLine(const QString& line);
    int getNumberFromStat(const QString& statLine);

};

#endif // FILEWORKER_H
