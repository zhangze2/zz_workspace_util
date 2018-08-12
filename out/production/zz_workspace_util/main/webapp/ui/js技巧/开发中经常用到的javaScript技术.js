在b/s开发中经常用到的javaScript技术 
一、验证类
1、数字验证内
  1.1 整数
  1.2 大于0的整数 （用于传来的ID的验证)
  1.3 负整数的验证
  1.4 整数不能大于iMax
  1.5 整数不能小于iMin
2、时间类
  2.1 短时间，形如 (13:04:06)
  2.2 短日期，形如 (2003-12-05)
  2.3 长时间，形如 (2003-12-05 13:04:06)
  2.4 只有年和月。形如(2003-05,或者2003-5)
  2.5 只有小时和分钟,形如(12:03)
3、表单类
  3.1 所有的表单的值都不能为空
  3.2 多行文本框的值不能为空。
  3.3 多行文本框的值不能超过sMaxStrleng
  3.4 多行文本框的值不能少于sMixStrleng
  3.5 判断单选框是否选择。
  3.6 判断复选框是否选择.
  3.7 复选框的全选，多选，全不选，反选
  3.8 文件上传过程中判断文件类型
4、字符类
  4.1 判断字符全部由a-Z或者是A-Z的字字母组成
  4.2 判断字符由字母和数字组成。
  4.3 判断字符由字母和数字，下划线,点号组成.且开头的只能是下划线和字母
  4.4 字符串替换函数.Replace();
5、浏览器类
  5.1 判断浏览器的类型
  5.2 判断ie的版本
  5.3 判断客户端的分辨率
  
6、结合类
  6.1 email的判断。
  6.2 手机号码的验证
  6.3 身份证的验证
  

二、功能类

1、时间与相关控件类
  1.1 日历
  1.2 时间控件
  1.3 万年历
  1.4 显示动态显示时钟效果（文本，如OA中时间）
  1.5 显示动态显示时钟效果 (图像，像手表) 
2、表单类
  2.1 自动生成表单
  2.2 动态添加，修改，删除下拉框中的元素
  2.3 可以输入内容的下拉框
  2.4 多行文本框中只能输入iMax文字。如果多输入了，自动减少到iMax个文字（多用于短信发送)
  
3、打印类
  3.1 打印控件
4、事件类
  4.1 屏蔽右键
  4.2 屏蔽所有功能键
  4.3 --> 和<-- F5 F11,F9,F1
  4.4 屏蔽组合键ctrl+N
5、网页设计类
  5.1 连续滚动的文字，图片（注意是连续的，两段文字和图片中没有空白出现）
  5.2 html编辑控件类
  5.3 颜色选取框控件
  5.4 下拉菜单
  5.5 两层或多层次的下拉菜单
  5.6 仿IE菜单的按钮。（效果如rongshuxa.com的导航栏目)
  5.7 状态栏，title栏的动态效果（例子很多，可以研究一下）
  5.8 双击后，网页自动滚屏
6、树型结构。
  6.1 asp+SQL版
  6.2 asp+xml+sql版
  6.3 java+sql或者java+sql+xml
7、无边框效果的制作
8、连动下拉框技术
9、文本排序


一、验证类
1、数字验证内
  1.1 整数
      /^(-|\+)?\d+$/.test(str)
  1.2 大于0的整数 （用于传来的ID的验证)
      /^\d+$/.test(str)
  1.3 负整数的验证
      /^-\d+$/.test(str)
2、时间类
  2.1 短时间，形如 (13:04:06)
      function isTime(str)
      {
        var a = str.match(/^(\d{1,2})(:)?(\d{1,2})\2(\d{1,2})$/);
        if (a == null) {alert('输入的参数不是时间格式'); return false;}
        if (a[1]>24 || a[3]>60 || a[4]>60)
        {
          alert("时间格式不对");
          return false
        }
        return true;
      }
  2.2 短日期，形如 (2003-12-05)
      function strDateTime(str)
      {
         var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
         if(r==null)return false; 
         var d= new Date(r[1], r[3]-1, r[4]); 
         return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
      }
  2.3 长时间，形如 (2003-12-05 13:04:06)
      function strDateTime(str)
      {
        var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/; 
        var r = str.match(reg); 
        if(r==null)return false; 
        var d= new Date(r[1], r[3]-1,r[4],r[5],r[6],r[7]); 
        return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]&&d.getHours()==r[5]&&d.getMinutes()==r[6]&&d.getSeconds()==r[7]);
      }
  2.4 只有年和月。形如(2003-05,或者2003-5)
  2.5 只有小时和分钟,形如(12:03)
