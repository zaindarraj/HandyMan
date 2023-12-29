#ifndef STATITEM_H
#define STATITEM_H

#include <QObject>
#include <QQmlEngine>
class StatItem : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString family READ family FINAL CONSTANT)
    Q_PROPERTY(QString name READ name FINAL CONSTANT)
    Q_PROPERTY(float value READ value WRITE setValue NOTIFY valueChanged FINAL)
public:
    explicit StatItem( const QString& family,  const QString& name , QObject *parent = nullptr);

    const QString family() const;
    const QString name()const;
    const float value()const;
    void setValue(const float& value);

signals:
    void valueChanged(const float& value);

private :
    const QString m_family;
    const QString m_name;
    float m_value;
};

#endif // STATITEM_H
