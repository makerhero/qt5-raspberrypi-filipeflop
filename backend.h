#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>

class BackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool btnStatus READ btnStatus WRITE setBtnStatus NOTIFY btnStatusChanged)

public:
    explicit BackEnd(QObject *parent = 0);

    bool btnStatus();
    void setBtnStatus(const bool &btnStatus);

signals:
    void btnStatusChanged();

private:
    bool m_btnStatus;
};

#endif // BACKEND_H
