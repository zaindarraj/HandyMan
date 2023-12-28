#include "fileworker.h"
#include "template.cpp"

FileWorker::FileWorker(const QStringList& stats, const int&& interval){
    m_stats = stats;
    m_interval = interval;
}

int FileWorker::getNumberFromStat(const QString& statLine){
         QRegularExpressionMatch i = rx.match(statLine);
        if(i.hasMatch()){
             return i.captured().toInt();
         }
        return 0;
}

void FileWorker::addStat(const QString&& stat){
    m_stats.append(stat);
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
        //Read file line by line to find the stats
        while(out.readLineInto(&line)){
            if(m_statVal.size() == m_stats.size()){
                qDebug() << kbToMb(m_statVal.value("MemAvailable"));
                break;
            }
            foreach (QString stat, m_stats) {
                if(line.contains(stat)){
                    m_statVal.insert(stat, getNumberFromStat(line));
                }
            }

        }


        m_statVal.clear();
        m_meminfo.close();
        sleep(m_interval); // sleep for the interval refresh rate
    }

}

void FileWorker::test_me(const QString& message){
    qDebug() << "Sdfsdfsd";
}

