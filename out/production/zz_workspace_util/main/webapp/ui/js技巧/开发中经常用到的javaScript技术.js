��b/s�����о����õ���javaScript���� 
һ����֤��
1��������֤��
  1.1 ����
  1.2 ����0������ �����ڴ�����ID����֤)
  1.3 ����������֤
  1.4 �������ܴ���iMax
  1.5 ��������С��iMin
2��ʱ����
  2.1 ��ʱ�䣬���� (13:04:06)
  2.2 �����ڣ����� (2003-12-05)
  2.3 ��ʱ�䣬���� (2003-12-05 13:04:06)
  2.4 ֻ������¡�����(2003-05,����2003-5)
  2.5 ֻ��Сʱ�ͷ���,����(12:03)
3������
  3.1 ���еı���ֵ������Ϊ��
  3.2 �����ı����ֵ����Ϊ�ա�
  3.3 �����ı����ֵ���ܳ���sMaxStrleng
  3.4 �����ı����ֵ��������sMixStrleng
  3.5 �жϵ�ѡ���Ƿ�ѡ��
  3.6 �жϸ�ѡ���Ƿ�ѡ��.
  3.7 ��ѡ���ȫѡ����ѡ��ȫ��ѡ����ѡ
  3.8 �ļ��ϴ��������ж��ļ�����
4���ַ���
  4.1 �ж��ַ�ȫ����a-Z������A-Z������ĸ���
  4.2 �ж��ַ�����ĸ��������ɡ�
  4.3 �ж��ַ�����ĸ�����֣��»���,������.�ҿ�ͷ��ֻ�����»��ߺ���ĸ
  4.4 �ַ����滻����.Replace();
5���������
  5.1 �ж������������
  5.2 �ж�ie�İ汾
  5.3 �жϿͻ��˵ķֱ���
  
6�������
  6.1 email���жϡ�
  6.2 �ֻ��������֤
  6.3 ���֤����֤
  

����������

1��ʱ������ؿؼ���
  1.1 ����
  1.2 ʱ��ؼ�
  1.3 ������
  1.4 ��ʾ��̬��ʾʱ��Ч�����ı�����OA��ʱ�䣩
  1.5 ��ʾ��̬��ʾʱ��Ч�� (ͼ�����ֱ�) 
2������
  2.1 �Զ����ɱ�
  2.2 ��̬��ӣ��޸ģ�ɾ���������е�Ԫ��
  2.3 �����������ݵ�������
  2.4 �����ı�����ֻ������iMax���֡�����������ˣ��Զ����ٵ�iMax�����֣������ڶ��ŷ���)
  
3����ӡ��
  3.1 ��ӡ�ؼ�
4���¼���
  4.1 �����Ҽ�
  4.2 �������й��ܼ�
  4.3 --> ��<-- F5 F11,F9,F1
  4.4 ������ϼ�ctrl+N
5����ҳ�����
  5.1 �������������֣�ͼƬ��ע���������ģ��������ֺ�ͼƬ��û�пհ׳��֣�
  5.2 html�༭�ؼ���
  5.3 ��ɫѡȡ��ؼ�
  5.4 �����˵�
  5.5 �������ε������˵�
  5.6 ��IE�˵��İ�ť����Ч����rongshuxa.com�ĵ�����Ŀ)
  5.7 ״̬����title���Ķ�̬Ч�������Ӻܶ࣬�����о�һ�£�
  5.8 ˫������ҳ�Զ�����
6�����ͽṹ��
  6.1 asp+SQL��
  6.2 asp+xml+sql��
  6.3 java+sql����java+sql+xml
7���ޱ߿�Ч��������
8��������������
9���ı�����


һ����֤��
1��������֤��
  1.1 ����
      /^(-|\+)?\d+$/.test(str)
  1.2 ����0������ �����ڴ�����ID����֤)
      /^\d+$/.test(str)
  1.3 ����������֤
      /^-\d+$/.test(str)
