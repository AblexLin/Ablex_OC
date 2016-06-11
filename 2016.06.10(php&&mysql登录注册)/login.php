<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>php版登陆注册界面</title>
</head>
<body>

<?
//这里是重点
$uname=$_POST['uname'];//获取静态页面传递来的账号数据
$upass=$_POST['upass'];//获取静态页面传递来的密码数据
$uname=trim($uname);   //去除账号里面的空格
$upass=trim($upass);   //去除密码里面的空格

//如果账号或者密码有一个为空那么直接结束
if($uname=="" || $upass==""){
    die("用户名或者密码为空！");
}
//打开数据库第一步连接数据库
$connect=mysql_connect("127.0.0.1","root","475261");
if(!$connect){
    die("数据库连接失败！");
}

//连接成功以后就要选择打开的是哪一个数据库
$result=mysql_select_db("gmx",$connect);
if(!$result){
    mysql_close($connect);
    die("指定数据库失败！");
}

////判断点击的是登录还是注册
$action=$_POST['action'];
if($action=="登录"){
    $sql="select * from t_user where uname='".$uname."' and upass='".$upass."'";//固定格式用来替换获取到的变量
    //运行定义好的sqlite代码
    $result=mysql_query($sql);
    if(!$result){
        mysql_close($connect);
        die("登录查找sql失败！");
    }
    //查看返回的表格中有多少行
    $count=mysql_num_rows($result);
    if($count>0){
        echo "登录成功";
    }
    else{
        mysql_close($connect);
        die("账号或者密码错误，请 <a href='index.html'>重试</a>");
    }

}
else if($action=="注册"){

    //指定好数据库以后就查询数据库，看看里面有没有现在输入的用户名
    $sql="select * from t_user where uname='".$uname."'";//固定格式用来替换获取到的变量
    //运行定义好的sqlite代码
    $result=mysql_query($sql);
    //判断运行是否成功
    if(!$result){
        mysql_close($connect);
        die("注册查找sql失败！");
    }
    else{
        $rowscount=mysql_num_rows($result);//获取表格里所有的行数，来确定是不是存在这个用户
        if($rowscount>0){
            mysql_close($connect);
            die("已经存在的账号请重新输入！<a href='index.html'> 返回</a>"); //加入超链接返回按钮
        }
        else{
            //插入数据
            $sql="insert into t_user (uname,upass) values('".$uname."','".$upass."')";
            $result=mysql_query($sql);
            if(!$result){
                die("插入数据库失败");
            }
            else{
                echo "注册成功，您可以使用这个账号登录了<a href='index.html'>登录</a>";
            }
        }
    }
    
}
else{
    die('ERROR');
}
//关闭数据库
$result=mysql_close($connect);
if(!$result){
    echo shujukuguanbishibai;
}
?>

</body>
</html>