1.文本框焦点问题 onBlur:当失去输入焦点后产生该事件
onFocus:当输入获得焦点后，产生该文件 Onchange:当文字值改变时，产生该事件
Onselect:当文字加亮后，产生该文件

<input type="text" value="mm" onfocus="if(value=='mm) {value=''}"
	onblur="if
(value=='') {value='mm'}">
点击时文字消失，失去焦点时文字再出现 2.网页按钮的特殊颜色
<input type=button name="Submit1" value="郭强" size=10 class=s02
	style="background-color: rgb(235, 207, 22)">

3.鼠标移入移出时颜色变化
<input type="submit" value="找吧" name="B1" onMouseOut=this.style.color=
	"blue"

onMouseOver=this.style.color= "red"  class="button">

4.平面按钮
<input type=submit value=订阅
	style="border: 1px solid:#666666; height: 17px; width: 25pt; font-size: 9pt; BACKGROUND-COLOR: #E8E8FF; color: #666666"
	name="submit">

5.按钮颜色变化
<input type=text name="nick"
	style="border: 1px solid #666666; font-size: 9pt; height: 17px; BACKGROUND-COLOR: #F4F4FF; color: #ff6600"
	size="15" maxlength="16">

6.平面输入框
<input type="text" name="T1" size="20"
	style="border-style: solid; border-width: 1">

7.使窗口变成指定的大小
<script>
window.resizeTo(300,283);
</script>

8.使文字上下滚动
<marquee direction=up scrollamount=1 scrolldelay=100
	onmouseover='this.stop()' onmouseout='this.start()' height=60>
	<!-- head_scrolltext -->
	<tr>
		<td>共和国
			</table> <!-- end head_scrolltext -->
</marquee>

9.状态栏显示该页状态
<base
	onmouseover="window.status='网站建设 http://www.webmake.cn/' ;return true">

10.可以点击文字实现radio选项的选定
<br>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="regtype" value="A03" id="A03">
<label for="A03"> 情侣 : 一次注册两个帐户</label>
<br>

11.可以在文字域的font写onclick事件 12.打印
</a>
打印网页
<a href='javascript:window.print ()'> 13.线型输入框 <input
	type="text" name="key" size="12" value="关键字" onFocus=this.select()
	onMouseOver=this.focus() class="line"> 14.显示文档最后修改日期
	<script language=javascript>
function hi(str)
{
 document.write(document.lastModified)

 alert("hi"+str+"!")
}
</script> 15.可以在鼠标移到文字上时就触发事件
	<html>
<head>
<script language="LiveScript">
<!-- Hiding
     function hello() {
       alert("哈罗!");
     }
</script>
</head>
<body>
	<a href="" onMouseOver="hello()">link</a>
</body>
	</html> 16.可以根据网页上的选项来确定页面颜色
	<HTML>
<HEAD>
<TITLE>background.html</TITLE>
</HEAD>
<SCRIPT>
<!--

function bgChange(selObj) {
 newColor = selObj.options[selObj.selectedIndex].text;
 document.bgColor = newColor;
 selObj.selectedIndex = -1;
 }

//-->
</SCRIPT>
<BODY STYLE="font-family: Arial">
	<B>Changing Background Colors</B>
	<BR>
	<FORM>
		<SELECT SIZE="8" onChange="bgChange(this);">
			<OPTION>Red
			<OPTION>Orange
			<OPTION>Yellow
			<OPTION>Green
			<OPTION>Blue
			<OPTION>Indigo
			<OPTION>Violet
			<OPTION>White
			<OPTION>pink
		</SELECT>
	</FORM>
</BODY>
	</HTML> 17.将按钮的特征改变
	<style type="text/css">
<!--
.style1 {
	font-size: 12px;
	background: #CCCCFF;
	border-width: thin thin thin thin;
	border-color: #CCCCFF #CCCCCC #CCCCCC #CCCCFF
}