2��ʱ����
  2.1 ��ʱ�䣬���� (13:04:06)
      function isTime(str)
      {
        var a = str.match(/^(\d{1,2})(:)?(\d{1,2})\2(\d{1,2})$/);
        if (a == null) {alert('����Ĳ�������ʱ���ʽ'); return false;}
        if (a[1]>24 || a[3]>60 || a[4]>60)
        {
          alert("ʱ���ʽ����");
          return false
        }
        return true;
      }
  2.2 �����ڣ����� (2003-12-05)
      function strDateTime(str)
      {
         var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
         if(r==null)return false; 
         var d= new Date(r[1], r[3]-1, r[4]); 
         return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
      }
  2.3 ��ʱ�䣬���� (2003-12-05 13:04:06)
      function strDateTime(str)
      {
        var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/; 
        var r = str.match(reg); 
        if(r==null)return false; 
        var d= new Date(r[1], r[3]-1,r[4],r[5],r[6],r[7]); 
        return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]&&d.getHours()==r[5]&&d.getMinutes()==r[6]&&d.getSeconds()==r[7]);
      }
  2.4 ֻ������¡�����(2003-05,����2003-5)
  2.5 ֻ��Сʱ�ͷ���,����(12:03)
3������
  3.1 ���еı���ֵ������Ϊ��
      <input onblur="if(this.value.replace(/^\s+|\s+$/g,'')=='')alert('����Ϊ��!')">
  3.2 �����ı����ֵ����Ϊ�ա�
  3.3 �����ı����ֵ���ܳ���sMaxStrleng
  3.4 �����ı����ֵ��������sMixStrleng
  3.5 �жϵ�ѡ���Ƿ�ѡ��
  3.6 �жϸ�ѡ���Ƿ�ѡ��.
  3.7 ��ѡ���ȫѡ����ѡ��ȫ��ѡ����ѡ
  3.8 �ļ��ϴ��������ж��ļ�����
4���ַ���
  4.1 �ж��ַ�ȫ����a-Z������A-Z������ĸ���
      <input onblur="if(/[^a-zA-Z]/g.test(this.value))alert('�д�')">
  4.2 �ж��ַ�����ĸ��������ɡ�
      <input onblur="if(/[^0-9a-zA-Z]/g.test(this.value))alert('�д�')">
  4.3 �ж��ַ�����ĸ�����֣��»���,������.�ҿ�ͷ��ֻ�����»��ߺ���ĸ
      /^([a-zA-z_]{1})([\w]*)$/g.test(str)
  4.4 �ַ����滻����.Replace();
5���������
  5.1 �ж������������
      window.navigator.appName
  5.2 �ж�ie�İ汾
      window.navigator.appVersion
  5.3 �жϿͻ��˵ķֱ���
      window.screen.height;  window.screen.width;
  
6�������
  6.1 email���жϡ�
      function ismail(mail)
      {
        return(new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(mail));
      }
  6.2 �ֻ��������֤
  6.3 ���֤����֤
      function isIdCardNo(num)
      {
        if (isNaN(num)) {alert("����Ĳ������֣�"); return false;}
        var len = num.length, re; 
        if (len == 15)
          re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/);
        else if (len == 18)
          re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\d)$/);
        else {alert("���������λ�����ԣ�"); return false;}
        var a = num.match(re);
        if (a != null)
        {
          if (len==15)
          {
            var D = new Date("19"+a[3]+"/"+a[4]+"/"+a[5]);
            var B = D.getYear()==a[3]&&(D.getMonth()+1)==a[4]&&D.getDate()==a[5];
          }
          else
          {
            var D = new Date(a[3]+"/"+a[4]+"/"+a[5]);
            var B = D.getFullYear()==a[3]&&(D.getMonth()+1)==a[4]&&D.getDate()==a[5];
          }
          if (!B) {alert("��������֤�� "+ a[0] +" ��������ڲ��ԣ�"); return false;}
        }
        return true;
      }

3.7 ��ѡ���ȫѡ����ѡ��ȫ��ѡ����ѡ
<form name=hrong>
<input type=checkbox name=All onclick="checkAll('mm')">ȫѡ<br/>
<input type=checkbox name=mm onclick="checkItem('All')"><br/>
<input type=checkbox name=mm onclick="checkItem('All')"><br/>
<input type=checkbox name=mm onclick="checkItem('All')"><br/>
<input type=checkbox name=mm onclick="checkItem('All')"><br/>
<input type=checkbox name=mm onclick="checkItem('All')"><br/><br/>


<input type=checkbox name=All2 onclick="checkAll('mm2')">ȫѡ<br/>
<input type=checkbox name=mm2 onclick="checkItem('All2')"><br/>
<input type=checkbox name=mm2 onclick="checkItem('All2')"><br/>
<input type=checkbox name=mm2 onclick="checkItem('All2')"><br/>
<input type=checkbox name=mm2 onclick="checkItem('All2')"><br/>
<input type=checkbox name=mm2 onclick="checkItem('All2')"><br/>

</form>