3、表单类
  3.1 所有的表单的值都不能为空
      <input onblur="if(this.value.replace(/^\s+|\s+$/g,'')=='')alert('不能为空!')">
  3.2 多行文本框的值不能为空。
  3.3 多行文本框的值不能超过sMaxStrleng
  3.4 多行文本框的值不能少于sMixStrleng
  3.5 判断单选框是否选择。
  3.6 判断复选框是否选择.
  3.7 复选框的全选，多选，全不选，反选
  3.8 文件上传过程中判断文件类型
4、字符类
  4.1 判断字符全部由a-Z或者是A-Z的字字母组成
      <input onblur="if(/[^a-zA-Z]/g.test(this.value))alert('有错')">
  4.2 判断字符由字母和数字组成。
      <input onblur="if(/[^0-9a-zA-Z]/g.test(this.value))alert('有错')">
  4.3 判断字符由字母和数字，下划线,点号组成.且开头的只能是下划线和字母
      /^([a-zA-z_]{1})([\w]*)$/g.test(str)
  4.4 字符串替换函数.Replace();
5、浏览器类
  5.1 判断浏览器的类型
      window.navigator.appName
  5.2 判断ie的版本
      window.navigator.appVersion
  5.3 判断客户端的分辨率
      window.screen.height;  window.screen.width;
  
6、结合类
  6.1 email的判断。
      function ismail(mail)
      {
        return(new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(mail));
      }
  6.2 手机号码的验证
  6.3 身份证的验证
      function isIdCardNo(num)
      {
        if (isNaN(num)) {alert("输入的不是数字！"); return false;}
        var len = num.length, re; 
        if (len == 15)
          re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/);
        else if (len == 18)
          re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\d)$/);
        else {alert("输入的数字位数不对！"); return false;}
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
          if (!B) {alert("输入的身份证号 "+ a[0] +" 里出生日期不对！"); return false;}
        }
        return true;
      }

3.7 复选框的全选，多选，全不选，反选
<form name=hrong>
<input type=checkbox name=All onclick="checkAll('mm')">全选<br/>
<input type=checkbox name=mm onclick="checkItem('All')"><br/>
<input type=checkbox name=mm onclick="checkItem('All')"><br/>
<input type=checkbox name=mm onclick="checkItem('All')"><br/>
<input type=checkbox name=mm onclick="checkItem('All')"><br/>
<input type=checkbox name=mm onclick="checkItem('All')"><br/><br/>


<input type=checkbox name=All2 onclick="checkAll('mm2')">全选<br/>
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

3.8 文件上传过程中判断文件类型
<input type=file onchange="alert(this.value.match(/^(.*)(\.)(.{1,8})$/)[3])">

画图:
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

写注册表：
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

TABLAE相关(客户端动态增加行列）
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

１．身份证严格验证：

<script>
var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}
  
function cidInfo(sId){
 var iSum=0
 var info=""
 if(!/^\d{17}(\d|x)$/i.test(sId))return false;
 sId=sId.replace(/x$/i,"a");
 if(aCity[parseInt(sId.substr(0,2))]==null)return "Error:非法地区";
 sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));
 var d=new Date(sBirthday.replace(/-/g,"/"))
 if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))return "Error:非法生日";
 for(var i = 17;i>=0;i --) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11)
 if(iSum%11!=1)return "Error:非法证号";
 return aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女")
}

document.write(cidInfo("380524198002300016"),"<br/>");
document.write(cidInfo("340524198002300019"),"<br/>")
document.write(cidInfo("340524197711111111"),"<br/>")
document.write(cidInfo("34052419800101001x"),"<br/>");
</script>

２．验证ＩＰ地址
<SCRIPT LANGUAGE="java script">
function isip(s){
 var check=function(v){try{return (v<=255 && v>=0)}catch(x){return false}};
 var re=s.split(".")
 return (re.length==4)?(check(re[0]) && check(re[1]) && check(re[2]) && check(re[3])):false
}

var s="202.197.78.129";
alert(isip(s))
</SCRIPT>

 

３．加sp1后还能用的无边框窗口！！
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

