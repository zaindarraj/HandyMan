#include "fileworker.h"
#include "template.cpp"

FileWorker::FileWorker(const int& interval){
    m_interval = interval;
}
int FileWorker::getInterval()const{
    return m_interval;
}
int FileWorker::getNumberFromStat(const QString& statLine){
         QRegularExpressionMatch i = rx.match(statLine);
        if(i.hasMatch()){
             return i.captured().toInt();
         }
        return 0;
}

QString FileWorker::getStringFromLine(const QString& line){
    QRegularExpressionMatch i = alpharx.match(line);
    if(i.hasMatch()){
        return i.captured("name");
    }
    return "";
}

void FileWorker::addStat(StatItem* itemStat){
    m_statsItems.append(itemStat);
}


void FileWorker::removeStat(StatItem* itemStat){
    m_statsItems.removeAll(itemStat);
    delete itemStat;

}
//Do a file search for the Stats Stack
void FileWorker::run(){
    while(true){
        if (!m_meminfo.open(QIODevice::ReadOnly | QIODevice::Text))
        {
            emit message("Something went wrong accessing the system stats");
            return ;
        }
        QTextStream out(&m_meminfo);
        QString line;
        for (StatItem* statItem :  m_statsItems) {
            while(out.readLineInto(&line)){
                if(getStringFromLine(line) == statItem->name()){
                    qDebug()<<statItem->name()<<getNumberFromStat(line);
                    statItem->setValue(kbToMb(getNumberFromStat(line)));
                    break;
                }
            }
        }

        if(m_interval == -1){
            exit();
            break;
        }

        m_meminfo.close();
        qDebug()<<m_interval;
        sleep(m_interval); // sleep for the interval refresh rate
    }

}


