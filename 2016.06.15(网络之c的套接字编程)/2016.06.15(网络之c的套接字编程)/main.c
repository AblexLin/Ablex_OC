//
//  main.c
//  2016.06.15(网络之c的套接字编程)
//
//  Created by 顾明轩 on 16/6/15.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#include <stdio.h>

//原来这就是网络编程的套接字，socket啊尼玛啊。。
#include <sys/socket.h>
//internet相关的函数和数据
#include <arpa/inet.h>//arpa是internet最初的形式，
#include <string.h>


//这是服务器端需要做的编程，对应的还有客户端的，要了解流程，记忆很困难
int main(int argc, const char * argv[]) {
    //要熟悉，记忆是记不住的
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
    
    //1.创建一个服务器套接字，套接字就是一种简化网络编程的方式
    //第一个参数地址族，第二个参数是协议，tcp可靠协议或者udp不可靠协议，第三个参数是0
    int server_socket=socket(AF_INET, SOCK_STREAM, 0);//tcp必须接受成功一般用的及时通信 udp是只管发，一般用的语音视频上
    if (server_socket==-1) {
        printf("套接字创建失败！");
        return 1;
    }
    
    //2.套接字绑定到某个ip和port上
    int result=bind(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr));
    if (result==-1) {
        printf("套接字绑定失败！");
        //close(server_socket);//特殊情况才关闭服务器
        return 1;
    }
    
    //3.开始监听(等待连接进来),5表示能够排队的链接个数
    if (listen(server_socket, 5)==-1) {
        printf("套接字监听失败！");
        //close(server_socket);//特殊情况才关闭服务器
        return 1;
    }
    
    //4.得到客户端链接套接字
    struct sockaddr_in client_addr;//客户端地址
    socklen_t addr_len;
    //这里会是等待状态，只有有链接的时候才会往下走
    int client_socket=accept(server_socket, (struct sockaddr *)&client_addr, &addr_len);
    if (client_socket==-1) {
        //close(server_socket);//特殊情况才关闭服务器
        printf("客户端链接失败");
        return 1;
    }
    printf("有链接进来了");
    
    //5.传送数据
    char recv_msg[1024];//接受客户端发来的数据字符串
    char send_msg[1024];//要发送给客户端的数据字符串
    while (1) {
        bzero(recv_msg, 1024);//清空字符串
        bzero(send_msg, 1024);//清空字符串
        printf("请输入你想发送给客户端的数据：");
        scanf("%s",send_msg); //从键盘获得需要发给客户端的数据
        long bytenum=send(client_socket, send_msg, 1024, 0);//把信息发给客户端
        printf("服务器发送了%ld字节",bytenum);
        bytenum=recv(client_socket, recv_msg, 1024, 0);//接受客户端信息
        printf("客户端发来了%ld字节",bytenum);
        
        recv_msg[bytenum]='\0';
        printf("客户端发来了%s字节",recv_msg);
    }
    
    //6.套接字关闭
    //close(server_socket);//特殊情况才关闭服务器
    
    return 0;
}