电话号码的验证

要求：
　　(1)电话号码由数字、"("、")"和"-"构成
　　(2)电话号码为3到8位
　　(3)如果电话号码中包含有区号，那么区号为三位或四位
　　(4)区号用"("、")"或"-"和其他部分隔开
　　(5)移动电话号码为11或12位，如果为12位,那么第一位为0
　　(6)11位移动电话号码的第一位和第二位为"13"
　　(7)12位移动电话号码的第二位和第三位为"13"
　　根据这几条规则，可以与出以下正则表达式：
　　(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)


<script language="java script">
function PhoneCheck(s) {
var str=s;
var reg=/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/
alert(reg.test(str));
}
</script>
<input type=text name="iphone">
<input type=button onclick="PhoneCheck(document.all.iphone.value)" value="Check">

具有在输入非数字字符不回显的效果，即对非数字字符的输入不作反应。
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

验证ip 

str=document.RegExpDemo.txtIP.value;
if(/^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/.test(str)==false)
{
 window.alert('错误的IP地址格式');
 document.RegExpDemo.txtIP.select();
 document.RegExpDemo.txtIP.focus();
 return;
}
if(RegExp.$1<1 || RegExp.$1>254||RegExp.$2<0||RegExp.$2>254||RegExp.$3<0||RegExp.$3>254||RegExp.$4<1||RegExp.$4>254)
{
 window.alert('错误的IP地址');
 document.RegExpDemo.txtIP.select();
 document.RegExpDemo.txtIP.focus();
 return;
}
//剔除 如  010.020.020.03 前面 的0 
var str=str.replace(/0(\d)/g,"$1");
str=str.replace(/0(\d)/g,"$1");
window.alert(str);


//一下是取数据的类
//Obj参数指定数据的来源(限定Table),默认第一行为字段名称行
//GetTableData类提供MoveNext方法,参数是表的行向上或向下移动的位数,正数向下移动,负数向上.
//GetFieldData方法获得指定的列名的数据
//Sort_desc方法对指定的列按降序排列
//Sort_asc方法对指定的列按升序排列
//GetData方法返回字段值为特定值的数据数组,提供数据,可以在外部进行其他处理
//Delete方法删除当前记录,数组减少一行
//初始化,Obj:table的名字,Leftlen:左面多余数据长度,Rightlen:右面多余数据长度,
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

 

