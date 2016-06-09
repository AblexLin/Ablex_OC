<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> //html语法介绍的网站
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">//设置utf8字符集，主要目的是能够支撑中文
            <title>html文件分为头和主体，这是头里面的标题，也就是网页上显示的标题</title>
    </head>
    <body>

        WEB知识了解
        1.首先需要开启web服务，在终端执行sudo apachectl start
        2.在safari里输入https://localhost https://127.0.0.1 https://192.168.0.102都可以，最后一个是本机ip
        3.访问都是默认端口80的
        4.进入/路径，里面找到资源库文件夹，里面有个document里面的webserver的文件夹，里面的文件就是网页反馈回来的内容
        5.静态页面 htm html
        6.服务器动态页面种类有asp aspx jsp php主要是这几种

        //空格使用
        &nbsp;&nbsp;&nbsp;&nbsp;

        //表示换行
        <br>

        //超链接
        <a href='b.html'>超链接 </a>

        //字体的修改
        <font size='5' color='red'>字体颜色和大小修改</font>

        //图标必须是和文件在相同的路径下的
        <img src='Music@2x.png' width='30' height='30'>

        //创建表格，tr是行td是列
        <table border='1' align='center'>
            <tr>
                <td>1111</td><td>2222</td><td>3333</td>
            </tr>
            <tr>
                <td>4444</td><td>5555</td><td>6666</td>
            </tr>
            <tr>
                <td>9999</td><td>8888</td><td>7777</td>
            </tr>
        </table>

        //输入类型，根据不同的type显示不同的类型，默认是text类型的，也就是输入框
        <input Type='text'><input Type='button' value='确认' onclick='ontap();'><input Type='radio'>男<input Type='checkbox'>女
                
    </body>
</html>
//通过javascript来实现静态页面的按钮点击事件
<script>
    function ontap()
    {
        alert("hello");             //显示一个界面的弹框
         document.write("wocao");   //显示文字
    }
</script>

//数据库的操作，下面这段其实是个单独的文件了，为了区分上面的，这里就直接这样写了

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <title>No Waiting</title>
    </head>
    
    <body>
        使用php流程详述
        1.首先进入/etc的目录下找到apache2文件夹找到里面的httpd.conf文件并拷贝到桌面使用xcode打开，修改加载模块来执行php
        2.找到#LoadModule php5_module libexec/apache2/libphp5.so这行，把#去掉，#是注释的意思然后保存替换到/etc/apache2目录下面会提示输入appid，输入即可替换
        3.替换后还需要重启apachectl服务，在终端输入sudo apachectl stop停止进程，然后sudo apachectl start再打开，然后重启浏览器，并使用localhost进入到对应的php文件
        4.通过文本编辑文件新建一个html文件并修改后缀名称为php，然后在浏览器测试，看看那些自动生成的字符集代码会不会显示在网页上，显示就说明前三步操作失败，确认后再试
        5.注意上面的操作的php或者html文件都需要放到系统80端口调用的目录，也就是/资源库/webserver/目录下面某个文件夹或者这个目录下。
        6.上面的操作是为了可以使用php模块，php和html的主要区别就是php打开后会显示运算后的数据，是否运算的标志就是下面的<? ?>这个代码内部的代码
        7.下面是数据库的增删改查实现，想要使用数据库还需要安装三个东西分别为，mysql软件，mysql软件里面包含的一个mysql.prefpane文件，navicatmysql软件
        8.确保上方三个软件正常安装，mysql.prefpane安装后会在系统偏好设置的最下面出现一个mysql服务的开启，只有开启后才能访问数据库，下面的代码才是有效的
        下面列出数据库操作的几个函数，重点记忆
        1.$connect=mysql_connect("","","");              //三个参数分别为本机ip，用户名，密码，这里用户名和密码是指代的mysql的那个自己可以通过queries修改的，这是链接数据库，返回的是真或者假
        2.$result=mysql_select_db("gmx",$connect);       //mysql中有很多数据库，选择某个数据库，从某个链接中
        3.$result=mysql_query($sql);                     //运行数据库语句，返回真或者假，查找数据的时候，返回的是表格
        4.$resultRowCount=mysql_num_rows($resultIsTable);//获取运行数据库语句后得到的表格的行数
        5.$row=mysql_fetch_assoc($resultIsTable)         //获取运行数据库语句后得到的表格的行内容
        6.$result=mysql_close($connect);                 //关闭数据库
        其他常用函数:echo表示输出 if和c中相同 $a表示定义变量a
        <?
        //链接数据库
        $connect=mysql_connect("127.0.0.1","root","475261");//这里的密码可以通过queries在mysql软件里设置，其实就是数据库打开的密码
        if(!$connect){
        echo "链接数据库失败";
        }
        //打开数据库通过一个链接
        $result=mysql_select_db("gmx",$connect);
        if(!$result){
        echo "打开数据库失败！";
        }
        //插入数据
        $sql="insert into t_user (uname,upass) values(1111,3333)";
        $result=mysql_query($sql);//运行数据库语句
        if(!$result){
        $result=mysql_close($connect);
        echo "插入sql失败！";
        }
        //修改数据
        $sql="update t_user set upass=232323 where uname=1111";
        $result=mysql_query($sql);
        if(!$result){
        $result=mysql_close($connect);
        echo "修改sql失败！";
        }
        //删除数据
        $sql="delete from t_user where uname=1111";
        $result=mysql_query($sql);
        if(!$result){
        $result=mysql_close($connect);
        echo "删除sql失败！";
        }
        //查找数据
        $sql="select * from t_user";
        $resultIsTable=mysql_query($sql);
        if(!$result){
        $result=mysql_close($connect);
        echo "查找数据库失败！";
        }
        $resultRowCount=mysql_num_rows($resultIsTable);
        if($resultRowCount>0){
        echo $resultRowCount;
        while ($row=mysql_fetch_assoc($resultIsTable)){
        $uname=$row["uname"];
        $upass=$row["upass"];
        echo $uname;
        echo $upass;
        }
        }
        else{
        $result=mysql_close($connect);
        echo "返回表格的行数小于0";
        }
        
        //关闭数据库
        $result=mysql_close($connect);
        if(!$result){
        echo "关闭数据库失败";
        }
        ?>
        
    </body>
    
</html>

//这也是个单独的文件，为了区分也为了归纳总结所以放在一个文件里
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <title>No Waiting</title>
    </head>
    <body>
        <center>No Waiting For Everything!<center>          //在中间设置一行字
            <hr>                                            //加一个横线
            <form action='nowaiting.php' method='get'>      //调用php动态网页
                <table border='1'>
                    <tr><td>账号</td><td><input Type='text'></td></tr>
                    <tr><td>密码</td><td><input Type='text'></td></tr>
                    <tr><td><input Type='submit' value='登录'></td><td><input Type='submit' value='注册'></td></tr>
                </table>
            </form>//调用结束标志
    </body>
</html>
