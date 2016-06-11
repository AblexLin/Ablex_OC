<?
$uname=trim($_POST['uname']);//只能剔除两端的空格
$upass=trim($_POST['upass']);
$action=trim($_POST['action']);
if($uname=="" || $upass==""){
    die("error");
}
//第一步链接数据库
$connect=mysql_connect("127.0.0.1","root","475261");
if(!$connect){
    die("error!");
}
//第二步指定需要使用的数据库
$result=mysql_select_db("gmx",$connect);
if(!$result){
    mysql_close($connect);
    die("error!");
}
$setCharacter="set names utf8";
mysql_query($setCharacter);
if($action=="login"){
    $sql="select * from t_user where uname='".$uname."' and upass='".$upass."' ";
    $result=mysql_query($sql);
    if(!$result){
        mysql_close($connect);
        die("exists!");
    }
    $rowCount=mysql_num_rows($result);
    if($rowCount>0){
        echo "success!";
    }
    else{
        die("error");
    }
}
else if($action=="register"){
    $sql="select * from t_user where uname='".$uname."'";
    $result=mysql_query($sql);
    if(!$result){
        mysql_close($connect);
        die("error!");
    }
    $rowCount=mysql_num_rows($result);
    if($rowCount>0){
        die("exists!");
    }
    else{
        //插入数据
        $sql="insert into t_user (uname,upass) values('".$uname."','".$upass."')";
        $result=mysql_query($sql);
        if(!$result){
            mysql_close($connect);
            die("error!");
        }
        else{
            echo "success!";
        }
    }
    
}
//最后一步关闭数据库
$result=mysql_close($connect);
if(!$result){
    die("error!");
}
?>