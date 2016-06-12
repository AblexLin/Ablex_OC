<?
//第一步链接数据库
$connect=mysql_connect("127.0.0.1","root","475261");
if(!$connect){
    die("error00!");
}
//第二步指定需要使用的数据库
$result=mysql_select_db("gmx",$connect);
if(!$result){
    mysql_close($connect);
    die("error1!");
}
//第三步设置字符集
$setCharacter="set names utf8";
mysql_query($setCharacter);

//第四步查找数据库
$sql="select * from t_user";
$result=mysql_query($sql);
while($row=mysql_fetch_assoc($result)){
    $arr[]=$row;
}
echo json_encode($arr);


//最后一步关闭数据库
$result=mysql_close($connect);
if(!$result){
    die("error5!");
}
?>