<SCRIPT LANGUAGE="java script">
function checkAll(str)
{
  var a = document.getElementsByName(str);
  var n = a.length;
  for (var i=0; i<n; i++)
  a[i].checked = window.event.srcElement.checked;
}
function checkItem(str)
{
  var e = window.event.srcElement;
  var all = eval("document.hrong."+ str);
  if (e.checked)
  {
    var a = document.getElementsByName(e.name);
    all.checked = true;
    for (var i=0; i<a.length; i++)
    {
      if (!a[i].checked){ all.checked = false; break;}
    }
  }
  else all.checked = false;
}
</SCRIPT>

3.8 �ļ��ϴ��������ж��ļ�����
<input type=file onchange="alert(this.value.match(/^(.*)(\.)(.{1,8})$/)[3])">

��ͼ:
<OBJECT 
id=S 
style="LEFT: 0px; WIDTH: 392px; TOP: 0px; HEIGHT: 240px" 
height=240 
width=392 
classid="clsid:369303C2-D7AC-11D0-89D5-00A0C90833E6">
</OBJECT>
<SCRIPT>
S.DrawingSurface.ArcDegrees(0,0,0,30,50,60);
S.DrawingSurface.ArcRadians(30,0,0,30,50,60);
S.DrawingSurface.Line(10,10,100,100);
</SCRIPT>

дע���
<SCRIPT>
var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.RegWrite ("HKCU\\Software\\ACME\\FortuneTeller\\", 1, "REG_BINARY");
WshShell.RegWrite ("HKCU\\Software\\ACME\\FortuneTeller\\MindReader", "Goocher!", "REG_SZ");
var bKey =    WshShell.RegRead ("HKCU\\Software\\ACME\\FortuneTeller\\");
WScript.Echo (WshShell.RegRead ("HKCU\\Software\\ACME\\FortuneTeller\\MindReader"));
WshShell.RegDelete ("HKCU\\Software\\ACME\\FortuneTeller\\MindReader");
WshShell.RegDelete ("HKCU\\Software\\ACME\\FortuneTeller\\");
WshShell.RegDelete ("HKCU\\Software\\ACME\\");
</SCRIPT>

TABLAE���(�ͻ��˶�̬�������У�
<HTML>
<SCRIPT LANGUAGE="JScript">
function numberCells() {
    var count=0;
    for (i=0; i < document.all.mytable.rows.length; i++) {
        for (j=0; j < document.all.mytable.rows(i).cells.length; j++) {
            document.all.mytable.rows(i).cells(j).innerText = count;
            count++;
        }
    }
}
</SCRIPT>
<BODY onload="numberCells()">
<TABLE id=mytable border=1>
<TR><TH>&nbsp;</TH><TH>&nbsp;</TH><TH>&nbsp;</TH><TH>&nbsp;</TH></TR>
<TR><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD></TR>
<TR><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD><TD>&nbsp;</TD></TR>
</TABLE>
</BODY>
</HTML> 

�������֤�ϸ���֤��

<script>
var aCity={11:"����",12:"���",13:"�ӱ�",14:"ɽ��",15:"���ɹ�",21:"����",22:"����",23:"������",31:"�Ϻ�",32:"����",33:"�㽭",34:"����",35:"����",36:"����",37:"ɽ��",41:"����",42:"����",43:"����",44:"�㶫",45:"����",46:"����",50:"����",51:"�Ĵ�",52:"����",53:"����",54:"����",61:"����",62:"����",63:"�ຣ",64:"����",65:"�½�",71:"̨��",81:"���",82:"����",91:"����"}
  
function cidInfo(sId){
 var iSum=0
 var info=""
 if(!/^\d{17}(\d|x)$/i.test(sId))return false;
 sId=sId.replace(/x$/i,"a");
 if(aCity[parseInt(sId.substr(0,2))]==null)return "Error:�Ƿ�����";
 sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));
 var d=new Date(sBirthday.replace(/-/g,"/"))
 if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))return "Error:�Ƿ�����";
 for(var i = 17;i>=0;i --) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11)
 if(iSum%11!=1)return "Error:�Ƿ�֤��";
 return aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"��":"Ů")
}

document.write(cidInfo("380524198002300016"),"<br/>");
document.write(cidInfo("340524198002300019"),"<br/>")
document.write(cidInfo("340524197711111111"),"<br/>")
document.write(cidInfo("34052419800101001x"),"<br/>");
</script>