.style2 {
	font-size: 12px;
	font-weight: bold;
	background: #CCFFCC;
	border-width: thin medium medium thin;
	border-color: #CCFF99 #999999 #999999 #CCFF99
}
-->
</style> 　　本例按钮的代码如下： <input type="submit" name="Submit"
	value="提 交" onmouseover="this.className='style2'"
	onmouseout="this.className='style1'" class="style1">

	18.改变按钮的图片.
	<style type="text/css">
<!--
.style3 {
	font-size: 12px;
	background: url(image/buttonbg1.gif);
	border: 0px;
	width: 60px;
	height: 22px
}

.style4 {
	font-size: 12px;
	font-weight: bold;
	background: url(image/buttonbg2.gif);
	border: 0px 0;
	width: 60px;
	height: 22px
}
-->
</style> 　　本例的按钮代码如下： <input type="submit" name="Submit2"
	value="提 交" onmouseover="this.className='style4'"
	onmouseout="this.className='style3'" class="style3">

	19.打印页面
	<div align="center">
		<a class=content href="javascript:doPrint();">打印本稿</a>
	</div> 20.可以直接写html语言 document.write(""); 21.改变下拉框的颜色 <select
	name="classid"
	onChange="changelocation(document.myform.classid.options[document.myform.classid.selectedIndex].value)"
	size="1" style="color: #008080; font-size: 9pt">

		22.转至目标URL window.location="http://guoguo" 23.传递该object的form
		UpdateSN('guoqiang99267',this.form) function
		UpdateSN(strValue,strForm) { strForm.SignInName.value = strValue;
		return false; } 24.文字标签
		<label for="AltName4"><input name="AltName" type="RADIO"
			tabindex="931" id="AltName4">guoqiang99859</label>

		25.layer2为组件的ID，可以控制组件是否可见
		document.all.item('Layer2').style.display = "block";
		document.all.item('Layer2').style.display = "none";//

		26.将页面加入favorite中
		<script language=javascript>
<!--
function Addme(){
url = "http://your.site.address"; //你自己的主页地址
title = "Your Site Name"; //你自己的主页名称
window.external.AddFavorite(url,title);
-->
</script>// 27.过10秒自动关闭页面 < script language="JavaScript" > function
		closeit() { setTimeout("self.close()"，10000) } < /script >

		28.可以比较字符的大小 char=post.charAt(i); if(!('0'<=char&&char<='9'))

		29.将字符转化为数字 month = parseInt(char)

		30.点击value非空的选项时转向指定连接
		<select onchange='if(this.value!="")window.open(this.value)'
		class="textinput">
			<option selected>主办单位</option>
			<option>-----------------</option>
			<option value="http://www.bjd.com.cn/">北京日报</option>
			<option value="http://www.ben.com.cn/">北京晚报</option>
	</select> 31.改变背景颜色
		<td width=* class=dp bgColor=#FAFBFC
		onmouseover="this.bgColor='#FFFFFF';"
		onmouseout="this.bgColor='#FAFBFC';">32.改变文字输入框的背景颜色
			<style>
.input2 {
	background-image: url('../images/inputbg.gif');
	font-size: 12px;
	background-color: #D0DABB;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px
}
</style> <input name=content type=text size="47" class="input2" maxlength="50">

			33.改变水平线的特征
			<hr size="0" noshade color="#C0C0C0"> 34.传递参数的方式 <a
			href="vote.asp?CurPage=8&id=3488">8</a> 35.页内跳转 <a href="#1">1</a>
			<a href="#2">2</a> <a href="#3">3</a> <a href="#4">4</a> <a href="#5">5</a>
			<a href="#6">6</a> <a href="#7">7</a> <a name="1">dfdf</a> <a
			name="2">dfdf</a>// 36.两个按键一起按下 if(event.ctrlKey &&
			window.event.keyCode==13)// 37.刷新页面
			javascript:this.location.reload()// 38.将网页的按钮使能 <SCRIPT
				LANGUAGE="JavaScript">
