1.�ı��򽹵����� onBlur:��ʧȥ���뽹���������¼�
onFocus:�������ý���󣬲������ļ� Onchange:������ֵ�ı�ʱ���������¼�
Onselect:�����ּ����󣬲������ļ�

<input type="text" value="mm" onfocus="if(value=='mm) {value=''}"
	onblur="if
(value=='') {value='mm'}">
���ʱ������ʧ��ʧȥ����ʱ�����ٳ��� 2.��ҳ��ť��������ɫ
<input type=button name="Submit1" value="��ǿ" size=10 class=s02
	style="background-color: rgb(235, 207, 22)">

3.��������Ƴ�ʱ��ɫ�仯
<input type="submit" value="�Ұ�" name="B1" onMouseOut=this.style.color=
	"blue"

onMouseOver=this.style.color= "red"  class="button">

4.ƽ�水ť
<input type=submit value=����
	style="border: 1px solid:#666666; height: 17px; width: 25pt; font-size: 9pt; BACKGROUND-COLOR: #E8E8FF; color: #666666"
	name="submit">

5.��ť��ɫ�仯
<input type=text name="nick"
	style="border: 1px solid #666666; font-size: 9pt; height: 17px; BACKGROUND-COLOR: #F4F4FF; color: #ff6600"
	size="15" maxlength="16">

6.ƽ�������
<input type="text" name="T1" size="20"
	style="border-style: solid; border-width: 1">

7.ʹ���ڱ��ָ���Ĵ�С
<script>
window.resizeTo(300,283);
</script>

8.ʹ�������¹���
<marquee direction=up scrollamount=1 scrolldelay=100
	onmouseover='this.stop()' onmouseout='this.start()' height=60>
	<!-- head_scrolltext -->
	<tr>
		<td>���͹�
			</table> <!-- end head_scrolltext -->
</marquee>

9.״̬����ʾ��ҳ״̬
<base
	onmouseover="window.status='��վ���� http://www.webmake.cn/' ;return true">

10.���Ե������ʵ��radioѡ���ѡ��
<br>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="regtype" value="A03" id="A03">
<label for="A03"> ���� : һ��ע�������ʻ�</label>
<br>

11.�������������fontдonclick�¼� 12.��ӡ
</a>
��ӡ��ҳ
<a href='javascript:window.print ()'> 13.��������� <input
	type="text" name="key" size="12" value="�ؼ���" onFocus=this.select()
	onMouseOver=this.focus() class="line"> 14.��ʾ�ĵ�����޸�����
	<script language=javascript>
function hi(str)
{
 document.write(document.lastModified)

 alert("hi"+str+"!")
}
</script> 15.����������Ƶ�������ʱ�ʹ����¼�
	<html>
<head>
<script language="LiveScript">
<!-- Hiding
     function hello() {
       alert("����!");
     }
</script>
</head>
<body>
	<a href="" onMouseOver="hello()">link</a>
</body>
	</html> 16.���Ը�����ҳ�ϵ�ѡ����ȷ��ҳ����ɫ
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
	</HTML> 17.����ť�������ı�
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
</style> ����������ť�Ĵ������£� <input type="submit" name="Submit"
	value="�� ��" onmouseover="this.className='style2'"
	onmouseout="this.className='style1'" class="style1">

	18.�ı䰴ť��ͼƬ.
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
</style> ���������İ�ť�������£� <input type="submit" name="Submit2"
	value="�� ��" onmouseover="this.className='style4'"
	onmouseout="this.className='style3'" class="style3">

	19.��ӡҳ��
	<div align="center">
		<a class=content href="javascript:doPrint();">��ӡ����</a>
	</div> 20.����ֱ��дhtml���� document.write(""); 21.�ı����������ɫ <select
	name="classid"
	onChange="changelocation(document.myform.classid.options[document.myform.classid.selectedIndex].value)"
	size="1" style="color: #008080; font-size: 9pt">

		22.ת��Ŀ��URL window.location="http://guoguo" 23.���ݸ�object��form
		UpdateSN('guoqiang99267',this.form) function
		UpdateSN(strValue,strForm) { strForm.SignInName.value = strValue;
		return false; } 24.���ֱ�ǩ
		<label for="AltName4"><input name="AltName" type="RADIO"
			tabindex="931" id="AltName4">guoqiang99859</label>

		25.layer2Ϊ�����ID�����Կ�������Ƿ�ɼ�
		document.all.item('Layer2').style.display = "block";
		document.all.item('Layer2').style.display = "none";//

		26.��ҳ�����favorite��
		<script language=javascript>
