#include "statitem.h"

StatItem::StatItem(const QString& family,  const QString& name ,QObject *parent)
    : QObject{parent}, m_family(family), m_name(name)
{}


const QString StatItem::name()const{
    return m_name;
}


const QString StatItem::family()const{
    return m_family;
}



void StatItem::setValue(const float& value){
    m_value = value;
    emit valueChanged(m_value);
}


const float StatItem::value()const{
    return m_value;
}
