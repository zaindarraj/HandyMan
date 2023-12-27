#ifndef FILEWORKER_H
#define FILEWORKER_H

#include <QObject>
#include <QThread>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QRegularExpression>
#include <QHash>
class FileWorker : public QThread
{
    Q_OBJECT
public:
    FileWorker(const QStringList& stats,  const int&& interval);
    void run()override;
    void addStat(const QString&& stat);
signals:
    void message(const QString& message);
public slots :
    void test_me(const QString& message);
private :
    QHash<QString, int> m_statVal;
    QStringList m_stats;
    int m_interval; // in seconds.
    QFile m_meminfo = QFile("/proc/meminfo");
    QRegularExpression rx = QRegularExpression("\\d+");
    int getNumberFromStat(const QString& statLine);

};

#endif // FILEWORKER_H