������֤�ɣе�ַ
<SCRIPT LANGUAGE="java script">
function isip(s){
 var check=function(v){try{return (v<=255 && v>=0)}catch(x){return false}};
 var re=s.split(".")
 return (re.length==4)?(check(re[0]) && check(re[1]) && check(re[2]) && check(re[3])):false
}

var s="202.197.78.129";
alert(isip(s))
</SCRIPT>

 

������sp1�����õ��ޱ߿򴰿ڣ���
<HTML XMLNS:IE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<IE:Download ID="include" STYLE="behavior:url(#default#download)" />
<title>Chromeless Window</title>

<SCRIPT LANGUAGE="JScript">
/*--- Special Thanks For andot ---*/

/*
 This following code are designed and writen by Windy_sk <seasonx@163.net>
 You can use it freely, but u must held all the copyright items!
*/

/*--- Thanks For andot Again ---*/

var CW_width = 400;
var CW_height = 300;
var CW_top = 100;
var CW_left = 100;
var CW_url = "/";
var New_CW = window.createPopup();
var CW_Body = New_CW.document.body;
var content = "";
var CSStext = "margin:1px;color:black; border:2px outset;border-style:expression(onmouseout=onmouseup=function(){this.style.borderStyle='outset'}, onmousedown=function(){if(event.button!=2)this.style.borderStyle='inset'});background-color:buttonface;width:16px;height:14px;font-size:12px;line-height:11px;cursor:Default;";

//Build Window
include.startDownload(CW_url, function(source){content=source});

function insert_content(){
 var temp = "";
 CW_Body.style.overflow  = "hidden";
 CW_Body.style.backgroundColor = "white";
 CW_Body.style.border  =  "solid black 1px";
 content = content.replace(/<a ([^>]*)>/g,"<a onclick='parent.open(this.href);return false' $1>");
 temp += "<table width=100% height=100% cellpadding=0 cellspacing=0 border=0>";
 temp += "<tr style=';font-size:12px;background:#0099CC;height:20;cursor:default' ondblclick=\"Max.innerText=Max.innerText=='1'?'2':'1';parent.if_max=!parent.if_max;parent.show_CW();\" onmouseup='parent.drag_up(event)' onmousemove='parent.drag_move(event)' onmousedown='parent.drag_down(event)' onselectstart='return false' oncontextmenu='return false'>";
 temp += "<td style='color:#ffffff;padding-left:5px'>Chromeless Window For IE6 SP1</td>";
 temp += "<td style='color:#ffffff;padding-right:5px;' align=right>";
 temp += "<span id=Help  onclick=\"alert('Chromeless Window For IE6 SP1  -  Ver 1.0\\n\\nCode By Windy_sk\\n\\nSpecial Thanks For andot')\" style=\""+CSStext+"font-family:System;padding-right:2px;\">?</span>";
 temp += "<span id=Min   onclick='parent.New_CW.hide();parent.blur()' style=\""+CSStext+"font-family:Webdings;\" title='Minimum'>0</span>";
 temp += "<span id=Max   onclick=\"this.innerText=this.innerText=='1'?'2':'1';parent.if_max=!parent.if_max;parent.show_CW();\" style=\""+CSStext+"font-family:Webdings;\" title='Maximum'>1</span>";
 temp += "<span id=Close onclick='parent.opener=null;parent.close()' style=\""+CSStext+"font-family:System;padding-right:2px;\" title='Close'>x</span>";
 temp += "</td></tr><tr><td colspan=2>";
 temp += "<div id=include style='overflow:scroll;overflow-x:hidden;overflow-y:auto; HEIGHT: 100%; width:"+CW_width+"'>";
 temp += content;
 temp += "</div>";
 temp += "</td></tr></table>";
 CW_Body.innerHTML = temp;
}

setTimeout("insert_content()",1000);

var if_max = true;
function show_CW(){
 window.moveTo(10000, 10000);
 if(if_max){
  New_CW.show(CW_top, CW_left, CW_width, CW_height);
  if(typeof(New_CW.document.all.include)!="undefined"){
   New_CW.document.all.include.style.width = CW_width;
   New_CW.document.all.Max.innerText = "1";
  }
  
 }else{
  New_CW.show(0, 0, screen.width, screen.height);
  New_CW.document.all.include.style.width = screen.width;
 }
}

window.onfocus  = show_CW;
window.onresize = show_CW;

// Move Window
var drag_x,drag_y,draging=false

function drag_move(e){
 if (draging){
  New_CW.show(e.screenX-drag_x, e.screenY-drag_y, CW_width, CW_height);
  return false;
 }
}