function sort_desc(){//降序
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

 

function sort_asc(){//升序
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
      for(j=1;j<this.TableData.length;j++){//找出最小的列值
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

具体的例子：http://202.119.73.208/NetEAn/com/test/jsprint.htm

在每个文本框的onblur事件中调用校验代码,并且每个文本框中onKeyDown事件中写一个enter转tab函数

//回车键换为tab
function enterToTab()
{
    if(event.srcElement.type != 'button' && event.srcElement.type != 'textarea'
       && event.keyCode == 13)
    {
        event.keyCode = 9;
    }
}
//JS获取回车事件一。
一。用到onkeydown获取事件动作，
二。用到键盘对应代码keyCode,
三。 var event=arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异，

    <input onkeydown="enterSumbit()" type="text" id="qqnum" class="text"/>  
    <input onclick="queryAward()" type="button" class="btnS" value="提交"/>  

document.onkeydown=function(event){
	var e = event || window.event || arguments.callee.caller.arguments[0];	// 兼容各种浏览器
	if(e && e.keyCode==27){ // 按 Esc 
		//要做的事情
	  }
	if(e && e.keyCode==113){ // 按 F2 
		 //要做的事情
	   }            
	 if(e && e.keyCode==13){ // enter 键
		 //要做的事情
	}
}; 



有时候还需要自由编辑表格---
给大家一个自由编辑表格的小例子,写的有点乱,呵呵:）

//===============================start================================


<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<TITLE>测试修改表格</TITLE>
<STYLE>
/*提示层的样式*/
div
{
  BORDER-RIGHT: #80c144 1px solid;
  BORDER-TOP: #80c144 1px solid;
  VISIBILITY: hidden;
  BORDER-LEFT: #80c144 1px solid;
  CURSOR: default;
  LINE-HEIGHT: 20px;
  BORDER-BOTTOM: #80c144 1px solid;
  FONT-FAMILY: 宋体;
  font-size:12px;
  POSITION: absolute;
  BACKGROUND-COLOR: #f6f6f6;
  TOP:30px;
  LEFT:30px;
}
/*tr的样式*/
tr
{
    font-family: "宋体";
    color: #000000;
    background-color: #C1DBF5;
    font-size: 12px
}
/*table脚注样式*/
.TrFoot
{
    FONT-SIZE: 12px;
    font-family:"宋体", "Verdana", "Arial";
    BACKGROUND-COLOR: #6699CC;
    COLOR:#FFFFFF;
    height: 25;
}
/*trhead属性*/
.TrHead
{
    FONT-SIZE: 13px;
    font-family:"宋体", "Verdana", "Arial";
    BACKGROUND-COLOR: #77AADD;
    COLOR:#FFFFFF;
    height: 25;
}
/*文本框样式*/
INPUT
{
    BORDER-COLOR: #AACEF7 #AACEF7 #AACEF7 #AACEF7;
    BORDER-RIGHT: 1px solid;
    BORDER-TOP: 1px solid;
    BORDER-LEFT: 1px solid;
    BORDER-BOTTOM: 1px solid;
    FONT-SIZE: 12px;
    FONT-FAMILY: "宋体","Verdana";
    color: #000000;
    BACKGROUND-COLOR: #E9EFF5;
}
/*button样式*/
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
<!--全局变量
//标志位,值为false代表未打开一个编辑框,值为true为已经打开一个编辑框开始编辑
var editer_table_cell_tag = false;
//开启编辑功能标志,值为true时为允许编辑
var run_edit_flag = false;
//-->
</SCRIPT>

<SCRIPT language = "java script">
<!--
/**
 * 编辑表格函数
 * 单击某个单元格可以对里面的内容进行自由编辑
 * @para tableID 为要编辑的table的id
 * @para noEdiID 为不要编辑的td的ID,比如说table的标题
 * 可以写为<TD id="no_editer">自由编辑表格</TD>
 * 此时该td不可编辑
 */
function editerTableCell(tableId,noEdiId)
{
 var tdObject = event.srcElement;
 var tObject = ((tdObject.parentNode).parentNode).parentNode;
 if(tObject.id == tableId &&tdObject.id != noEdiId&&editer_table_cell_tag == false && run_edit_flag == true)
 {
  tdObject.innerHTML = "<input type=text id=edit_table_txt name=edit_table_txt value="+tdObject.innerText+" size='15' onKeyDown='enterToTab()'>  <input type=button value=' 确定 ' onclick='certainEdit()'>";
  edit_table_txt.focus();
  edit_table_txt.select();
  editer_table_cell_tag = true;
  //修改按钮提示信息
  editTip.innerText = "请先点确定按钮确认修改!";  
 }
 else
 {
  return false;
 }
}

/**
 * 确定修改
 */
function certainEdit()
{
 var bObject = event.srcElement;
 var tdObject = bObject.parentNode; 
 var txtObject = tdObject.firstChild;
 tdObject.innerHTML = txtObject.value;
 //代表编辑框已经关闭
 editer_table_cell_tag = false;
 //修改按钮提示信息
 editTip.innerText = "请单击某个单元格进行编辑!";
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
 * 控制是否编辑
 */
function editStart()
{
 if(event.srcElement.value == "开始编辑")
 {
  event.srcElement.value = "编辑完成";
  run_edit_flag = true;
 }
 else
 {
  //如果当前没有编辑框,则编辑成功,否则,无法提交
  //必须按确定按钮后才能正常提交
  if(editer_table_cell_tag == false)
  {
   alert("编辑成功结束!");
   event.srcElement.value = "开始编辑";
   run_edit_flag = false;
  }
 }
}

/**
 * 根据不同的按钮提供不同的提示信息
 */
function showTip()
{
 if(event.srcElement.value == "编辑完成")
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
  <TD colspan="3" align="center" id="no_editer">自由编辑表格</TD>  
 </TR>
 <TR>
  <TD width="33%">单击开始编辑按钮,然后点击各单元格编辑</TD>
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
   <INPUT type="button" class="bt" value="开始编辑" onClick="editStart()" onMouseOver="showTip()" onMouseMove="showTip()" onMouseOut="editTip.style.visibility = 'hidden';">
  </TD>
 </TR> 
</TABLE>
</BODY>
<DIV id="editTip">请单击某个单元格进行编辑!</DIV> 
</HTML>
 
 