<!--
function Addme(){
url = "http://your.site.address"; //���Լ�����ҳ��ַ
title = "Your Site Name"; //���Լ�����ҳ����
window.external.AddFavorite(url,title);
-->
</script>// 27.��10���Զ��ر�ҳ�� < script language="JavaScript" > function
		closeit() { setTimeout("self.close()"��10000) } < /script >

		28.���ԱȽ��ַ��Ĵ�С char=post.charAt(i); if(!('0'<=char&&char<='9'))

		29.���ַ�ת��Ϊ���� month = parseInt(char)

		30.���value�ǿյ�ѡ��ʱת��ָ������
		<select onchange='if(this.value!="")window.open(this.value)'
		class="textinput">
			<option selected>���쵥λ</option>
			<option>-----------------</option>
			<option value="http://www.bjd.com.cn/">�����ձ�</option>
			<option value="http://www.ben.com.cn/">������</option>
	</select> 31.�ı䱳����ɫ
		<td width=* class=dp bgColor=#FAFBFC
		onmouseover="this.bgColor='#FFFFFF';"
		onmouseout="this.bgColor='#FAFBFC';">32.�ı����������ı�����ɫ
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

			33.�ı�ˮƽ�ߵ�����
			<hr size="0" noshade color="#C0C0C0"> 34.���ݲ����ķ�ʽ <a
			href="vote.asp?CurPage=8&id=3488">8</a> 35.ҳ����ת <a href="#1">1</a>
			<a href="#2">2</a> <a href="#3">3</a> <a href="#4">4</a> <a href="#5">5</a>
			<a href="#6">6</a> <a href="#7">7</a> <a name="1">dfdf</a> <a
			name="2">dfdf</a>// 36.��������һ���� if(event.ctrlKey &&
			window.event.keyCode==13)// 37.ˢ��ҳ��
			javascript:this.location.reload()// 38.����ҳ�İ�ťʹ�� <SCRIPT
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
						TYPE="button" NAME="bb " value=guoguo> 39.�����ƶ�
					<marquee scrollamount=3 onmouseover=this.stop();
						onmouseout=this.start();>

						40.˫����ҳ�Զ���
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
						// 41.���� <INPUT TYPE="button" onclick=window.history.back()
							value=back> 42.ǰ�� <INPUT TYPE="button"
							onclick=window.history.forward() value=forward> 43.ˢ�� <INPUT
							TYPE="button" onclick=document.location.reload() value=reload>

						44.ת��ָ����ҳ
						document.location="http://ww"����document.location.assign("http://guoguo.com")

						45.����ҳ����ʾʵʱʱ��
						<SCRIPT LANGUAGE="JavaScript">
var clock_id;
window.onload=function()
{
 clock_id=setInterval("document.form1.txtclock.value=(new Date);",1000)
}
</SCRIPT>
						// 46.���������ļ� document.location.href="Ŀ���ļ�"//

						47.�������ݿ� import java.sql.*; String
						myDBDriver="sun.jdbc.odbc.JdbcOdbcDriver";
						Class.forName(myDBDriver); Connection
						conn=DriverManager.getConnection("jdbc:odbc:firm","username","password");
						Statement stmt=conn.createStatement(); ResultSet
						rs=stmt.executeQuery(sql); rs.getString("column1");//

						48.����ֱ����ҳ�桰div����д���������� <INPUT TYPE="button"
							onclick="a1.innerHTML='<font color=red>*</font>'">
						<div id=a1></div>
						// 49.���Ըı�ҳ���ϵ����ӵĸ�ʽ��ʹ��Ϊ˫��
						<style>
A:link {
	text-decoration: none;
	color: #0000FF;
	font-family: ����
}