function drag_down(e){
 if(e.button==2)return;
 if(New_CW.document.body.offsetWidth==screen.width && New_CW.document.body.offsetHeight==screen.height)return;
 drag_x=e.clientX;
 drag_y=e.clientY;
 draging=true;
 e.srcElement.setCapture();
}

function drag_up(e){
 draging=false;
 e.srcElement.releaseCapture();
 if(New_CW.document.body.offsetWidth==screen.width && New_CW.document.body.offsetHeight==screen.height) return;
 CW_top  = e.screenX-drag_x;
 CW_left = e.screenY-drag_y;
}

</SCRIPT>
</HTML>

�绰�������֤

Ҫ��
����(1)�绰���������֡�"("��")"��"-"����
����(2)�绰����Ϊ3��8λ
����(3)����绰�����а��������ţ���ô����Ϊ��λ����λ
����(4)������"("��")"��"-"���������ָ���
����(5)�ƶ��绰����Ϊ11��12λ�����Ϊ12λ,��ô��һλΪ0
����(6)11λ�ƶ��绰����ĵ�һλ�͵ڶ�λΪ"13"
����(7)12λ�ƶ��绰����ĵڶ�λ�͵���λΪ"13"
���������⼸�����򣬿����������������ʽ��
����(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)


<script language="java script">
function PhoneCheck(s) {
var str=s;
var reg=/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/
alert(reg.test(str));
}
</script>
<input type=text name="iphone">
<input type=button onclick="PhoneCheck(document.all.iphone.value)" value="Check">

����������������ַ������Ե�Ч�������Է������ַ������벻����Ӧ��
function numbersonly(field,event){
 var key,keychar;
 if(window.event){
  key = window.event.keyCode;
 }
 else if (event){
  key = event.which;
 }
 else{
  return true
 }
 keychar = String.fromCharCode(key);
 if((key == null)||(key == 0)||(key == 8)||(key == 9)||(key == 13)||(key == 27)){
  return true;
 }
 else if(("0123456789.").indexOf(keychar)>-1){
  window.status = "";
  return true;
 }
 else {
  window.status = "Field excepts numbers only";
  return false;
 }
}

��֤ip 

str=document.RegExpDemo.txtIP.value;
if(/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/.test(str)==false)
{
 window.alert('�����IP��ַ��ʽ');
 document.RegExpDemo.txtIP.select();
 document.RegExpDemo.txtIP.focus();
 return;
}
if(RegExp.$1<1 || RegExp.$1>254||RegExp.$2<0||RegExp.$2>254||RegExp.$3<0||RegExp.$3>254||RegExp.$4<1||RegExp.$4>254)
{
 window.alert('�����IP��ַ');
 document.RegExpDemo.txtIP.select();
 document.RegExpDemo.txtIP.focus();
 return;
}
//�޳� ��  010.020.020.03 ǰ�� ��0 
var str=str.replace(/0(\d)/g,"$1");
str=str.replace(/0(\d)/g,"$1");
window.alert(str);


//һ����ȡ���ݵ���
//Obj����ָ�����ݵ���Դ(�޶�Table),Ĭ�ϵ�һ��Ϊ�ֶ�������
//GetTableData���ṩMoveNext����,�����Ǳ�������ϻ������ƶ���λ��,���������ƶ�,��������.
//GetFieldData�������ָ��������������
//Sort_desc������ָ�����а���������
//Sort_asc������ָ�����а���������
//GetData���������ֶ�ֵΪ�ض�ֵ����������,�ṩ����,�������ⲿ������������
//Delete����ɾ����ǰ��¼,�������һ��
//��ʼ��,Obj:table������,Leftlen:����������ݳ���,Rightlen:����������ݳ���,
function GetTableData(Obj,LeftLen,RightLen){
var MyObj=document.all(Obj);
var iRow=MyObj.rows.length;
var iLen=MyObj.rows[0].cells.length;
var i,j;

TableData=new Array();
  for (i=0;i< iRow;i++){
   TableData[i]=new Array();
   for (j=0;j<iLen;j++){
   TableStr=MyObj.rows(i).cells(j).innerText;
   TableStr=TableStr.substring(LeftLen, TableStr.length-RightLen).Trim();
   TableStr=TableStr.replace(/ /gi,"").replace(/\r\n/ig,"");
   TableData[i][j]=TableStr;
   }
   }
  
  this.TableData=TableData; 
  this.cols=this.TableData[0].length;
  this.rows=this.TableData.length;
  this.rowindex=0;
}


