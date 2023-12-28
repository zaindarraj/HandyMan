#include "constants.h"

Constants::Constants(QObject *parent)
    : QObject{parent}
{}



QString Constants::getAppName(){
    return m_appName;
}


QString Constants::appName()const {
    return m_appName;
}