A:visited {
	text-decoration: none;
	color: #0000FF;
	font-family: ����
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
	font-family: ����
}

A:visited {
	text-decoration: none;
	color: #0000FF;
	font-family: ����
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
	FONT-FAMILY: ����;
	FONT-SIZE: 9pt
}

textarea, select {
	border-width: 1;
	border-color: #000000;
	background-color: #efefef;
	font-family: ����;
	font-size: 9pt;
	font-style: bold;
}

.text {
	font-family: "����";
	font-size: 9pt;
	color: #003300;
	border: #006600 solid;
	border-width: 1px 1px 1px 1px
}
</style>
						������css 50.�½�frame <a
							href="javascript:newframe('http://www.163.net/help/a_little/index.html','http://www.163.net/help/a_little

/a_13.html')"><img
							alt=���� border=0
							src="http://bjpic.163.net/images/mail/button-help.gif"></a>


						51.���ļ���д����
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

						52.�ȶ��ļ���д�ļ�
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

						53.ֱ��������� <INPUT name=Password size=10 type=password
							style="border-left-width: 0; border-right-width: 0; border-top-width: 0; border-bottom-style: solid; border-bottom-width: 1; background-color: #9CEB9C">

						54.���Խ�������Ϊ��ť��״��ͨ���ı�css�ı�����
						<td width="65" align="center" bgcolor="#E0E0E0"
							onmouseover=this.className=
							'mouseoverbt';

onmouseout=this.className='mouseout';><a
							href="tm.asp?classid=76"><font color="#000000">¼����</font></a></td>
						<style>