function haha()
{
 for(var i=0;i<document.form1.elements.length;i++)
 {
  if(document.form1.elements[i].name.indexOf("bb")!=-1)
   document.form1.elements[i].disabled=!document.form1.elements[i].disabled;
 }
}
</SCRIPT>
			<BODY>
				<form name=form1>
					<INPUT TYPE="button" NAME="aa " value=cindy onclick=haha()>
					<INPUT TYPE="button" NAME="bb " value=guoguo> <INPUT
						TYPE="button" NAME="bb " value=guoguo> 39.文字移动
					<marquee scrollamount=3 onmouseover=this.stop();
						onmouseout=this.start();>

						40.双击网页自动跑
						<SCRIPT LANGUAGE="JavaScript">
var currentpos,timer;
function initialize()
{
 timer=setInterval("scrollwindow()",1);
}
function sc()
{
 clearInterval(timer);
}
function scrollwindow()
{
 currentpos=document.body.scrollTop;
 window.scroll(0,++currentpos);
 if (currentpos != document.body.scrollTop)
  sc();
}
document.onmousedown=sc
document.ondblclick=initialize
</SCRIPT>
						// 41.后退 <INPUT TYPE="button" onclick=window.history.back()
							value=back> 42.前进 <INPUT TYPE="button"
							onclick=window.history.forward() value=forward> 43.刷新 <INPUT
							TYPE="button" onclick=document.location.reload() value=reload>

						44.转向指定网页
						document.location="http://ww"或者document.location.assign("http://guoguo.com")

						45.在网页上显示实时时间
						<SCRIPT LANGUAGE="JavaScript">
var clock_id;
window.onload=function()
{
 clock_id=setInterval("document.form1.txtclock.value=(new Date);",1000)
}
</SCRIPT>
						// 46.可以下载文件 document.location.href="目标文件"//

						47.连接数据库 import java.sql.*; String
						myDBDriver="sun.jdbc.odbc.JdbcOdbcDriver";
						Class.forName(myDBDriver); Connection
						conn=DriverManager.getConnection("jdbc:odbc:firm","username","password");
						Statement stmt=conn.createStatement(); ResultSet
						rs=stmt.executeQuery(sql); rs.getString("column1");//

						48.可以直接在页面“div”内写下所需内容 <INPUT TYPE="button"
							onclick="a1.innerHTML='<font color=red>*</font>'">
						<div id=a1></div>
						// 49.可以改变页面上的连接的格式，使其为双线
						<style>
A:link {
	text-decoration: none;
	color: #0000FF;
	font-family: 宋体
}

A:visited {
	text-decoration: none;
	color: #0000FF;
	font-family: 宋体
}

A:hover {
	text-decoration: underline overline;
	color: FF0000
}
</style>

						<style>
A:link {
	text-decoration: none;
	color: #0000FF;
	font-family: 宋体
}

A:visited {
	text-decoration: none;
	color: #0000FF;
	font-family: 宋体
}

A:hover {
	text-decoration: underline overline line-through;
	color: FF0000
}

TH {
	FONT-SIZE: 9pt
}

TD {
	FONT-SIZE: 9pt
}

body {
	SCROLLBAR-FACE-COLOR: #A9D46D;
	SCROLLBAR-HIGHLIGHT-COLOR: #e7e7e7;
	SCROLLBAR-SHADOW-COLOR: #e7e7e7;
	SCROLLBAR-3DLIGHT-COLOR: #000000;
	LINE-HEIGHT: 15pt;
	SCROLLBAR-ARROW-COLOR: #ffffff;
	SCROLLBAR-TRACK-COLOR: #e7e7e7;
}

INPUT {
	BORDER-TOP-WIDTH: 1px;
	PADDING-RIGHT: 1px;
	PADDING-LEFT: 1px;
	BORDER-LEFT-WIDTH: 1px;
	FONT-SIZE: 9pt;
	BORDER-LEFT-COLOR: #cccccc;
	BORDER-BOTTOM-WIDTH: 1px;
	BORDER-BOTTOM-COLOR: #cccccc;
	PADDING-BOTTOM: 1px;
	BORDER-TOP-COLOR: #cccccc;
	PADDING-TOP: 1px;
	HEIGHT: 18px;
	BORDER-RIGHT-WIDTH: 1px;
	BORDER-RIGHT-COLOR: #cccccc
}