function movenext(Step){
if (this.rowindex>=this.rows){
return
}

if (Step=="" || typeof(Step)=="undefined") {
 if (this.rowindex<this.rows-1)
 this.rowindex++;
 return;

}
 else{
  if (this.rowindex + Step<=this.rows-1 && this.rowindex + Step>=0 ){
  this.rowindex=this.rowindex + Step;
  }
  else
  {
  if (this.rowindex + Step<0){
   this.rowindex= 0;
   return;
   }
  if (this.rowindex + Step>this.rows-1){
   this.rowindex= this.rows-1;
   return;
   }
  }
 }
}


function getfielddata(Field){
var colindex=-1;
var i=0;
 if (typeof(Field) == "number"){
   colindex=Field;
  }
 else
 {
 for (i=0;i<this.cols && this.rowindex<this.rows ;i++){
   if (this.TableData[0][i]==Field){
   colindex=i;
   break;
   }  
  }
 }
  if (colindex!=-1) {
  return this.TableData[this.rowindex][colindex];
  }

}

 

function sort_desc(){//����
 var colindex=-1;
 var highindex=-1;
 desc_array=new Array();
 var i,j;
for (n=0; n<arguments.length; n++){
 Field=arguments[arguments.length-1-n];
 for (i=0;i<this.cols;i++){
  if (this.TableData[0][i]==Field){
  colindex=i;
  break;
  }  
 }
   if ( colindex==-1 )
  return;
   else
  {
  desc_array[0]=this.TableData[0];
  for(i=1;i<this.rows;i++){
  desc_array[i]=this.TableData[1];
  highindex=1;
   for(j=1;j<this.TableData.length;j++){
      if  (desc_array[i][colindex]<this.TableData[j][colindex]){ 
      desc_array[i]=this.TableData[j];   
      highindex=j;
    }
    
   }
     if (highindex!=-1)
     this.TableData=this.TableData.slice(0,highindex).concat(this.TableData.slice(highindex+1,this.TableData.length));                      
  }
 }

 
 this.TableData=desc_array;
}
 return;
}

 

function sort_asc(){//����
 var colindex=-1;
 var highindex=-1;
 var i,j;
for (n=0; n<arguments.length; n++){
   asc_array=new Array();
   Field=arguments[arguments.length-1-n];
   for (i=0;i<this.cols;i++){
    if (this.TableData[0][i]==Field){
    colindex=i;
    break;
    }  
   }
   if ( colindex==-1 )
     return;
   else
     {
     asc_array[0]=this.TableData[0];
     for(i=1;i<this.rows;i++){
     asc_array[i]=this.TableData[1];
     highindex=1;
      for(j=1;j<this.TableData.length;j++){//�ҳ���С����ֵ
         if  (asc_array[i][colindex]>this.TableData[j][colindex]){ 
         asc_array[i]=this.TableData[j];   
         highindex=j;
          
        }
          
       }
         if (highindex!=-1)
         this.TableData=this.TableData.slice(0,highindex).concat(this.TableData.slice(highindex+1,this.TableData.length));                      
         
      }
     }

 
    this.TableData=asc_array;
 }
 return;
}

 

function getData(Field,FieldValue){
var colindex=-1;
var i,j;

GetData=new Array();
  if (typeof(Field)=="undefined" || typeof(FieldValue)=="undefined" ){
  return this.TableData;
  }
  
   for(j=0;j<this.cols;j++){
      if  (this.TableData[0][j]==Field){
     colindex=j;
     }
   }
   if (colindex!=-1){
   
   for(i=1;i<this.rows;i++){
      if  (this.TableData[i][colindex]==FieldValue){
     GetData[i]=new Array();
     GetData[i]=this.TableData[i]; 
     }
   }
   }
   return GetData;
}
function DeletE(){
this.TableData=this.TableData.slice(0,this.rowindex).concat(this.TableData.slice(this.rowindex+1,this.TableData.length));                      
this.rows=this.TableData.length;
return;
}
function updateField(Field,FieldValue){
var colindex=-1;
var i=0;
 if (typeof(Field) == "number"){
   colindex=Field;
  }
 else
 {
 for (i=0;i<this.cols && this.rowindex<this.rows ;i++){
   if (this.TableData[0][i]==Field){
   colindex=i;
   break;
   }  
  }
 }
 if (colindex!=-1) {
  this.TableData[this.rowindex][colindex]=FieldValue;
  }


}
function movefirst(){
this.rowindex=0;
}
function movelast(){
this.rowindex=this.rows-1;
}
function String.prototype.Trim() {return this.replace(/(^\s*)|(\s*$)/g,"");}
GetTableData.prototype.MoveNext = movenext;
GetTableData.prototype.GetFieldData = getfielddata;
GetTableData.prototype.Sort_asc = sort_asc;
GetTableData.prototype.Sort_desc = sort_desc;
GetTableData.prototype.GetData = getData;
GetTableData.prototype.Delete = DeletE;
GetTableData.prototype.UpdateField = updateField;
GetTableData.prototype.MoveFirst = movefirst;