.mouseoverbt {
	background-image: url(http://www.yongle.com.cn/img/btbgw64h20y.gif);
	background-repeat: no-repeat;
}

.mouseout {
	background-color: #E0E0E0;
}
</style>

						55.ͬʱ����CTRL��Q�� document.onkeydown=function() {
						if(event.ctrlKey&&event.keyCode==81) {alert(1)} }//

						56.������һ����������ʾhint�Ĵ��룬��˼���ǵ����ͣ���ǽ�div�е�������ʾ��������������Ƴ����ڽ���div��

						�ص�
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

						------------ 57.�������� ����һ��
						<body onload="openwen()">�������ҳ��ʱ�������ڣ� ��������
						<body onunload="openwen()">
							������뿪ҳ��ʱ�������ڣ� ����������һ�����ӵ��ã�
							<a href="#" onclick="openwin()">��һ������</a>
							ע�⣺ʹ�õ�"#"�������ӡ� �����ģ���һ����ť���ã�
							<input type="button" onclick="openwin()" value="�򿪴���">
							��ʱװ��script 58.��̬�ı�����Ĵ�С function doZoom(size) {
							document.getElementById('zoom').style.fontSize=size+'px' }

							function aa() { var newWin=window.open(url);
							newWin.document.form1.text1.value=value1; }�ı䵯���������������
							opener.document.form2.text2.value=value2;�ı丸���ڵ����ֵ

							59.�ж��Ǻ�������� var name = navigator.appName; if (name ==
							"Microsoft Internet Explorer") alert("IE"); else if (name ==
							"Netscape") alert("NS");// 60.vbsscriptȷ����
							<script language="VBScript">
<!--
MsgBox "ȷ��ɾ����", 4
//-->
</script>
							// 61.�������ݵ����а� function JM_cc(bb) { var
							ob=eval("document.form1."+bb); ob.select();
							js=ob.createTextRange(); js.execCommand("Copy"); }//

							62.java�н������ݿ�����ȡ���� public void init() { String
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


							63.��С������ window.blur()// 64.�ĵ���·�� document.URL//

							65.��ʱִ��ĳ�γ��� setTimeout("change_color()",600);

							66.����Ϊ��ҳ function makeHome(){
							netscape.security.PrivilegeManager.enablePrivilege("UniversalPreferencesWrite");
							navigator.preference("browser.startup.homepage", location.href);
							}// 67.����Ϊ�ղ� function addFav(){ if(ie)
							window.external.AddFavorite(location.href,'WWW.OGRISH.COM :
							GROTESQUE MOVIES AND PICTURES'); if(ns) alert("Thanks for the
							bookmark!\n\nNetscape users click OK then press CTRL-D"); }//

							68.�ж�cookie�Ƿ���� navigator.cookieEnabled;//

							69.��ʾ��ģʽ����ҳ��ĵ������� function setbgcolor_onclick() {
							var color =
							showModalDialog("/mailpage/compose/colorsel.html",0,"help=0"); if
							(color != null) { document.compose.bgcolor.value = color; } }//


							70.��ȡС�������λ var a=3454545.4454545; alert(a.toFixed(2));//


							71.��ֹѡ��ҳ���ϵ�����������
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
							// 72.�����Ҽ��˵� oncontextmenu="event.returnValue = false"//

							73.�¼���ֹ���� event.cancelBubble = true//

							74.��ֹ�����������뷨
							<input style="ime-mode: disabled">// 75.���κ��ֺͿո�
							<input name="txt">
							<input type="submit"
								onClick="alert(!/[^ -}]|\s/.test(txt.value))">//

							76.��javascript�ж��ļ��Ƿ���� function Exists(filespec) { if
							(filespec) { var fso; fso = new
							ActiveXObject("Scripting.FileSystemObject");
							alert(fso.FileExists(filespec)); } } ѡ��ͼƬ
							<input type=file name=f1>
							<p>
								<input type="submit" onClick="Exists(f1.value)">//

								77.��õ�ǰ���ı���ѡ�е����� <input
									onmouseup="alert(document.selection.createRange().text)"
									value=123>// 78.��ת��Ŀ��ҳ�棬ͬʱ���ɷ��� <a
									href="javascript:location.replace('http://www.sohu.com/')">sohu.com</a>//


								79.��õ�ǰ�����Ǳ��ĵڼ���
								<script>
function getrow(obj)
{
  if(event.srcElement.tagName=="TD"){
  curRow=event.srcElement.parentElement;
  alert("���ǵ�"+(curRow.rowIndex+1)+"��");

  }
}
</script>
							<table border="1" width="100%" onclick=getrow(this)>
								<tr>
									<td width="20%">��</td>
									<td width="20%">��</td>
									<td width="20%">��</td>
									<td width="20%">��</td>
									<td width="20%">��</td>
								</tr>
								<tr>
									<td width="20%">��</td>
									<td width="20%">��</td>
									<td width="20%">��</td>
									<td width="20%">��</td>
									<td width="20%">��</td>
								</tr>
							</table>
							// 80.ɾ�����ĳ�У�xx��ʾĳ�У��±��0��ʼ����
							document.all.myTable.deleteRow(xx)// 81.��̬�������������
							<table id="t1" border="1">
							</table>
							<script language="JavaScript">
function add()
{
  t1.insertRow().insertCell().innerHTML = '<input name="test'+t1.rows.length+'">';
}//


82.event.x,event.clientX,event.offsetX����
x:���û����ǵõ���������Ŀ���¼��ĸ�Ԫ�ص���߽���x�����ϵ�λ�á� clientX:����ڿͻ������x����λ�ã���

������������������������ offsetx�����û����ǵõ���������Ŀ���¼��ĸ�Ԫ�ص��ڱ߽���x�����ϵ�λ�á�
screenX:������û���Ļ��

 
83.��ʾ����갴ť���ĸ�
<body onMouseDown="alert(event.button)">��Mouse����//

84.��C��
<form action="file:///c|/"><input type="submit" value="c:\ drive"></form>//
 
85.��ǰ��Ļ�ķֱ���
screen.width��screen.height//

86.���ñ���е�����
tbl.rows[0].cells[1].innerText=document.form.text1.value;//

 
87.���ؿ�ݼ�
<p><a href="file:///::{208D2C60-3AEA-1069-A2D7-08002B30309D}" target="_blank">�����ھ�</a></p>
<p><a href="file:///::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\d:\web" target="_blank">�ҵĵ���</a></p>
<p><a href="file:///::{450D8FBA-AD25-11D0-98A8-0800361B1103}" target="_blank">�ҵ��ĵ�</a></p>
<p><a href="file:///::{645FF040-5081-101B-9F08-00AA002F954E}" target="_blank">����վ</a></p>
<p><a href="file:///::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\::{21EC2020-3AEA-1069-A2DD-08002B30309D}"

target="_blank">�������</a></p>
<p><a href="file:///::{7007ACC7-3202-11D1-AAD2-00805FC1270E}">��������</a>(windows 2000)</p>

 
88.IE�˵�
<button onclick="min.Click()"><font face="webdings">0</font></button>//�ı䰴ť�ϵ�ͼƬ
<input type=button  onclick="document.execCommand('CreateLink','true','true')"> //����������
<input type=button  onclick="document.execCommand('print','true','true')"> //��ӡ
<input type=button  onclick="document.execCommand('saveas','true','��վ����.htm')">//���Ϊhtm
<input type=button  onclick="document.execCommand('saveas','true','��վ����.txt')">//���Ϊtxt
document.execCommand("SaveAs")//����Ϊ
document.execCommand('undo')//������һ�β���

89.web�Ի���
<SCRIPT>
var contents='<style>body,td{font:menu}img{cursor:hand}</style>';
contents+='<title>��Ҫ�ر�����</title>';
contents+='<body bgcolor=menu>';
contents+='<table width=100% height=100% border=0>';
contents+='<tr><td align=center>';
contents+='��Ҫ�ر�����<br>';
contents+='<img src=dark.gif onclick=self.close() alt="...�ر�">';
contents+='<img src=jet.gif onclick=self.close() alt="ȫ�ǹر�">';
contents+='</td></tr></table>';
showModalDialog("about:"+contents+"","","dialogHeight:50px;dialogWidth:250px;help:no;status:no")
document.write(contents);
</SCRIPT>
							// 90.ȡ��x,y��ֵ
							<button onclick="t1.rows[x].cells[y].innerText='guoguo'"></button>
							// 91.���´򿪵���ҳ��д����
							newwin=window.open('about:blank','','top=10');
							newwin.document.write('');// 93.���� javascript:history.go(-2);//

							94.��ҳ����ѡ�е����ݸ��Ƶ������� abcdefg
							<input type='button'
								onclick="window.clipboardData.setData('text',document.selection.createRange().text);"
								value='����ҳ��ѡ��

���ַ�'>//
							95.��ҳ����ѡ�е����ݸ��Ƶ�������
							<INPUT TYPE="text" NAME="">kjhkjhkhkj
							<INPUT TYPE="button"
								onclick="document.execCommand('Copy', 'false',

null);">////

							96.����Ƶ�������ʱ�Զ�ȫ����
							<select onmouseover="javascript:this.size=this.length"
								onmouseout="javascript:this.size=1"></select>//

							97.��ñ������ļ� var fso = new
							ActiveXObject("Scripting.FileSystemObject"); var f1 =
							fso.GetFile("C:\\bsitcdata\\ejbhome.xml"); alert("File last
							modified: " + f1.DateLastModified); //

							98.�жϿͻ����Ƿ���IE����� ��Ϊ document.all �� IE
							���������ԣ�����ͨ��������������жϿͻ����Ƿ���IE�����
							,document.all?1:0; 99.�����µ�������ѡ�� new
							Option(text,value)�����ĺ���// 100.��ҳ���ϻ���״ͼ
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
����������v��ΪVML���ñ���
</STYLE>
							<SCRIPT LANGUAGE="JavaScript">
mathstr=12;
document.write ("<v:rect fillcolor='red'

style='width:20;color:navy;height:"+5000/(1000/mathstr)+"'><br>&nbsp;%"+mathstr+"<br>4��<v:Extrusion

backdepth='15pt' on='true'/></v:rect>")
</SCRIPT>
							<v:rect fillcolor='red' style='width:20;color:navy;height:200'>
								<br>%12<br>4��<v:Extrusion backdepth='15pt' on='true' />
							</v:rect>
							<v:rect fillcolor='yellow' style='width:20;color:navy;height:100'>
								<br>%12<br>4��<v:Extrusion backdepth='15pt' on='true' />
							</v:rect>
							//