DIV, form, OPTION, P, TD, BR {
	FONT-FAMILY: 宋体;
	FONT-SIZE: 9pt
}

textarea, select {
	border-width: 1;
	border-color: #000000;
	background-color: #efefef;
	font-family: 宋体;
	font-size: 9pt;
	font-style: bold;
}

.text {
	font-family: "宋体";
	font-size: 9pt;
	color: #003300;
	border: #006600 solid;
	border-width: 1px 1px 1px 1px
}
</style>
						完整的css 50.新建frame <a
							href="javascript:newframe('http://www.163.net/help/a_little/index.html','http://www.163.net/help/a_little

/a_13.html')"><img
							alt=帮助 border=0
							src="http://bjpic.163.net/images/mail/button-help.gif"></a>


						51.向文件中写内容
						<%@ page import="java.io.*"%>
						<%
 String str = "print me";
 //always give the path from root. This way it almost always works.
 String nameOfTextFile = "/usr/anil/imp.txt";
 try
 {
  PrintWriter pw = new PrintWriter(new FileOutputStream(nameOfTextFile));
  pw.println(str);
  //clean up
  pw.close();
 }
 catch(IOException e)
 {
  out.println(e.getMessage());
 }
%>

						52.先读文件再写文件
						<%@ page language="java"%>
						<%@ page contentType="text/html; charSet=gb2312"%>
						<%@ page import="java.util.*"%>
						<%@ page import="java.lang.*"%>
						<%@ page import="javax.servlet.*"%>
						<%@ page import="javax.servlet.jsp.*"%>
						<%@ page import="javax.servlet.http.*"%>
						<%@ page import="java.io.*"%>
						eryrytry
						<%
 int count=0;
 FileInputStream fi =new FileInputStream ("count.txt");
 ObjectInputStream si= new ObjectInputStream (fi);
 count =si.readInt();
 count++;
 out.print(count);
 si.close();

 FileOutputStream fo =new FileOutputStream ("count.txt");
 ObjectOutputStream so= new ObjectOutputStream (fo);
 so.writeInt(count);
 so.close();
%>

						53.直线型输入框 <INPUT name=Password size=10 type=password
							style="border-left-width: 0; border-right-width: 0; border-top-width: 0; border-bottom-style: solid; border-bottom-width: 1; background-color: #9CEB9C">

						54.可以将背景改为按钮性状，通过改变css改变属性
						<td width="65" align="center" bgcolor="#E0E0E0"
							onmouseover=this.className=
							'mouseoverbt';

onmouseout=this.className='mouseout';><a
							href="tm.asp?classid=76"><font color="#000000">录音笔</font></a></td>
						<style>
.mouseoverbt {
	background-image: url(http://www.yongle.com.cn/img/btbgw64h20y.gif);
	background-repeat: no-repeat;
}

.mouseout {
	background-color: #E0E0E0;
}
</style>

						55.同时按下CTRL和Q键 document.onkeydown=function() {
						if(event.ctrlKey&&event.keyCode==81) {alert(1)} }//

						56.以下是一个完整的显示hint的代码，其思想是当鼠标停留是将div中的内容显示在鼠标出，当鼠标移出后在将该div隐

						藏掉
						---------------------------------------------------------------------------------------------------------

						------------
						<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
						<HTML>
<style>
#hint {
	width: 198px;
	border: 1px solid #000000;
	background: #99ff33;
	position: absolute;
	z-index: 9;
	padding: 6px;
	line-height: 17px;
	text-align: left;
	top: 1520px;
}
</style>
<SCRIPT LANGUAGE="JavaScript">
<!--
function showme()
{
 var oSon=window.document.getElementById("hint");
 if (oSon==null) return;
 with (oSon)
 {
  innerText=guoguo.value;
  style.display="block";
  style.pixelLeft=window.event.clientX+window.document.body.scrollLeft+6;
  style.pixelTop=window.event.clientY+window.document.body.scrollTop+9;
 }
}
function hidme()
{
 var oSon=window.document.getElementById("hint");
 if (oSon==null) return;
 oSon.style.display="none";
}
//-->
</SCRIPT>
<BODY>
	<text id=guoguo value=ga> <a href=# onmouseover=showme()
		onmouseout=hidme() onmousemove=showme() son=hint>dfdfd</a>
	<div id=hint style="display: none"></div>
