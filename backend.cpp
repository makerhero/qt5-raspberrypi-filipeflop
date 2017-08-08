#include <QDebug>

#include "backend.h"
#include <wiringPi.h>

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
}

bool BackEnd::btnStatus()
{
    return m_btnStatus;
}

void BackEnd::setBtnStatus(const bool &btnStatus)
{
    if (btnStatus == m_btnStatus)
        return;
    m_btnStatus = btnStatus;

    if (m_btnStatus == 1)
    {
        digitalWrite(0, HIGH);
        qDebug() << "BACKEND C++:  " << "m_btnStatus: " << m_btnStatus;
    }
    if (m_btnStatus == 0)
    {
        digitalWrite(0, LOW);
        qDebug() << "BACKEND C++:  " << "m_btnStatus: " << m_btnStatus;
    }
    emit btnStatusChanged();
}
