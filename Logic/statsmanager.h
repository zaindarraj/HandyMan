#ifndef STATSMANAGER_H
#define STATSMANAGER_H

#include <QObject>
#include <QHash>
#include <QObjectList>
#include <QSharedPointer>
#include "fileworker.h"
#include "statitem.h"
class StatsManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<StatItem*> list READ list NOTIFY listChanged FINAL)

public:
    explicit StatsManager(QObject *parent = nullptr);
    QList<StatItem*> list(){
        return m_statItems;
    }
signals:
    void statsChanged(const QHash<int ,QStringList>& m_stats);
    void listChanged(const QList<StatItem*>&);

public slots:
    void addStat(const QString& stat, const QString& family,const int& interval);
    void removeStat(StatItem* statItem);
    void startAll();
private :
    QList<FileWorker*> m_fileWorkers;
    QList<StatItem*> m_statItems;
};

#endif // STATSMANAGER_H