</BODY>
						</HTML>
						---------------------------------------------------------------------------------------------------------

						------------ 57.弹出窗口 方法一：
						<body onload="openwen()">浏览器读页面时弹出窗口； 方法二：
						<body onunload="openwen()">
							浏览器离开页面时弹出窗口； 方法三：用一个连接调用：
							<a href="#" onclick="openwin()">打开一个窗口</a>
							注意：使用的"#"是虚连接。 方法四：用一个按钮调用：
							<input type="button" onclick="openwin()" value="打开窗口">
							何时装载script 58.动态改变字体的大小 function doZoom(size) {
							document.getElementById('zoom').style.fontSize=size+'px' }

							function aa() { var newWin=window.open(url);
							newWin.document.form1.text1.value=value1; }改变弹出窗口上域的属性
							opener.document.form2.text2.value=value2;改变父窗口的域的值

							59.判断是何种浏览器 var name = navigator.appName; if (name ==
							"Microsoft Internet Explorer") alert("IE"); else if (name ==
							"Netscape") alert("NS");// 60.vbsscript确定框
							<script language="VBScript">
<!--
MsgBox "确定删除吗？", 4
//-->
</script>
							// 61.复制内容到剪切板 function JM_cc(bb) { var
							ob=eval("document.form1."+bb); ob.select();
							js=ob.createTextRange(); js.execCommand("Copy"); }//

							62.java中建立数据库连接取数据 public void init() { String
							url="jdbc:odbc:javadata"; try {
							Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); Connection
							con=DriverManager.getConnection(url,"sa","");//mssql database
							user SA and password DatabaseMetaData dma=con.getMetaData();
							System.out.println("Connect to"+dma.getURL());
							System.out.println(";Driver "+dma.getDriverName());
							System.out.println(";Version "+dma.getDriverVersion());
							System.out.println(""); Statement stmt=con.createStatement();
							ResultSet rs=stmt.executeQuery("select * from company.dbo.TB_NAME
							where number=1");//Sql rs.next(); String
							dispresult=rs.getString("name");
							System.out.println(dispresult);// Instead,you can display it in
							Paint() or use AWT etc. rs.close(); stmt.close(); con.close(); }
							catch(SQLException ex) { System.out.println("!!!SQL Exception
							!!!"); while(ex!=null) {
							System.out.println("SQLState:"+ex.getSQLState());
							System.out.println("Message:"+ex.getMessage());
							System.out.println("Vendor:"+ex.getErrorCode());
							ex=ex.getNextException(); System.out.println(""); } }
							catch(java.lang.Exception ex) { ex.printStackTrace(); } }//


							63.最小化窗口 window.blur()// 64.文档的路径 document.URL//

							65.定时执行某段程序 setTimeout("change_color()",600);

							66.设置为主页 function makeHome(){
							netscape.security.PrivilegeManager.enablePrivilege("UniversalPreferencesWrite");
							navigator.preference("browser.startup.homepage", location.href);
							}// 67.设置为收藏 function addFav(){ if(ie)
							window.external.AddFavorite(location.href,'WWW.OGRISH.COM :
							GROTESQUE MOVIES AND PICTURES'); if(ns) alert("Thanks for the
							bookmark!\n\nNetscape users click OK then press CTRL-D"); }//

							68.判断cookie是否可用 navigator.cookieEnabled;//

							69.显示有模式的有页面的弹出窗口 function setbgcolor_onclick() {
							var color =
							showModalDialog("/mailpage/compose/colorsel.html",0,"help=0"); if
							(color != null) { document.compose.bgcolor.value = color; } }//


							70.截取小数点后两位 var a=3454545.4454545; alert(a.toFixed(2));//


							71.禁止选择页面上的文字来拷贝
							<script>
function noEffect() {
  with (event) {
  returnValue = false;
  cancelBubble = true;
  }
  return;
}
</script>
						<body onselectstart="noEffect()" oncontextmenu="noEffect()">
							// 72.屏蔽右键菜单 oncontextmenu="event.returnValue = false"//

							73.事件禁止起泡 event.cancelBubble = true//

							74.禁止在输入框打开输入法
							<input style="ime-mode: disabled">// 75.屏蔽汉字和空格
							<input name="txt">
							<input type="submit"
								onClick="alert(!/[^ -}]|\s/.test(txt.value))">//

							76.用javascript判断文件是否存在 function Exists(filespec) { if
							(filespec) { var fso; fso = new
							ActiveXObject("Scripting.FileSystemObject");
							alert(fso.FileExists(filespec)); } } 选择图片
							<input type=file name=f1>
							<p>
								<input type="submit" onClick="Exists(f1.value)">//

								77.获得当前的文本框选中的文字 <input
									onmouseup="alert(document.selection.createRange().text)"
									value=123>// 78.跳转至目标页面，同时不可返回 <a
									href="javascript:location.replace('http://www.sohu.com/')">sohu.com</a>//


								79.获得当前的行是表格的第几行
								<script>
function getrow(obj)
{
  if(event.srcElement.tagName=="TD"){
  curRow=event.srcElement.parentElement;
  alert("这是第"+(curRow.rowIndex+1)+"行");

  }
}
</script>
							<table border="1" width="100%" onclick=getrow(this)>
								<tr>
									<td width="20%">　</td>
									<td width="20%">　</td>
									<td width="20%">　</td>
									<td width="20%">　</td>
									<td width="20%">　</td>
								</tr>
								<tr>
									<td width="20%">　</td>
									<td width="20%">　</td>
									<td width="20%">　</td>
									<td width="20%">　</td>
									<td width="20%">　</td>
								</tr>
							</table>
							// 80.删除表格某行，xx表示某行，下标从0开始计算
							document.all.myTable.deleteRow(xx)// 81.动态的向表格中添加行
							<table id="t1" border="1">
							</table>
							<script language="JavaScript">
function add()
{
  t1.insertRow().insertCell().innerHTML = '<input name="test'+t1.rows.length+'">';
}//


82.event.x,event.clientX,event.offsetX区别：
x:设置或者是得到鼠标相对于目标事件的父元素的外边界在x坐标上的位置。 clientX:相对于客户区域的x坐标位置，不

包括滚动条，就是正文区域。 offsetx：设置或者是得到鼠标相对于目标事件的父元素的内边界在x坐标上的位置。
screenX:相对于用户屏幕。

 
83.显示是鼠标按钮的哪个
<body onMouseDown="alert(event.button)">点Mouse看看//

84.打开C盘
<form action="file:///c|/"><input type="submit" value="c:\ drive"></form>//
 
85.当前屏幕的分辨率
screen.width、screen.height//

86.设置表格中的内容
tbl.rows[0].cells[1].innerText=document.form.text1.value;//

 
87.本地快捷键
<p><a href="file:///::{208D2C60-3AEA-1069-A2D7-08002B30309D}" target="_blank">网上邻居</a></p>
<p><a href="file:///::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\d:\web" target="_blank">我的电脑</a></p>
<p><a href="file:///::{450D8FBA-AD25-11D0-98A8-0800361B1103}" target="_blank">我的文档</a></p>
<p><a href="file:///::{645FF040-5081-101B-9F08-00AA002F954E}" target="_blank">回收站</a></p>
<p><a href="file:///::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\::{21EC2020-3AEA-1069-A2DD-08002B30309D}"

target="_blank">控制面板</a></p>
<p><a href="file:///::{7007ACC7-3202-11D1-AAD2-00805FC1270E}">拨号网络</a>(windows 2000)</p>

 
88.IE菜单
<button onclick="min.Click()"><font face="webdings">0</font></button>//改变按钮上的图片
<input type=button  onclick="document.execCommand('CreateLink','true','true')"> //创建新连接
<input type=button  onclick="document.execCommand('print','true','true')"> //打印
<input type=button  onclick="document.execCommand('saveas','true','网站制作.htm')">//另存为htm
<input type=button  onclick="document.execCommand('saveas','true','网站制作.txt')">//另存为txt
document.execCommand("SaveAs")//保存为
document.execCommand('undo')//撤销上一次操作

89.web对话框
<SCRIPT>
var contents='<style>body,td{font:menu}img{cursor:hand}</style>';
contents+='<title>你要关闭我吗</title>';
contents+='<body bgcolor=menu>';
contents+='<table width=100% height=100% border=0>';
contents+='<tr><td align=center>';
contents+='你要关闭我吗？<br>';
contents+='<img src=dark.gif onclick=self.close() alt="...关闭">';
contents+='<img src=jet.gif onclick=self.close() alt="全是关闭">';
contents+='</td></tr></table>';
showModalDialog("about:"+contents+"","","dialogHeight:50px;dialogWidth:250px;help:no;status:no")
document.write(contents);
</SCRIPT>
							// 90.取第x,y的值
							<button onclick="t1.rows[x].cells[y].innerText='guoguo'"></button>
							// 91.向新打开的网页上写内容
							newwin=window.open('about:blank','','top=10');
							newwin.document.write('');// 93.返回 javascript:history.go(-2);//

							94.将页面上选中的内容复制到剪贴板 abcdefg
							<input type='button'
								onclick="window.clipboardData.setData('text',document.selection.createRange().text);"
								value='复制页面选中

的字符'>//
							95.将页面上选中的内容复制到剪贴板
							<INPUT TYPE="text" NAME="">kjhkjhkhkj
							<INPUT TYPE="button"
								onclick="document.execCommand('Copy', 'false',

null);">////

							96.鼠标移到下拉框时自动全部打开
							<select onmouseover="javascript:this.size=this.length"
								onmouseout="javascript:this.size=1"></select>//

							97.获得本机的文件 var fso = new
							ActiveXObject("Scripting.FileSystemObject"); var f1 =
							fso.GetFile("C:\\bsitcdata\\ejbhome.xml"); alert("File last
							modified: " + f1.DateLastModified); //

							98.判断客户端是否是IE浏览器 因为 document.all 是 IE
							的特有属性，所以通常用这个方法来判断客户端是否是IE浏览器
							,document.all?1:0; 99.创建新的下拉框选项 new
							Option(text,value)这样的函数// 100.在页面上画柱状图
							<STYLE>
td {
	font-size: 12px
}

body {
	font-size: 12px
}

v\:* {
	behavior: url(#default#VML);
}
//
这里声明了v作为VML公用变量
</STYLE>
							<SCRIPT LANGUAGE="JavaScript">
mathstr=12;
document.write ("<v:rect fillcolor='red'

style='width:20;color:navy;height:"+5000/(1000/mathstr)+"'><br>&nbsp;%"+mathstr+"<br>4人<v:Extrusion

backdepth='15pt' on='true'/></v:rect>")
</SCRIPT>
							<v:rect fillcolor='red' style='width:20;color:navy;height:200'>
								<br>%12<br>4人<v:Extrusion backdepth='15pt' on='true' />
							</v:rect>
							<v:rect fillcolor='yellow' style='width:20;color:navy;height:100'>
								<br>%12<br>4人<v:Extrusion backdepth='15pt' on='true' />
							</v:rect>
							//