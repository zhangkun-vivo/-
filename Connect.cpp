#include "Connect.h"
#include<stdio.h>

#include<stdlib.h>

#include<string.h>

#include<errno.h>

#include<sys/types.h>

#include<sys/socket.h>

#include<netinet/in.h>

#include<unistd.h>
#include <QDebug>
#include <sys/ioctl.h>
#include <boost/timer.hpp>
#include<pthread.h>
#include<thread>
char buff[4096];
struct sockaddr_in  servaddr;
int listenfd;
int a;

using namespace boost;
using namespace  std;

void *test(void *arg){
   // QObject *myflag = object->findChild<QObject*>("")
    //qDebug()<<"sda";
    //while(1){
    //qDebug()<<"sd";
    /* int server_sockfd ;//服务器端套接字
        int client_sockfd ;//客户端套接字
        int len;
        struct sockaddr_in my_addr;   //服务器网络地址结构体
        struct sockaddr_in reote_addr; //客户端网络地址结构体
        int sin_size;
        char buf[BUFSIZ];
        memset(&my_addr,0,sizeof(my_addr)); //数据初始化--清零
            my_addr.sin_family=AF_INET; //设置为IP通信
            my_addr.sin_addr.s_addr=INADDR_ANY;//服务器IP地址--允许连接到所有本地地址上
            my_addr.sin_port=htons(8000);
            sin_size=sizeof(struct sockaddr_in);
          //  printf("accept client %s\n",inet_ntoa(remote_addr.sin_addr));
         //   len=send(client_sockfd,"Welcome to my server\n",21,0);//发送欢迎信息
            len=recv(client_sockfd,buf,BUFSIZ,0);
            buf[len]='/0';
            // printf("%s\n",buf); */

                //pthread_t id;
                //int thread_param=1;
                //::pthread_create(&id,NULL,test,(void *)&);
                /*int   listenfd,connfd=39;

                struct sockaddr_in  servaddr;

                char  buff[4096];

                int  n;



                if( (listenfd = socket(AF_INET, SOCK_STREAM, 0)) == -1 ){

                     //QDebug<<"create socket error: %s(errno: %d)\n",streror(errno),errno;

                     //return 0;

                 }

                //unsigned long ul=1;
                //ioctl(listenfd,FIONBIO,&ul);

                 memset(&servaddr, 0, sizeof(servaddr));


                servaddr.sin_family = AF_INET;



                servaddr.sin_addr.s_addr = htonl(INADDR_ANY);


                servaddr.sin_port = htons(6666);


                //qDebug()<<"ds";
                if( bind(listenfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) == -1){

                    qDebug()<<"bind socket error: strerror(errno)(errno: errno)\n";

                }
                //qDebug()<<"ds";

                listen(listenfd, 10);

                //qDebug()<<"ds";

                //if( listen(listenfd, 10) == -1){

                   //  printf("listen socket error: %s(errno: %d)\n",strerror(errno),errno);
                    //qDebug()<<"ds";
                     //return 0;

            //     }



                qDebug()<<"======waiting for client's request======\n";


                  //   listen(listenfd, 10);
                //unsigned long ul=1;
                //ioctl(listenfd,FIONBIO,&ul);
                //timer tm;


                    //if( (connfd = accept(listenfd, (struct sockaddr*)NULL, NULL)) == -1){

                      //   printf("accept socket error: %s(errno: %d)",strerror(errno),errno);
                        //tm.tv_sec=TIME_OUT_TIME;
                        //if(tm.el)
                       // return "lose";
                        //qDebug()<<"sadasd";
                 // }



                //thread t(test,listenfd);
                //qDebug()<<"ss";*/
    int connfd,n;
               connfd = accept(listenfd, (struct sockaddr*)NULL, NULL);

                    qDebug()<<connfd;
                    //return connfd;

                     n = recv(connfd, buff, 4096, 0);

                     buff[n] = '\0';
                     //qDebug()<<buff;

                     qDebug()<<"recv msg from client:"<<buff<<"\n";

                     //exit(0);
                   //  if(buff[n] == 'null')
                  //   {
                          //close(connfd);
                  //   break;

              //  }


                 //close(listenfd);
                 //qDebug()<< "/n"<< "/n"<< "/n"<<buff<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n";
                     //close(listenfd);
                     //class thread x(connect);
                     //x.detach();
                 //return buff;
    }