��������ӣ�http://202.119.73.208/NetEAn/com/test/jsprint.htm

��ÿ���ı����onblur�¼��е���У�����,����ÿ���ı�����onKeyDown�¼���дһ��enterתtab����

//�س�����Ϊtab
function enterToTab()
{
    if(event.srcElement.type != 'button' && event.srcElement.type != 'textarea'
       && event.keyCode == 13)
    {
        event.keyCode = 9;
    }
}
//JS��ȡ�س��¼�һ��
һ���õ�onkeydown��ȡ�¼�������
�����õ����̶�Ӧ����keyCode,
���� var event=arguments.callee.caller.arguments[0]||window.event;//������������죬

    <input onkeydown="enterSumbit()" type="text" id="qqnum" class="text"/>  
    <input onclick="queryAward()" type="button" class="btnS" value="�ύ"/>  

document.onkeydown=function(event){
	var e = event || window.event || arguments.callee.caller.arguments[0];	// ���ݸ��������
	if(e && e.keyCode==27){ // �� Esc 
		//Ҫ��������
	  }
	if(e && e.keyCode==113){ // �� F2 
		 //Ҫ��������
	   }            
	 if(e && e.keyCode==13){ // enter ��
		 //Ҫ��������
	}
}; 



��ʱ����Ҫ���ɱ༭���---
�����һ�����ɱ༭����С����,д���е���,�Ǻ�:��

//===============================start================================


<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<TITLE>�����޸ı��</TITLE>
<STYLE>
/*��ʾ�����ʽ*/
div
{
  BORDER-RIGHT: #80c144 1px solid;
  BORDER-TOP: #80c144 1px solid;
  VISIBILITY: hidden;
  BORDER-LEFT: #80c144 1px solid;
  CURSOR: default;
  LINE-HEIGHT: 20px;
  BORDER-BOTTOM: #80c144 1px solid;
  FONT-FAMILY: ����;
  font-size:12px;
  POSITION: absolute;
  BACKGROUND-COLOR: #f6f6f6;
  TOP:30px;
  LEFT:30px;
}
/*tr����ʽ*/
tr
{
    font-family: "����";
    color: #000000;
    background-color: #C1DBF5;
    font-size: 12px
}
/*table��ע��ʽ*/
.TrFoot
{
    FONT-SIZE: 12px;
    font-family:"����", "Verdana", "Arial";
    BACKGROUND-COLOR: #6699CC;
    COLOR:#FFFFFF;
    height: 25;
}
/*trhead����*/
.TrHead
{
    FONT-SIZE: 13px;
    font-family:"����", "Verdana", "Arial";
    BACKGROUND-COLOR: #77AADD;
    COLOR:#FFFFFF;
    height: 25;
}
/*�ı�����ʽ*/
INPUT
{
    BORDER-COLOR: #AACEF7 #AACEF7 #AACEF7 #AACEF7;
    BORDER-RIGHT: 1px solid;
    BORDER-TOP: 1px solid;
    BORDER-LEFT: 1px solid;
    BORDER-BOTTOM: 1px solid;
    FONT-SIZE: 12px;
    FONT-FAMILY: "����","Verdana";
    color: #000000;
    BACKGROUND-COLOR: #E9EFF5;
}
/*button��ʽ*/
button
{
    BORDER-COLOR: #AACEF7 #AACEF7 #AACEF7 #AACEF7;
    BACKGROUND-COLOR: #D5E4F3;
    CURSOR: hand;
    FONT-SIZE:12px;
    BORDER-RIGHT: 1px solid;
    BORDER-TOP: 1px solid;
    BORDER-LEFT: 1px solid;
    BORDER-BOTTOM: 1px solid;
    COLOR: #000000;
}
</STYLE>
</HEAD>
<BODY>
<SCRIPT language = "java script">
<!--ȫ�ֱ���
//��־λ,ֵΪfalse����δ��һ���༭��,ֵΪtrueΪ�Ѿ���һ���༭��ʼ�༭
var editer_table_cell_tag = false;
//�����༭���ܱ�־,ֵΪtrueʱΪ����༭
var run_edit_flag = false;
//-->
</SCRIPT>

