#ifndef CONNECT_H
#define CONNECT_H
#include <QObject>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

class Connect:public QObject
{
        Q_OBJECT
public:
     Connect();
     Q_INVOKABLE QString re();
    Q_INVOKABLE QString connect(int a);
     Q_INVOKABLE QString makelisten(void);
     Q_INVOKABLE void client(int a);


};
#endif // CONNECT_H