void *cli(void *arg)
{
        int   sockfd, n;

        char  recvline[4096];//sendline[4096];
        //*s = *sendline;

        struct sockaddr_in  connectaddr;


   /*if( argc != 2){

        qDebug()<<"usage: ./client <ipaddress>\n";

        return 0;

    }*/
        //return sockfd = socket(AF_INET, SOCK_STREAM, 0);

    if( (sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0){

        //printf("create socket error: %s(errno: %d)\n", strerror(errno),errno);
        qDebug()<<"create socket error: strerror(errno)(errno: errno)\n";
        //return 0;

    }



    memset(&connectaddr, 0, sizeof(connectaddr));

    connectaddr.sin_family = AF_INET;

    connectaddr.sin_port = htons(6666);

   /*if( inet_pton(AF_INET, argv[1], &servaddr.sin_addr) <= 0){

       // printf("inet_pton error for %s\n",argv[1]);
           qDebug()<<"inet_pton error for argv[1]\n";
        return 0;

    }*/
    inet_pton(AF_INET, "192.168.43.40", &connectaddr.sin_addr);



    /*if( connect(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0){

        //printf("connect error: %s(errno: %d)\n",strerror(errno),errno);
            qDebug()<<"connect error: strerror(errno)(errno: errno)\n";
        return 0;

    }*/
    //inet_pton(AF_INET, "192.168.43.40", &servaddr.sin_addr);
    //sendline="sdada"
    //qDebug()<<"ddddd";
    ::connect(sockfd, (struct sockaddr*)&connectaddr, sizeof(connectaddr));
    //qDebug()<<"dssd";
    while(1){
        //qDebug()<<a;
switch(a){
//shape
case 0:{
    char sendline[4096]="shape0";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 1:{
    char sendline[4096]="shape1";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 2:{
    char sendline[4096]="shape2";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 3:{
    char sendline[4096]="shape3";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 4:{
    char sendline[4096]="shape4";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 5:{
    char sendline[4096]="shape5";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 6:{
    char sendline[4096]="shape6";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 7:{
    char sendline[4096]="shape7";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 8:{
    char sendline[4096]="shape8";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 9:{
    char sendline[4096]="shape9";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 10:{
    char sendline[4096]="shape10";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 11:{
    char sendline[4096]="shape11";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 12:{
    char sendline[4096]="shape12";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 13:{
    char sendline[4096]="shape13";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 14:{
    char sendline[4096]="shape14";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 15:{
    char sendline[4096]="shape15";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 16:{
    char sendline[4096]="shape16";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 17:{
    char sendline[4096]="shape17";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
case 18:{
    char sendline[4096]="shape18";
    send(sockfd, sendline, strlen(sendline), 0);
break;
}
    //operation:
    case 19:{
        char sendline[4096]="left";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 20:{
        char sendline[4096]="right";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 21:{
        char sendline[4096]="change";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 22:{
        char sendline[4096]="down";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }

}
    }
}
 void cli2(void){
            int   sockfd, n;

            char  recvline[4096];//sendline[4096];
            //*s = *sendline;

            struct sockaddr_in  connectaddr;


       /*if( argc != 2){

            qDebug()<<"usage: ./client <ipaddress>\n";

            return 0;

        }*/
            //return sockfd = socket(AF_INET, SOCK_STREAM, 0);

        if( (sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0){

            //printf("create socket error: %s(errno: %d)\n", strerror(errno),errno);
            qDebug()<<"create socket error: strerror(errno)(errno: errno)\n";
            //return 0;

        }



        memset(&connectaddr, 0, sizeof(connectaddr));

        connectaddr.sin_family = AF_INET;

        connectaddr.sin_port = htons(6666);

       /*if( inet_pton(AF_INET, argv[1], &servaddr.sin_addr) <= 0){

           // printf("inet_pton error for %s\n",argv[1]);
               qDebug()<<"inet_pton error for argv[1]\n";
            return 0;

        }*/
        inet_pton(AF_INET, "192.168.43.40", &connectaddr.sin_addr);



        /*if( connect(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0){

            //printf("connect error: %s(errno: %d)\n",strerror(errno),errno);
                qDebug()<<"connect error: strerror(errno)(errno: errno)\n";
            return 0;

        }*/
        //inet_pton(AF_INET, "192.168.43.40", &servaddr.sin_addr);
        //sendline="sdada"
        //qDebug()<<"ddddd";
        ::connect(sockfd, (struct sockaddr*)&connectaddr, sizeof(connectaddr));
        //qDebug()<<"dssd";

            //qDebug()<<a;
    switch(a){
    //shape
    case 0:{
        char sendline[4096]="shape0";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 1:{
        char sendline[4096]="shape1";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 2:{
        char sendline[4096]="shape2";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 3:{
        char sendline[4096]="shape3";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 4:{
        char sendline[4096]="shape4";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 5:{
        char sendline[4096]="shape5";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 6:{
        char sendline[4096]="shape6";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 7:{
        char sendline[4096]="shape7";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 8:{
        char sendline[4096]="shape8";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 9:{
        char sendline[4096]="shape9";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 10:{
        char sendline[4096]="shape10";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 11:{
        char sendline[4096]="shape11";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 12:{
        char sendline[4096]="shape12";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 13:{
        char sendline[4096]="shape13";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 14:{
        char sendline[4096]="shape14";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 15:{
        char sendline[4096]="shape15";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 16:{
        char sendline[4096]="shape16";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 17:{
        char sendline[4096]="shape17";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 18:{
        char sendline[4096]="shape18";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
        //operation:
        case 19:{
            char sendline[4096]="left";
            send(sockfd, sendline, strlen(sendline), 0);
        break;
        }
        case 20:{
            char sendline[4096]="right";
            send(sockfd, sendline, strlen(sendline), 0);
        break;
        }
        case 21:{
            char sendline[4096]="change";
            send(sockfd, sendline, strlen(sendline), 0);
        break;
        }
        case 22:{
            char sendline[4096]="down";
            send(sockfd, sendline, strlen(sendline), 0);
        break;
        }


        }
// printf("send msg to server: \n");
    qDebug()<<"send msg to server:\n";
    //fgets(sendline, 4096, stdin);

   /*if( send(sockfd, sendline, strlen(sendline), 0) < 0){

        //printf("send msg error: %s(errno: %d)\n", strerror(errno), errno);
        qDebug()<<"send msg error: strerror(errno)(errno: errno)\n";
        return 0;

    }*/

    close(sockfd);

    //return 0;

}


Connect::Connect(){
}

    QString Connect::connect(int b)
{
        a=b;
   /* int server_sockfd ;//服务器端套接字
    int client_sockfd ;//客户端套接字
    int len;
    struct sockaddr_in my_addr;   //服务器网络地址结构体
    struct sockaddr_in reote_addr; //客户端网络地址结构体
    int sin_size;
    char buf[BUFSIZ];
    memset(&my_addr,0,sizeof(my_addr)); //数据初始化--清零
        my_addr.sin_family=AF_INET; //设置为IP通信
        my_addr.sin_addr.s_addr=INADDR_ANY;//服务器IP地址--允许连接到所有本地地址上
        my_addr.sin_port=htons(8000);
        sin_size=sizeof(struct sockaddr_in);
      //  printf("accept client %s\n",inet_ntoa(remote_addr.sin_addr));
     //   len=send(client_sockfd,"Welcome to my server\n",21,0);//发送欢迎信息
        len=recv(client_sockfd,buf,BUFSIZ,0);
        buf[len]='/0';
        // printf("%s\n",buf); */

            //pthread_t id;
            //int thread_param=1;
            //::pthread_create(&id,NULL,test,(void *)&);
            int   connfd;

            //struct sockaddr_in  servaddr;

            //char  buff[4096];

            int  n;

            if( (listenfd = socket(AF_INET, SOCK_STREAM, 0)) == -1 ){

                 //QDebug<<"create socket error: %s(errno: %d)\n",streror(errno),errno;

                 //return 0;

             }

            //unsigned long ul=1;
            //ioctl(listenfd,FIONBIO,&ul);

             memset(&servaddr, 0, sizeof(servaddr));

            servaddr.sin_family = AF_INET;



            servaddr.sin_addr.s_addr = htonl(INADDR_ANY);


            servaddr.sin_port = htons(6666);


            qDebug()<<"ds";
            if( bind(listenfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) == -1){

                qDebug()<<"bind socket error: strerror(errno)(errno: errno)\n";

            }
            //qDebug()<<"ds";

            listen(listenfd, 10);
           // qDebug()<<"ds";

            //if( listen(listenfd, 10) == -1){

               //  printf("listen socket error: %s(errno: %d)\n",strerror(errno),errno);
                //qDebug()<<"ds";
                 //return 0;

        //     }



            //qDebug()<<"======waiting for client's request======\n";


              //   listen(listenfd, 10);
            //unsigned long ul=1;
            //ioctl(listenfd,FIONBIO,&ul);
            //timer tm;


                //if( (connfd = accept(listenfd, (struct sockaddr*)NULL, NULL)) == -1){

                  //   printf("accept socket error: %s(errno: %d)",strerror(errno),errno);
                    //tm.tv_sec=TIME_OUT_TIME;
                    //if(tm.el)
                   // return "lose";
                    //qDebug()<<"sadasd";
             // }



            //thread t(test,listenfd);
            pthread_t fir;
            pthread_create(&fir,NULL,cli,NULL);
            pthread_detach(fir);
            qDebug()<<connfd;
            connfd = accept(listenfd, (struct sockaddr*)NULL, NULL);

                qDebug()<<connfd;
                //sleep(30);
                //pthread_cancel(fir);
                //return connfd;
                 n = recv(connfd, buff, 4096, 0);

                 buff[6] = '\0';

                 //qDebug()<<"recv msg from client:"<<buff<<"\n";
                 qDebug()<<buff;

                 //exit(0);
               //  if(buff[n] == 'null')
              //   {
                      //close(connfd);
                      //close(listenfd);
              //   break;

                 pthread_cancel(fir);
                 cli2();

          //  }


             //close(listenfd);
             //qDebug()<< "/n"<< "/n"<< "/n"<<buff<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n"<< "/n";
                 //close(listenfd);
                 //class thread x(connect);
                 //x.detach();
             return buff;
         }
    QString Connect::makelisten(){

       // char  buff[4096];
        //class thread x(connect());
        //x.detach();
        char change[4096];
        *buff=*change;
        pthread_t t;
        ::pthread_create(&t,NULL,test,NULL);
        //qDebug()<<"sda";
        pthread_detach(t);
        //pthread_getspecific(t);
        //qDebug()<<"sda";


        return buff;
    }

    QString Connect::re(){
        return buff;
    }
    void Connect::client(int a)
    {
            int   sockfd, n;

            char  recvline[4096];//sendline[4096];
            //*s = *sendline;

            struct sockaddr_in  connectaddr;


       /*if( argc != 2){

            qDebug()<<"usage: ./client <ipaddress>\n";

            return 0;

        }*/
            //return sockfd = socket(AF_INET, SOCK_STREAM, 0);

        if( (sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0){

            //printf("create socket error: %s(errno: %d)\n", strerror(errno),errno);
            qDebug()<<"create socket error: strerror(errno)(errno: errno)\n";
            //return 0;

        }



        memset(&connectaddr, 0, sizeof(connectaddr));

        connectaddr.sin_family = AF_INET;

        connectaddr.sin_port = htons(6666);

       /*if( inet_pton(AF_INET, argv[1], &servaddr.sin_addr) <= 0){

           // printf("inet_pton error for %s\n",argv[1]);
               qDebug()<<"inet_pton error for argv[1]\n";
            return 0;

        }*/
        inet_pton(AF_INET, "192.168.43.40", &connectaddr.sin_addr);



        /*if( connect(sockfd, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0){

            //printf("connect error: %s(errno: %d)\n",strerror(errno),errno);
                qDebug()<<"connect error: strerror(errno)(errno: errno)\n";
            return 0;

        }*/
        //inet_pton(AF_INET, "192.168.43.177", &servaddr.sin_addr);
        //sendline="sdada"
        //qDebug()<<"ddddd";
        ::connect(sockfd, (struct sockaddr*)&connectaddr, sizeof(connectaddr));
        //qDebug()<<"dssd";
    switch(a){
    //shape
    case 0:{
        char sendline[4096]="shape0";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 1:{
        char sendline[4096]="shape1";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 2:{
        char sendline[4096]="shape2";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 3:{
        char sendline[4096]="shape3";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 4:{
        char sendline[4096]="shape4";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 5:{
        char sendline[4096]="shape5";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 6:{
        char sendline[4096]="shape6";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 7:{
        char sendline[4096]="shape7";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 8:{
        char sendline[4096]="shape8";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 9:{
        char sendline[4096]="shape9";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 10:{
        char sendline[4096]="shape10";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 11:{
        char sendline[4096]="shape11";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 12:{
        char sendline[4096]="shape12";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 13:{
        char sendline[4096]="shape13";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 14:{
        char sendline[4096]="shape14";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 15:{
        char sendline[4096]="shape15";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 16:{
        char sendline[4096]="shape16";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 17:{
        char sendline[4096]="shape17";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
    case 18:{
        char sendline[4096]="shape18";
        send(sockfd, sendline, strlen(sendline), 0);
    break;
    }
        //operation:
        case 19:{
            char sendline[4096]="left";
            send(sockfd, sendline, strlen(sendline), 0);
        break;
        }
        case 20:{
            char sendline[4096]="right";
            send(sockfd, sendline, strlen(sendline), 0);
        break;
        }
        case 21:{
            char sendline[4096]="change";
            send(sockfd, sendline, strlen(sendline), 0);
        break;
        }
        case 22:{
            char sendline[4096]="down";
            send(sockfd, sendline, strlen(sendline), 0);
        break;
        }

    }
       // printf("send msg to server: \n");
        qDebug()<<"send msg to server:\n";
        //fgets(sendline, 4096, stdin);

       /*if( send(sockfd, sendline, strlen(sendline), 0) < 0){

            //printf("send msg error: %s(errno: %d)\n", strerror(errno), errno);
            qDebug()<<"send msg error: strerror(errno)(errno: errno)\n";
            return 0;

        }*/

        close(sockfd);

        //return 0;

    }