<SCRIPT language = "java script">
<!--
/**
 * �༭�����
 * ����ĳ����Ԫ����Զ���������ݽ������ɱ༭
 * @para tableID ΪҪ�༭��table��id
 * @para noEdiID Ϊ��Ҫ�༭��td��ID,����˵table�ı���
 * ����дΪ<TD id="no_editer">���ɱ༭���</TD>
 * ��ʱ��td���ɱ༭
 */
function editerTableCell(tableId,noEdiId)
{
 var tdObject = event.srcElement;
 var tObject = ((tdObject.parentNode).parentNode).parentNode;
 if(tObject.id == tableId &&tdObject.id != noEdiId&&editer_table_cell_tag == false && run_edit_flag == true)
 {
  tdObject.innerHTML = "<input type=text id=edit_table_txt name=edit_table_txt value="+tdObject.innerText+" size='15' onKeyDown='enterToTab()'>  <input type=button value=' ȷ�� ' onclick='certainEdit()'>";
  edit_table_txt.focus();
  edit_table_txt.select();
  editer_table_cell_tag = true;
  //�޸İ�ť��ʾ��Ϣ
  editTip.innerText = "���ȵ�ȷ����ťȷ���޸�!";  
 }
 else
 {
  return false;
 }
}

/**
 * ȷ���޸�
 */
function certainEdit()
{
 var bObject = event.srcElement;
 var tdObject = bObject.parentNode; 
 var txtObject = tdObject.firstChild;
 tdObject.innerHTML = txtObject.value;
 //����༭���Ѿ��ر�
 editer_table_cell_tag = false;
 //�޸İ�ť��ʾ��Ϣ
 editTip.innerText = "�뵥��ĳ����Ԫ����б༭!";
}

function enterToTab()
{
    if(event.srcElement.type != 'button' && event.srcElement.type != 'textarea'
       && event.keyCode == 13)
    {
        event.keyCode = 9;
    }
}

/**
 * �����Ƿ�༭
 */
function editStart()
{
 if(event.srcElement.value == "��ʼ�༭")
 {
  event.srcElement.value = "�༭���";
  run_edit_flag = true;
 }
 else
 {
  //�����ǰû�б༭��,��༭�ɹ�,����,�޷��ύ
  //���밴ȷ����ť����������ύ
  if(editer_table_cell_tag == false)
  {
   alert("�༭�ɹ�����!");
   event.srcElement.value = "��ʼ�༭";
   run_edit_flag = false;
  }
 }
}

/**
 * ���ݲ�ͬ�İ�ť�ṩ��ͬ����ʾ��Ϣ
 */
function showTip()
{
 if(event.srcElement.value == "�༭���")
 {
  editTip.style.top = event.y + 15;
  editTip.style.left = event.x + 12;
  editTip.style.visibility = "visible";  
 }
 else
 {
  editTip.style.visibility = "hidden";   
 } 
}
-->
</SCRIPT>
<TABLE id="editer_table" width="100%" align="center" 
    onclick="editerTableCell('editer_table','no_editer')">  
    <TR class="TrHead">
  <TD colspan="3" align="center" id="no_editer">���ɱ༭���</TD>  
 </TR>
 <TR>
  <TD width="33%">������ʼ�༭��ť,Ȼ��������Ԫ��༭</TD>
  <TD width="33%">2</TD>
  <TD width="33%">3</TD>
 </TR>
 <TR>
  <TD width="33%">4</TD>
  <TD width="33%">5</TD>
  <TD width="33%">6</TD>
 </TR>
 <TR>
  <TD width="33%">one</TD>
  <TD width="33%">two</TD>
  <TD width="33%">three</TD>
 </TR>
 <TR>
  <TD width="33%">four</TD>
  <TD width="33%">five</TD>
  <TD width="33%">six</TD>
 </TR>  
    <TR class="TrFoot">
  <TD colspan="3" align="center" id="no_editer">
   <INPUT type="button" class="bt" value="��ʼ�༭" onClick="editStart()" onMouseOver="showTip()" onMouseMove="showTip()" onMouseOut="editTip.style.visibility = 'hidden';">
  </TD>
 </TR> 
</TABLE>
</BODY>
<DIV id="editTip">�뵥��ĳ����Ԫ����б༭!</DIV> 
</HTML>
 
 
