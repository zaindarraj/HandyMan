#include "statsmanager.h"

StatsManager::StatsManager(QObject *parent)
    : QObject{parent}
{}



void StatsManager::addStat(const QString& stat, const QString& family,const int& interval){
    StatItem* statItem =
       new StatItem(family,stat);

    //Add it to StatManager
    m_statItems.append(statItem);
    //find corrusponding file worker
    for(FileWorker* fileWorker : m_fileWorkers){
        if(fileWorker->getInterval() == interval){
            fileWorker->addStat(statItem);
            emit listChanged(m_statItems);
            return;
        }
    }
    //Create a new file worker
    FileWorker* fileWorker =  new FileWorker(interval);
    fileWorker->addStat(statItem);
    m_fileWorkers.append(fileWorker);
    emit listChanged(m_statItems);
}


void StatsManager::removeStat(StatItem* statItem){
    m_statItems.removeAll(statItem);
    for(FileWorker* fileWorker : m_fileWorkers){
        fileWorker->removeStat(statItem);
    }
    emit listChanged(m_statItems);
}


void StatsManager::startAll(){
    for(FileWorker*& fileWorker : m_fileWorkers){
        fileWorker->start();
    }
}


