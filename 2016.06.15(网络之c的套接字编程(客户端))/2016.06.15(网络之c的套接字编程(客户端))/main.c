//
//  main.c
//  2016.06.15(网络之c的套接字编程(客户端))
//
//  Created by 顾明轩 on 16/6/15.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <string.h>

//客户端，查看创建的服务器是否ok
int main(int argc, const char * argv[]) {

    //0.创建一个结构用来处理ip的
    struct sockaddr_in server_addr;
    //结构的大小，必须设置这个，第一件就要设置这个
    server_addr.sin_len=sizeof(server_addr);
    //设定地址家族为internet地址家族
    server_addr.sin_family=AF_INET;
    //设置端口号22222，不是固定的，尽量大点
    server_addr.sin_port=htons(22222);
    //设定ip
    server_addr.sin_addr.s_addr=inet_addr("127.0.0.1");
    //设定为0
    bzero(&server_addr.sin_zero, 8);
    
    //1.创建一个套接字
    int server_socket=socket(AF_INET, SOCK_STREAM, 0);//tcp必须接受成功一般用的及时通信 udp是只管发，一般用的语音视频上
    if (server_socket==-1) {
        printf("套接字创建失败！");
        return 1;
    }
    
    char recv_msg[1024];//接受客户端发来的数据字符串
    char send_msg[1024];//要发送给客户端的数据字符串
    //2.链接到服务器
    int result=connect(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr));
    if (result==0) {
        printf("链接服务器成功！");
        while (1) {
            bzero(recv_msg, 1024);//清空字符串
            bzero(send_msg, 1024);//清空字符串
            
            //接受服务器信息
            long bytenum=recv(server_socket, recv_msg, 1024, 0);//接受客户端信息
            printf("服务器发来了%ld字节",bytenum);
            
            recv_msg[bytenum]='\0';
            printf("服务器发来了%s字节",recv_msg);
            
            printf("请输入你想发送给服务器的数据：");
            //从键盘获得需要发给客户端的数据
            scanf("%s",send_msg);
            bytenum=send(server_socket, send_msg, 1024, 0);
            printf("客户端发送了%ld字节",bytenum);
        }
    }
    else{
        printf("链接服务器失败！");
    }
    
    //3.数据的收发
    
    return 0;
}
