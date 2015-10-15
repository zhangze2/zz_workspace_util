 

101.饼图
<style>
v\:*     { behavior: url(#default#VML) }
o\:*     { behavior: url(#default#VML) }
.shape    { behavior: url(#default#VML) }
</style>
<script language="javascript">
function show(pie)
{
pie.strokecolor=pie.fillcolor;
pie.strokeweight=10;
div1.innerHTML="<font size=2 color=red> " + pie.id +"</font> <font size=2>" + pie.title + "</font>";
}
function hide(pie)
{
pie.strokecolor="white";
pie.strokeweight=1;
div1.innerHTML="";
}
</script>
</head>
<body>
<v:group style='width: 5cm; height: 5cm' coordorigin='0,0' coordsize='250,250'>
<v:shape id='asp技术' style='width:10;height:10;top:10;left:0' title='得票数:6 比例:40.00%'

onmouseover='javascript:show(this);' onmouseout='javascript:hide(this);' href='http://www.cnADO.com'

CoordSize='10,10' strokecolor='white' fillcolor='#ffff33'><v:path v='m 300,200 ae

300,200,200,150,0,9437184 xe'/></v:shape>
<v:shape id='php' style='width:10;height:10;top:10;left:0' title='得票数:1 比例:6.67%'

onmouseover='javascript:show(this);' onmouseout='javascript:hide(this);' href='http://www.cnADO.com'

CoordSize='10,10' strokecolor='white' fillcolor='#ff9933'><v:path v='m 300,200 ae

300,200,200,150,9437184,1572864 xe'/></v:shape>
<v:shape id='jsp' style='width:10;height:10;top:10;left:0' title='得票数:2 比例:13.33%'

onmouseover='javascript:show(this);' onmouseout='javascript:hide(this);' href='http://www.cnADO.com'

CoordSize='10,10' strokecolor='white' fillcolor='#3399ff'><v:path v='m 300,200 ae

300,200,200,150,11010048,3145728 xe'/></v:shape>
<v:shape id='c#写的.netWEB程序' style='width:10;height:10;top:10;left:0' title='得票数:3 比例:20.00%'

onmouseover='javascript:show(this);' onmouseout='javascript:hide(this);' href='http://www.cnADO.com'

CoordSize='10,10' strokecolor='white' fillcolor='#99ff33'><v:path v='m 300,200 ae

300,200,200,150,14155776,4718592 xe'/></v:shape>
<v:shape id='vb.net写的.netWEB程序' style='width:10;height:10;top:10;left:0' title='得票数:2 比例:13.33%'

onmouseover='javascript:show(this);' onmouseout='javascript:hide(this);' href='http://www.cnADO.com'

CoordSize='10,10' strokecolor='white' fillcolor='#ff6600'><v:path v='m 300,200 ae

300,200,200,150,18874368,3145728 xe'/></v:shape>
<v:shape id='xml技术' style='width:10;height:10;top:10;left:0' title='得票数:1 比例:6.67%'

onmouseover='javascript:show(this);' onmouseout='javascript:hide(this);' href='http://www.cnADO.com'

CoordSize='10,10' strokecolor='white' fillcolor='#ff99ff'><v:path v='m 300,200 ae

300,200,200,150,22020096,1572864 xe'/></v:shape>
</v:group>

<v:group style='width: 6cm; height: 6cm' coordorigin='0,0' coordsize='250,250'>
<v:rect style='height:10;width:15;top:0;left:10' fillcolor='#ffff33'/>
<v:rect style='height:28;width:100;top:0;left:30' stroked='false'><v:textbox

style='fontsize:2'>asp技术</v:textbox/></v:rect>
<v:rect style='height:10;width:15;top:30;left:10' fillcolor='#ff9933'/>
<v:rect style='height:28;width:100;top:30;left:30' stroked='false'><v:textbox

style='fontsize:2'>php</v:textbox/></v:rect>
<v:rect style='height:10;width:15;top:60;left:10' fillcolor='#3399ff'/>
<v:rect style='height:28;width:100;top:60;left:30' stroked='false'><v:textbox

style='fontsize:2'>jsp</v:textbox/></v:rect>
<v:rect style='height:10;width:15;top:90;left:10' fillcolor='#99ff33'/>
<v:rect style='height:28;width:100;top:90;left:30' stroked='false'><v:textbox

style='fontsize:2'>c#写的.netWEB程序</v:textbox/></v:rect>
<v:rect style='height:10;width:15;top:120;left:10' fillcolor='#ff6600'/>
<v:rect style='height:28;width:100;top:120;left:30' stroked='false'><v:textbox style='fontsize:2'>vb.net

写的.netWEB程序</v:textbox/></v:rect>
<v:rect style='height:10;width:15;top:150;left:10' fillcolor='#ff99ff'/>
<v:rect style='height:28;width:100;top:150;left:30' stroked='false'><v:textbox style='fontsize:2'>xml技术

</v:textbox/></v:rect>
</v:group>

<div style="position: absolute; left: 10; top: 10; width: 760; height:16">
 <table border="1" cellpadding="2" cellspacing="2" cellpadding="0" cellspacing="0"

style="border-collapse: collapse" bordercolor="#CCCCCC" width="100%" ID="Table1">
  <tr>
   <td width="100%" id=div1>　</td>
  </tr>
 </table>
</div>//

102.是一个特殊的容器，想装个网页都行
<button><iframe src="http://www.google.com/"></iframe></button>//button

103.外部的html代码
event.srcElement.outerHTML//

104.标识当前的IE事件的触发器
event.srcElement和event.keyCode//

105.事件类型
event.type//


106.动态改变类型
<style>
.Overnone { border-width:0;background-color:darkblue;cursor:default;color:gold;width:115}
.Outnone   {border-width:0;background-color:white;cursor:default;width:115}
</style>
<input class=Outnone onmouseover=this.className='Overnone' >//

107.页面翻转
<html dir=rtl></html>//

108.滚屏
parent.scroll(x,y);//
<body onload="s=0" onDblClick="s=setInterval('scrollBy(0, 1)',10)" onClick="clearInterval(s)">//

109.改变状态栏
self.status ="";//

110.改变窗口大小
window.resizeTo(200,300);//

111.改变鼠标样式
style
BODY{CURSOR: url('mouse.ani');
SCROLLBAR-BASE-COLOR: #506AA8;
SCROLLBAR-ARROW-COLOR: #14213F;
}//

112.背景透明
<input type="button" value="Button" style="background-color: transparent; border: 0;">//

113.鼠标为等待形状
<input type=button onclick="this.style.cursor='wait'">//

114.调用父窗口的函数
opener.fucntion1();//

115.body的内部html代码
<input type="button" onclick="alert(code.document.body.innerHTML)" value="查看">//

116.框架中调用父窗口的函数
<INPUT TYPE='button' onclick='parent.test();' value='调用parent窗口的函数'>//

117.交换节点
<table  width=200  height=200  border>
<tr><td  id=c1>CELL_1</td></tr>
<tr><td  id=c2>CELL_2</td></tr>
</table>
<br>
<input  type="button"  value="swap  row"  onclick="c1.swapNode(c2)">//

118.删除节点
<table  width=200  height=200  border>
<tr id=trall><td  id=c1>CELL_1</td></tr>
<tr><td  id=c2>CELL_2</td></tr>
</table>
<br>
<input  type="button"  value="swap  row"  onclick="trall.removeNode(c2)">//

119.添加节点
addNode()//

120.获得事件的父与子标签
event.srcElement.children[0]和event.srcElement.parentElement //

 
121.集中为按钮改变颜色
<style>
button{benc:expression(this.onfocus = function(){this.style.backgroundColor='#E5F0FF';})}
</style>
<button>New</button>//


122.判断是左键还是右键被按下
<body onmousedown=if(event.button==1)alert("左键");if(event.button==2)alert("右键")>//

123.获得操作系统的名称和浏览器的名称
document.write(navigator.userAgent)//

 
124.alt/ctrl/shift键按下
event.altKey //按下alt键
event.ctrlKey //按下ctrl键
event.shiftKey //按下shift键

 

125.将当前位置定位为C盘。
{window.location="c:"}//

126.返回输入框的类型
<script>
alert(event.srcElement.type);//
</script>

127.模拟控件的单击事件
<INPUT TYPE="hidden" name="guoguo" onclick="haha()">
<SCRIPT LANGUAGE="JavaScript">
<!--

function haha()
{
 alert();
}
guoguo.click();
//-->
</SCRIPT>//

 
128.取出记录集的列名
java.sql.ResultSet rset = com.bsitc.util.DBAssist.getIT().executeQuery(queryStatement, conn);
java.sql.ResultSetMetaData metaData = rset.getMetaData();
int count = metaData.getColumnCount();
String name = metaData.getColumnName(i);
String value = rset.getString(i);//

129.格式化数字
function format_number(str,digit)
{
 if(isNaN(str))
 {
  alert("您传入的值不是数字！");
  return 0;
 }
 else if(Math.round(digit)!=digit)
 {
  alert("您输入的小数位数不是整数！");
  return 0;
 }
 else
  return Math.round(parseFloat(str)*Math.pow(10,digit))/Math.pow(10,digit);
}

130.回车按钮转化为tab按钮
if(event.keyCode==13) event.keyCode=9; //将

 
131.滚动条滚动
<button onclick="text1.scrollTop=text1.scrollHeight">Scroll</button><br>
<textarea id="text1" cols=50 rows=10>
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
</textarea>//

 
132.判断是什么对象
if(typeof(unknown)=="function")return true;
if(typeof(unknown)!="object")return false;//

 
133.取消文本框自动完成功能
<input type="text" autocomplete="off"> //

134.让下拉框自动下拉
<select onmouseover="javascript:this.size=this.length" onmouseout="javascript:this.size=1">
<option value="">1</option>
<option value="">2</option>
<option value="">3</option>
</select> //

 
135.读取XML文件
var childrenobj=myselect//document.all.myselect;
    var oXMLDoc = new ActiveXObject('MSXML');
    oXMLDoc.url = "mymsg.xml";
    var oRoot=oXMLDoc.root;
    if(oRoot.children != null)
 {
        for(var i=0;i<oRoot.children.item(0).children.length;++i)
  {
            oItem = oRoot.children.item(0).children.item(i);
            oOption = new Option(oItem.text,oItem.value);
   childrenobj.add(oOption);
        }
    }
//mymsg.xml文件
<?xml version="1.0" encoding="gb2312" ?>
<childrenlist>
<aa>
<child value='3301'>杭州地区</child>

<child value='3303'>温州地区</child>

</aa>
<aa>
<child value='3310'>台州地区</child>

<child value='3311'>丽水地区</child>
</aa>
</childrenlist>//

 
136.点击图片，图片停止
<a href="javascript:"><img src="http://www.51js.com/images/51js/red_forum.gif" border="0"></a>//

137.显示本地计算机信息
var WshNetwork = new ActiveXObject("WScript.Network");
alert("Domain = " + WshNetwork.UserDomain);
alert("Computer Name = " + WshNetwork.ComputerName);
alert("User Name = " + WshNetwork.UserName);//

 
138.比较时间
  tDate = new Date(2004,01,08,14,35); //年,月，日，时，分
  dDate = new Date();
  tDate<dDate?alert("早于"):alert("晚于");//

139.弹出鼠标所在处的链结地址
  <body onmouseover="if (event.srcElement.tagName=='A')alert(event.srcElement.href)"><a

href="http://51js.com/viewthread.php?tid=13589" >dddd</a><input>//

140.注意不能通过与 undefined 做比较来测试一个变量是否存在，虽然可以检查它的类型是否为“undefined”。在以

下的代码范例中，假设程序员想测试是否已经声明变量 x ：
// 这种方法不起作用
if (x == undefined)
    // 作某些操作
// 这个方法同样不起作用- 必须检查


// 字符串 "undefined"
if (typeof(x) == undefined)
    // 作某些操作
// 这个方法有效
if (typeof(x) == "undefined")
    // 作某些操作

141.创建具有某些属性的对象
var myObject = new Object();
myObject.name = "James";
myObject.age = "22";
myObject.phone = "555 1234";//

142.枚举（循环）对象的所有属性
for (var a in myObject)
{
    // 显示 "The property 'name' is James"，等等。
    window.alert("The property '" + a + "' is " + myObject[a]);
}//

143.判断一个数字是否是整数
var a=23.2;
alert(a%1==1)//


144.新建日期型变量
var a = new Date(2000, 1, 1);
alert(a.toLocaleDateString());


145.给类定义新的方法
function trim_1()
{
  return this.replace(/(^\s*)|(\s*$)/g, "");
}
String.prototype.trim=trim_1;
alert('cindy'.trim());

 
146.定义一个将日期类型转化为字符串的方法
function guoguo_date()
{
 var tmp1,tmp2;
 tmp1 =this.getMonth()+1+"";
 if(tmp1.length<2)
  tmp1="0"+tmp1;
 tmp2 =this.getDate()+"";
 if(tmp2.length<2)
  tmp2="0"+tmp2;
 
 return this.getYear()+"-"+tmp1+"-"+tmp2;
}
Date.prototype.toLiteString=guoguo_date;
alert(new Date().toLiteString())

 

147. pasta 是有四个参数的构造器,定义对象。
function pasta(grain, width, shape, hasEgg)
{
    // 是用什么粮食做的？
    this.grain = grain;

    // 多宽？（数值）
    this.width = width;    

    // 横截面形状？（字符串）
    this.shape = shape;  

    // 是否加蛋黄？（boolean）
    this.hasEgg = hasEgg; 

    //定义方法
    this.toString=aa;
}
function aa()
{
 ;
}
//定义了对象构造器后，用 new 运算符创建对象实例。
var spaghetti = new pasta("wheat", 0.2, "circle", true);
var linguine = new pasta("wheat", 0.3, "oval", true);
//补充定义属性，spaghetti和linguine都将自动获得新的属性
pasta.prototype.foodgroup = "carbohydrates";

 
148.打印出错误原因
try
{
 x = y   // 产生错误。
}
catch(e)
{
   document.write(e.description)   //打印 "'y' is undefined".
}//

149.生成EXCEL文件并保存
var ExcelSheet;
ExcelApp = new ActiveXObject("Excel.Application");
ExcelSheet = new ActiveXObject("Excel.Sheet");
//本代码启动创建对象的应用程序（在这种情况下，Microsoft Excel 工作表）。一旦对象被创建，就可以用定义的对

象变量在代码中引用它。 在下面的例子中，通过对象变量 ExcelSheet 访问新对象的属性和方法和其他 Excel 对象，

包括 Application 对象和 ActiveSheet.Cells 集合。
// 使 Excel 通过 Application 对象可见。
ExcelSheet.Application.Visible = true;
// 将一些文本放置到表格的第一格中。
ExcelSheet.ActiveSheet.Cells(1,1).Value = "This is column A, row 1";
// 保存表格。
ExcelSheet.SaveAs("C:\\TEST.XLS");
// 用 Application 对象用 Quit 方法关闭 Excel。
ExcelSheet.Application.Quit();//

150.根据标签获得一组对象
var coll = document.all.tags("DIV");
if (coll!=null)
{
for (i=0; i<coll.length; i++)
...
}//


151.实现打印预览及打印
<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height=0 id=wb name=wb width=0></OBJECT>
<input type=button value=打印预览 onclick="wb.execwb(7,1)">
<input type=button onClick=document.all.wb.ExecWB(6,1) value="打印">//

152.不通过form，直接通过名字引用对象
<INPUT TYPE="text" NAME="gg" value=aaaaa>
<SCRIPT LANGUAGE="JavaScript">
<!--
alert(document.all.gg.value)
//-->
</SCRIPT>//

153.使鼠标滚轮失效
function document.onmousewheel()
{
 return false;
}//
 
154.创建弹出窗口
<SCRIPT LANGUAGE="JScript">
  var oPopup = window.createPopup();
  var oPopupBody = oPopup.document.body;
  oPopupBody.innerHTML = "Display some <B>HTML</B> here.";
  oPopup.show(100, 100, 200, 50, document.body);
</SCRIPT>//

155.取得鼠标所在处的对象
var obj = document.elementFromPoint(event.x,event.y);//

156.获得左边的对象
<INPUT TYPE="text" NAME="gg"><INPUT TYPE="text" NAME="bb"

onclick="this.previousSibling.value='guoguo'">//

157.定位鼠标
document.all.hint_layer.style.left  = event.x+document.body.scrollLeft+10;
document.all.hint_layer.style.top  = event.y+document.body.scrollTop+10;//

158.向下拉框指定位置添加项目
var op  = document.createElement("OPTION");
document.all.selected_items.children(index).insertAdjacentElement("BeforeBegin",op);
op.text  = document.all.all_items[i].text;
op.value = document.all.all_items[i].value;//

 
159.判断一个窗口是否已经打开，如果已经打开，则关闭之
var a;
if(a)
 a.close();
else
 a=window.open('','','');//

160.动态创建一个标签
newElem  = document.createElement("DIV");
newElem.id = "hint_layer";
document.body.appendChild(newElem);
document.all.hint_layer.innerText="guoguo";//

161.标题栏
document.title//

162.背景图片
<body style="BACKGROUND-ATTACHMENT: fixed" background="img/bgfix.gif" ></body>//背景图片不动

<STYLE TYPE="text/css">
<!--
BODY {background-image:img/bgchild.jpg;
background-position: center;
background-repeat: no-repeat;
background-attachment: fixed;}
-->
</STYLE>//背景图片居中

163.设置透明效果
document.form.xxx.filters.alpha.opacity=0～100//

164.定义方法
var dragapproved=false;
document.onmouseup=new Function("dragapproved = false");//
 
165.将数字转化为人民币大写形式
function convertCurrency(currencyDigits) {
// Constants:
 var MAXIMUM_NUMBER = 99999999999.99;
 // Predefine the radix characters and currency symbols for output:
 var CN_ZERO = "零";
 var CN_ONE = "壹";
 var CN_TWO = "贰";
 var CN_THREE = "叁";
 var CN_FOUR = "肆";
 var CN_FIVE = "伍";
 var CN_SIX = "陆";
 var CN_SEVEN = "柒";
 var CN_EIGHT = "捌";
 var CN_NINE = "玖";
 var CN_TEN = "拾";
 var CN_HUNDRED = "佰";
 var CN_THOUSAND = "仟";
 var CN_TEN_THOUSAND = "万";
 var CN_HUNDRED_MILLION = "亿";
 var CN_SYMBOL = "人民币";
 var CN_DOLLAR = "元";
 var CN_TEN_CENT = "角";
 var CN_CENT = "分";
 var CN_INTEGER = "整";
 
// Variables:
 var integral; // Represent integral part of digit number.
 var decimal; // Represent decimal part of digit number.
 var outputCharacters; // The output result.
 var parts;
 var digits, radices, bigRadices, decimals;
 var zeroCount;
 var i, p, d;
 var quotient, modulus;
 
// Validate input string:
 currencyDigits = currencyDigits.toString();
 if (currencyDigits == "") {
  alert("Empty input!");
  return "";
 }
 if (currencyDigits.match(/[^,.\d]/) != null) {
  alert("Invalid characters in the input string!");
  return "";
 }
 if ((currencyDigits).match(/^((\d{1,3}(,\d{3})*(.((\d{3},)*\d{1,3}))?)|(\d+(.\d+)?))$/) == null) {
  alert("Illegal format of digit number!");
  return "";
 }
 
// Normalize the format of input digits:
 currencyDigits = currencyDigits.replace(/,/g, ""); // Remove comma delimiters.
 currencyDigits = currencyDigits.replace(/^0+/, ""); // Trim zeros at the beginning.
 // Assert the number is not greater than the maximum number.
 if (Number(currencyDigits) > MAXIMUM_NUMBER) {
  alert("Too large a number to convert!");
  return "";
 }
 
// Process the coversion from currency digits to characters:
 // Separate integral and decimal parts before processing coversion:
 parts = currencyDigits.split(".");
 if (parts.length > 1) {
  integral = parts[0];
  decimal = parts[1];
  // Cut down redundant decimal digits that are after the second.
  decimal = decimal.substr(0, 2);
 }
 else {
  integral = parts[0];
  decimal = "";
 }
 // Prepare the characters corresponding to the digits:
 digits = new Array(CN_ZERO, CN_ONE, CN_TWO, CN_THREE, CN_FOUR, CN_FIVE, CN_SIX, CN_SEVEN, CN_EIGHT,

CN_NINE);
 radices = new Array("", CN_TEN, CN_HUNDRED, CN_THOUSAND);
 bigRadices = new Array("", CN_TEN_THOUSAND, CN_HUNDRED_MILLION);
 decimals = new Array(CN_TEN_CENT, CN_CENT);
 // Start processing:
 outputCharacters = "";
 // Process integral part if it is larger than 0:
 if (Number(integral) > 0) {
  zeroCount = 0;
  for (i = 0; i < integral.length; i++) {
   p = integral.length - i - 1;
   d = integral.substr(i, 1);
   quotient = p / 4;
   modulus = p % 4;
   if (d == "0") {
    zeroCount++;
   }
   else {
    if (zeroCount > 0)
    {
     outputCharacters += digits[0];
    }
    zeroCount = 0;
    outputCharacters += digits[Number(d)] + radices[modulus];
   }
   if (modulus == 0 && zeroCount < 4) {
    outputCharacters += bigRadices[quotient];
   }
  }
  outputCharacters += CN_DOLLAR;
 }
 // Process decimal part if there is:
 if (decimal != "") {
  for (i = 0; i < decimal.length; i++) {
   d = decimal.substr(i, 1);
   if (d != "0") {
    outputCharacters += digits[Number(d)] + decimals[i];
   }
  }
 }
 // Confirm and return the final output string:
 if (outputCharacters == "") {
  outputCharacters = CN_ZERO + CN_DOLLAR;
 }
 if (decimal == "") {
  outputCharacters += CN_INTEGER;
 }
 outputCharacters = CN_SYMBOL + outputCharacters;
 return outputCharacters;
}//

 
166.xml数据岛绑定表格
<html>
<body>
<xml id="abc" src="test.xml"></xml>
<table border='1' datasrc='#abc'>
<thead>
<td>接收人</td>
<td>发送人</td>
<td>主题</td>
<td>内容</td>
</thead>
<tfoot>
<tr><th>表格的结束</th></tr>
</tfoot>
<tr>
<td><div datafld="to"></div></td>
<td><div datafld="from"></div></td>
<td><div datafld="subject"></div></td>
<td><div datafld="content"></div></td>
</tr>
</table>
</body>
</html>

//cd_catalog.xml
<?xml version="1.0" encoding="ISO-8859-1" ?>
 <!--  Edited with XML Spy v4.2
  -->
 <CATALOG>
 <CD>
  <TITLE>Empire Burlesque</TITLE>
  <ARTIST>Bob Dylan</ARTIST>
  <COUNTRY>USA</COUNTRY>
  <COMPANY>Columbia</COMPANY>
  <PRICE>10.90</PRICE>
  <YEAR>1985</YEAR>
  </CD>
 <CD>
  <TITLE>Hide your heart</TITLE>
  <ARTIST>Bonnie Tyler</ARTIST>
  <COUNTRY>UK</COUNTRY>
  <COMPANY>CBS Records</COMPANY>
  <PRICE>9.90</PRICE>
  <YEAR>1988</YEAR>
  </CD>
 <CD>
  <TITLE>Greatest Hits</TITLE>
  <ARTIST>Dolly Parton</ARTIST>
  <COUNTRY>USA</COUNTRY>
  <COMPANY>RCA</COMPANY>
  <PRICE>9.90</PRICE>
  <YEAR>1982</YEAR>
  </CD>
 <CD>
  <TITLE>Still got the blues</TITLE>
  <ARTIST>Gary Moore</ARTIST>
  <COUNTRY>UK</COUNTRY>
  <COMPANY>Virgin records</COMPANY>
  <PRICE>10.20</PRICE>
  <YEAR>1990</YEAR>
  </CD>
</CATALOG>
//


167.以下组合可以正确显示汉字
================================
xml保存编码 xml页面指定编码
ANSI  gbk/GBK、gb2312
Unicode  unicode/Unicode
UTF-8  UTF-8
================================

 
168.XML操作
<xml id="xmldata" src="/data/books.xml">
<div id="guoguo"></div>
<script>
var x=xmldata.recordset //取得数据岛中的记录集
if(x.absoluteposition < x.recordcount) //如果当前的绝对位置在最后一条记录之前
{
 x.movenext();     //向后移动
 x.moveprevious();    //向前移动
 x.absoluteposition=1;   //移动到第一条记录
 x.absoluteposition=x.recordcount;//移动到最后一条记录，注意记录集x.absoluteposition是从1到记录集记录的个

数的
 guoguo.innerText=xmldso.recordset("field_name"); //从中取出某条记录
}
</script>

169.动态修改CSS的另一种方式
this.runtimeStyle.cssText = "color:#990000;border:1px solid #cccccc";//

170.正则表达式
匹配中文字符的正则表达式： [\u4e00-\u9fa5]

匹配双字节字符(包括汉字在内)：[^\x00-\xff]

应用：计算字符串的长度（一个双字节字符长度计2，ASCII字符计1）

String.prototype.len=function(){return this.replace([^\x00-\xff]/g,"aa").length;}

匹配空行的正则表达式：\n[\s| ]*\r

匹配HTML标记的正则表达式：/<(.*)>.*<\/\1>|<(.*) \/>/

匹配首尾空格的正则表达式：(^\s*)|(\s*$)

应用：javascript中没有像vbscript那样的trim函数，我们就可以利用这个表达式来实现，如下：

String.prototype.trim = function()
{
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

////////利用正则表达式分解和转换IP地址：

下面是利用正则表达式匹配IP地址，并将IP地址转换成对应数值的Javascript程序：

function IP2V(ip)
{
 re=/(\d+)\.(\d+)\.(\d+)\.(\d+)/g  //匹配IP地址的正则表达式
if(re.test(ip))
{
return RegExp.$1*Math.pow(255,3))+RegExp.$2*Math.pow(255,2))+RegExp.$3*255+RegExp.$4*1
}
else
{
 throw new Error("Not a valid IP address!")
}
}

不过上面的程序如果不用正则表达式，而直接用split函数来分解可能更简单，程序如下：

var ip="10.100.20.168"
ip=ip.split(".")
alert("IP值是："+(ip[0]*255*255*255+ip[1]*255*255+ip[2]*255+ip[3]*1))

匹配Email地址的正则表达式：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*

匹配网址URL的正则表达式：http://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?

//////////利用正则表达式去除字串中重复的字符的算法程序：

var s="abacabefgeeii"
var s1=s.replace(/(.).*\1/g,"$1")
var re=new RegExp("["+s1+"]","g")
var s2=s.replace(re,"")
alert(s1+s2)  //结果为：abcefgi

思路是使用后向引用取出包括重复的字符，再以重复的字符建立第二个表达式，取到不重复的字符，两者串连。这个方

法对于字符顺序有要求的字符串可能不适用。

//////////得用正则表达式从URL地址中提取文件名的javascript程序，如下结果为page1

s="http://www.9499.net/page1.htm"
s=s.replace(/(.*\/){0,}([^\.]+).*/ig,"$2")
alert(s)

/////////利用正则表达式限制网页表单里的文本框输入内容：

用正则表达式限制只能输入中文：onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"

onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,'')

)"

用正则表达式限制只能输入全角字符： onkeyup="value=value.replace(/[^\uFF00-\uFFFF]/g,'')"

onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\uFF00-\uFFFF]/g,'')

)"

用正则表达式限制只能输入数字：onkeyup="value=value.replace(/[^\d]/g,'')

"onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"

用正则表达式限制只能输入数字和英文：onkeyup="value=value.replace(/[\W]/g,'')

"onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"

 
171.设置和使用cookie
<HTML>
<BODY>
设置与读取 cookies...<BR>
写入cookie的值<input type=text name=gg>
<INPUT TYPE = BUTTON Value = "设置cookie" onClick = "Set()">
<INPUT TYPE = BUTTON Value = "读取cookie" onClick = "Get()"><BR>
<INPUT TYPE = TEXT NAME = Textbox>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
function Set()
{
var Then = new Date()
Then.setTime(Then.getTime() + 60*1000 ) //60秒
document.cookie = "Cookie1="+gg.value+";expires="+ Then.toGMTString()
}

function Get()
{
 var cookieString = new String(document.cookie)
 var cookieHeader = "Cookie1="
 var beginPosition = cookieString.indexOf(cookieHeader)
 if (beginPosition != -1)
 {
  document.all.Textbox.value = cookieString.substring(beginPosition  + cookieHeader.length)
 }
 else
  document.all.Textbox.value = "Cookie 未找到!"
}
</SCRIPT>
</HTML>//

 
172.取月的最后一天
function getLastDay(year,month)
{
 //取年
 var new_year = year;
 //取到下一个月的第一天,注意这里传入的month是从1～12
 var new_month = month++;
 //如果当前是12月，则转至下一年
 if(month>12)
 {
  new_month -=12;
  new_year++;
 }
 var new_date = new Date(new_year,new_month,1);
 return (new Date(new_date.getTime()-1000*60*60*24)).getDate();
}//

173.判断当前的焦点是组中的哪一个
for(var i=0;i<3;i++)
 if(event.srcElement==bb[i])
  break;//

 

174.实现类
package com.baosight.view.utils;
import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.http.HttpSession;
public class Mytag extends TagSupport
{
  public int doStartTag() throws javax.servlet.jsp.JspException
  {
    boolean canAccess = false;
    HttpSession session= pageContext.getSession();
    if (canAccess)
    {
      return EVAL_BODY_INCLUDE;
    }
    else
    {
      return this.SKIP_BODY;
    }
  }
}

175.在web.xml中添加定义
  <taglib>
    <taglib-uri>guoguo</taglib-uri>
    <taglib-location>/WEB-INF/abc.tld</taglib-location>
  </taglib>


176.标签库中定义abc.tld
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE taglib PUBLIC "-//Sun Microsystems, Inc.//DTD JSP Tag Library 1.1//EN"
"http://java.sun.com/j2ee/dtds/web-jsptaglibrary_1_1.dtd">
<taglib>
 <tlibversion>1.0</tlibversion>
 <jspversion>1.1</jspversion>
 <shortname>hr</shortname>
 <uri>guoguo</uri>
 <info>Extra 3 Tag Library</info>
 <tag>
  <name>mytag</name>
  <tagclass>com.baosight.view.utils.Mytag</tagclass>
  <attribute>
   <name>id2</name>
   <required>true</required>
            <rtexprvalue>true</rtexprvalue>
  </attribute>
 </tag>
</taglib>


177.在使用自定义标签的页面中加入自己定义的标签，
<%@ taglib uri="guoguo" prefix="guoguo" %>
//自己定义标签

 
178.显示带边框的集
<fieldset style="border:1px gray solid;width:100px">
  <legend>查询条件</legend>
dfdfdf
</fieldset>//


179.【文件(F)】菜单中的命令的实现
179.【文件(F)】菜单中的命令的实现

1、〖打开〗命令的实现
[格式]:document.execCommand("open")
[说明]这跟VB等编程设计中的webbrowser控件中的命令有些相似，大家也可依此琢磨琢磨。
[举例]在<body></body>之间加入：
<a href="###" onclick=document.execCommand("open")>打开</a>

2、〖使用 记事本 编辑〗命令的实现
[格式]:location.replace("view-source:"+location)
[说明]打开记事本，在记事本中显示该网页的源代码。
[举例]在<body></body>之间加入：
<a href="###" onclick=location.replace("view-source:"+location)>使用 记事本编辑</a>

3、〖另存为〗命令的实现
[格式]:document.execCommand("saveAs")
[说明]将该网页保存到本地盘的其它目录！
[举例]在<body></body>之间加入：
<a href="###" onclick=document.execCommand("saveAs")>另存为</a>

4、〖打印〗命令的实现
[格式]:document.execCommand("print")
[说明]当然，你必须装了打印机！
[举例]在<body></body>之间加入：
<a href="###" onclick=document.execCommand("print")>打印</a>

5、〖关闭〗命令的实现
[格式]:window.close();return false
[说明]将关闭本窗口。
[举例]在<body></body>之间加入：
<a href="###" onclick=window.close();return false)>关闭本窗口</a>

180.【编辑(E)】菜单中的命令的实现

〖全选〗命令的实现
[格式]:document.execCommand("selectAll")
[说明]将选种网页中的全部内容！
[举例]在<body></body>之间加入：
<a href="###" onclick=document.execCommand("selectAll")>全选</a>

181.【查看(V)】菜单中的命令的实现

1、〖刷新〗命令的实现
[格式]:location.reload() 或 history.go(0)
[说明]浏览器重新打开本页。
[举例]在<body></body>之间加入：
<a href="###" onclick=location.reload()>刷新</a>
或加入:
<a href="###" onclick=history.go(0)>刷新</a>

2、〖源文件〗命令的实现
[格式]:location.replace("view-source:"+location)
[说明]查看该网页的源代码。
[举例]在<body></body>之间加入：
<a href="###" onclick=location.replace("view-source:"+location)>查看源文件</a>

3、〖全屏显示〗命令的实现
[格式]:window.open(document.location, "url", "fullscreen")
[说明]全屏显示本页。
[举例]在<body></body>之间加入：
<a href="###" onclick=window.open(document.location,"url","fullscreen")>全屏显示</a>

182.【收藏(A)】菜单中的命令的实现

1、〖添加到收藏夹〗命令的实现
[格式]:window.external.AddFavorite('url', '“网站名”)
[说明]将本页添加到收藏夹。
[举例]在<body></body>之间加入：
<a href="javascript:window.external.AddFavorite('http://oh.jilinfarm.com', '胡明新的个人主页')">添加到收

藏夹</a>

2、〖整理收藏夹〗命令的实现
[格式]:window.external.showBrowserUI("OrganizeFavorites",null)
[说明]打开整理收藏夹对话框。
[举例]在<body></body>之间加入：
<a href="###" onclick=window.external.showBrowserUI("OrganizeFavorites",null)>整理收藏夹</a>

183.【工具(T)】菜单中的命令的实现

〖internet选项〗命令的实现
[格式]:window.external.showBrowserUI("PrivacySettings",null)
[说明]打开internet选项对话框。
[举例]在<body></body>之间加入：
<a href="###" onclick=window.external.showBrowserUI("PrivacySettings",null)>internet选项</a>

184.【工具栏】中的命令的实现

1、〖前进〗命令的实现
[格式]history.go(1) 或 history.forward()
[说明]浏览器打开后一个页面。
[举例]在<body></body>之间加入：
<a href="###" onclick=history.go(1)>前进</a>
或加入:
<a href="###" onclick=history.forward()>前进</a>

2、〖后退〗命令的实现
[格式]:history.go(-1) 或 history.back()
[说明]浏览器返回上一个已浏览的页面。
[举例]在<body></body>之间加入：
<a href="###" onclick=history.go(-1)>后退</a>
或加入:
<a href="###" onclick=history.back()>后退</a>

3、〖刷新〗命令的实现
[格式]:document.reload() 或 history.go(0)
[说明]浏览器重新打开本页。
[举例]在<body></body>之间加入：
<a href="###" onclick=location.reload()>刷新</a>
或加入:
<a href="###" onclick=history.go(0)>刷新</a>

185.其它命令的实现
〖定时关闭本窗口〗命令的实现
[格式]:settimeout(window.close(),关闭的时间)
[说明]将关闭本窗口。
[举例]在<body></body>之间加入：
<a href="###" onclick=settimeout(window.close(),3000)>3秒关闭本窗口</a>


【附】为了方便读者，下面将列出所有实例代码，你可以把它们放到一个html文件中，然后预览效果。
<a href="###" onclick=document.execCommand("open")>打开</a><br>
<a href="###" onclick=location.replace("view-source:"+location)>使用 记事本编辑</a><br>
<a href="###" onclick=document.execCommand("saveAs")>另存为</a><br>
<a href="###" onclick=document.execCommand("print")>打印</a><br>
<a href="###" onclick=window.close();return false)>关闭本窗口</a><br>
<a href="###" onclick=document.execCommand("selectAll")>全选</a><br>
<a href="###" onclick=location.reload()>刷新</a> <a href="###" onclick=history.go(0)>刷新</a><br>
<a href="###" onclick=location.replace("view-source:"+location)>查看源文件</a><br>
<a href="###" onclick=window.open(document.location,"url","fullscreen")>全屏显示</a><br>
<a href="javascript:window.external.AddFavorite('http://homepage.yesky.com', '天极网页陶吧')">添加到收藏

夹</a><br>
<a href="###" onclick=window.external.showBrowserUI("OrganizeFavorites",null)>整理收藏夹</a><br>
<a href="###" onclick=window.external.showBrowserUI("PrivacySettings",null)>internet选项</a><br>
<a href="###" onclick=history.go(1)>前进1</a>　<a href="###" onclick=history.forward()>前进2</a><br>
<a href="###" onclick=history.go(-1)>后退1</a>　<a href="###" onclick=history.back()>后退2</a><br>
<a href="###" onclick=settimeout(window.close(),3000)>3秒关闭本窗口</a><br>

 
186.给DHTML中的标签添加一个新的属性，可以随意加
<BODY onload="alert(a1.epass)">
<input type=text name="a1" epass="zhongguo">
</BODY>//

 
187.xmlhttp技术
<BODY> 此方法是通过XMLHTTP对象从服务器获取XML文档，示例如下。
 <input type=button value="加载XML文档" onclick="getData('data.xml')" >
 <script language="JavaScript" >
 function getDatal(url){
 var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");//创建XMLHTTPRequest对象
 xmlhttp.open("GET",url,false,"","");//使用HTTP GET初始化HTTP请求
 xmlhttp.send("");//发送HTTP请求并获取HTTP响应
 return xmlhttp.responseXML;//获取XML文档
 }
 </script >
</BODY>//

188.服务器端通过request.getReader()获得传入的字符串

189.在java中使用正则表达式
java.util.regex.Pattern p =

java.util.regex.Pattern.compile("\\d+|.\\d+|\\d+.\\d*|(E|\\d+E|.\\d+E|\\d+.\\d*E)((\\+|-)\\d|\\d)\\d*");
java.util.regex.Matcher m = p.matcher("12.E+3");
boolean result = m.matches();//

 
190.给下拉框分组
<SELECT>
<OPTGROUP LABEL="碱性金属">
<OPTION>锂 (Li)</OPTION>
<OPTION>纳 (Na)</OPTION>
<OPTION>钾 (K)</OPTION>
</OPTGROUP>
<OPTGROUP LABEL="卤素">
<OPTION>氟 (F)</OPTION>
<OPTION>氯 (Cl)</OPTION>
<OPTION>溴 (Br)</OPTION>
</OPTGROUP>
</SELECT>//

191.加注音
<RUBY>
基准文本
<RT>注音文本
</RUBY>//

 
192.加删除线
<S>此文本将带删除线显示。</S>//

193.取frame中的event事件
document.frames("workspace").event.keyCode//

194.是弹出方法的定义
String.prototype.trim=function()
{
 return this.replace(/(^\s*)|(\s*$)/g, "");
}
alert("  ".trim)//
 

195.防止网页被包含
if (window != window.top)
top.location.href = location.href;//

 
196.让网页一直在frame里面
if(window==window.top)
{
 document.body.innerHTML="<center><h1>请通过正常方式访问本页面！</h1></center>";
 //window.close();
}//

 
197.加为首页
<SCRIPT>
function fnSet(){
oHomePage.setHomePage(location.href);
event.returnValue = false;
}
</SCRIPT>
<IE:HOMEPAGE ID="oHomePage" style="behavior:url(#default#homepage)"/>//

 
198.xml数据岛操作
<HTML>
  <HEAD><Title>HTML中的数据岛中的记录集</Title></HEAD>
  <body bkcolor=#EEEEEE text=blue bgcolor="#00FFFF">
  <Table align=center width="100%"><TR><TD align="center">
  <h5><b><font size="4" color="#FF0000">HTML中的XML数据岛记录编辑与添加    </font></b></h5>
  </TD></TR></Table>
  <HR>
  酒店名称：<input type=text datasrc=#theXMLisland DataFLD=NAME size="76"><BR>
  地址：<input type=text datasrc=#theXMLisland DataFLD=Address size="76"><BR>
  主页：<input type=text datasrc=#theXMLisland DataFLD=HomePage size="76"><BR>
  电子邮件：<input type=text datasrc=#theXMLisland DataFLD=E-Mail size="76"><BR>
  电话：<input type=text datasrc=#theXMLisland DataFLD=TelePhone size="76"><BR>
  级别：<input type=text datasrc=#theXMLisland DataFLD=Grade size="76"><HR>
  <input id="first" TYPE=button value="<<　第一条记录"     onclick="theXMLisland.recordset.moveFirst()">
  <input id="prev" TYPE=button value="<上一条记录"   onclick="theXMLisland.recordset.movePrevious()"> 
  <input id="next" TYPE=button value="下一条记录>" onclick="theXMLisland.recordset.moveNext()"> 
  <input id="last" TYPE=button value="最后一条记录>>" onclick="theXMLisland.recordset.moveLast()">&nbsp; 
  <input id="Add" TYPE=button value="添加新记录" onclick="theXMLisland.recordset.addNew()"> 

  <XML ID="theXMLisland">
  <HotelList>
  <Hotel>
  <Name>四海大酒店</Name>
  <Address>海魂路1号</Address>
  <HomePage>www.sihaohotel.com.cn</HomePage>
  <E-Mail>master@sihaohotel.com.cn</E-Mail>
  <TelePhone>(0989)8888888</TelePhone>
  <Grade>五星级</Grade>
  </Hotel>
  <Hotel>
  <Name>五湖宾馆</Name>
  <Address>东平路99号</Address>
  <HomePage>www.wuhu.com.cn</HomePage>
  <E-Mail>web@wuhu.com.cn</E-Mail>
  <TelePhone>(0979)1111666</TelePhone>
  <Grade>四星级</Grade>
  </Hotel>
  <Hotel>
  <Name>“大沙漠”宾馆</Name>
  <Address>留香路168号</Address>
  <HomePage>www.dashamohotel.com.cn</HomePage>
  <E-Mail>master@dashamohotel.com.cn</E-Mail>
  <TelePhone>(0989)87878788</TelePhone>
  <Grade>五星级</Grade>
  </Hotel>
  <Hotel>
  <Name>“画眉鸟”大酒店</Name>
  <Address>血海飘香路2号</Address>
  <HomePage>www.throstlehotel.com.cn</HomePage>
  <E-Mail>chuliuxiang@throstlehotel.com.cn</E-Mail>
  <TelePhone>(099)9886666</TelePhone>
  <Grade>五星级</Grade>
  </Hotel>
  </HotelList>
  </XML>

  </body> 
  </HTML> //xml数据岛中添加记录
  199.模式窗口
父窗口
var url="aaa.jsp";
var

data=showModalDialog(url,null,"dialogHeight:400px;dialogHeight:600px;center:yes;help:No;status:no;resizab

le:Yes;edge:sunken");
if(data)
 alert(data.value);
 
子窗口
var data=new Object();
data.value1="china";
window.returnValue=data;
window.close();

 
200.动态设置事件，带参数
<INPUT TYPE="text" NAME="a1">
<SCRIPT LANGUAGE="JavaScript">
<!--
function hah(para)
{
 alert(para)
}
a1.onclick=function()
{
 hah('canshu ')
}
//a1.attachEvent("onclick",function(){hah('参数')});
//-->
</SCRIPT>//

 
201.将url转化为16进制形式
 var ret = '';

 for(var i=0; i < str.length; i++)
 {
  var ch = str.charAt(i);
  var code = str.charCodeAt(i);

  if(code < 128 && ch != '[' && ch != '\'' && ch != '=')
  {
   ret += ch;
  }
  else
  {
   ret += "[" + code.toString(16) + "]";
  }
 }
 return ret;//
 

202.打开新的窗口并将新打开的窗口设置为活动窗口
var newWin=window.open("xxxx");
newWin.focus();//

 
203.容错脚本
JS中遇到脚本错误时不做任何操作:window.onerror = doNothing;
指定错误句柄的语法为:window.onerror = handleError
function handleError(message, URI, line)
{// 提示用户，该页可能不能正确回应
return true; // 这将终止默认信息
}//在页面出错时进行操作

204.JS中的窗口重定向:
window.navigate("http://www.sina.com.cn");//

205.防止链接文字折行
document.body.noWrap=true;//

206.判断字符是否匹配.
string.match(regExpression)//

207.
href="javascript:document.Form.Name.value='test';void(0);"//不能用onClick="javacript:document.Form.Name.v

alue='test';return false;"

当使用inline方式添加事件处理脚本事，有一个被包装成匿名函数的过程，也就是说
onClick="javacript:document.Form.Name.value='test';return false;"被包装成了：
functoin anonymous()
{
    document.Form.Name.value='test';return false;
}
做为A的成员函数onclick。
而href="javascript:document.Form.Name.value='test';void(0);"相当于执行全局语句，这时如果使用return语句会

报告在函数外使用return语句的错误。


208.进行页面放大
<P onmouseover="this.style.zoom='200%'" onmouseout="this.style.zoom='normal'">
sdsdsdsdsdsdsdsds
</p>//

209.放置在页面的最右边
<input type="text" value='bu2'  style="float:right">//

210.通过style来控制隔行显示不同颜色
<style>
tr{
bgcolor:expression(this.bgColor=((this.rowIndex)%2==0 )? 'white' : 'yellow');
}
</style>
<table id="oTable" width="100" border="1" style="border-collapse:collapse;">
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>//

211.全屏最大化
newwindow=window.open("","","scrollbars")
if (document.all)
{
 newwindow.moveTo(0,0)
 newwindow.resizeTo(screen.width,screen.height)
}//

212.根据名字解析xml中的节点值
var XMLDoc=new ActiveXObject("MSXML");
XMLDoc.url="d:/abc.xml";
aRoot=XMLDoc.root;
a1.innerText=aRoot.children.item("name").text;//

 
213.在页面上解析xml的值
http://msdn.microsoft.com/library/default.asp?url=/library/en-us/xmlsdk/html/5996c682-3472-4b03-9fb0-1e08

fcccdf35.asp
//

214.看一个字符串里面有多少个回车符，返回值是一个数组
var s=value.match(/\n/g);if(s)if(s.length==9){alert('10行了');return false;}//

215.获得asc码
var s='aa';
alert(s.charCodeAt(1))//
 
216.文字居右对齐
<input type="text" value="123" style="text-align:right">//

217.判断一个方法是否存在
function pageCallback(response){
 alert(response);
}
if(pageCallback)
 alert(1)//

 
218.判断一个变量是否定义
if(typeof(a)=="undefined")
{
 alert()
}//

 
219.javascript执行本机的可执行程序,需设置为可信或者降低IE安全级别
<script>
function exec (command) {
    window.oldOnError = window.onerror;
    window._command = command;
    window.onerror = function (err) {
      if (err.indexOf('utomation') != -1) {
        alert('命令已经被用户禁止！');
        return true;
      }
      else return false;
    };
    var wsh = new ActiveXObject('WScript.Shell');
    if (wsh)
      wsh.Run(command);
    window.onerror = window.oldOnError;
  }
</script>
调用方式
<a href="javascript:" onclick="exec('D:/test.bat')">测试</a>//
 
220.弹出新页面，关闭旧页面，不弹出提示框
 var w=screen.availWidth-10;
   var h=screen.availHeight-10;
   var swin=window.open("/mc/mc/message_management.jsp",

"BGSMbest","scrollbars=yes,status,location=0,menubar=0,toolbar=0,resizable=no,top=0,left=0,height="+h+",w

idth="+w);
   window.opener=null;
   window.close();//

221.能输入的下拉框
<span>
<input name="Department1" id="Department1" style=" border-right:0;width:130" autocomplete="off">
<span style="width:150;overflow:hidden">
<select  style="width:150;margin-left:-130" onChange="Department1.value=value">
<option value=""></option>
<option value="asdfasfadf">asdfasfadf</option>
<option value="546546">546546</option></select> //

 
222.在方法中定义全局变量
function globalVar (script) {
        eval(script);//all navigators
  //window.execScript(script); //for ie only
}
globalVar('window.haha = "../system";');
alert(haha);//在方法中定义全局变量，其中的haha就是全局变量了

223.显示一个对象的全部的属性和属性的值
var a=new Object();
a.name='a1';
a.***='mail'
for(var p in a)
{
 alert(p+"="+a[p])
}//

 
224.16进制转换成10进制
var n = parseInt("2AE",16);//这里将16进制的 2AE 转成 10 进制数，得到 n 的值是 686


225.复制粘贴
<BODY>
<input type="file" name='a1'><input type="button" value='复制粘贴' onclick="haha()"><div id="aa"></div>
<SCRIPT LANGUAGE="JavaScript">
<!--
function haha()
{
 clipboardData.setData("Text",a1.value);
 aa.innerText=clipboardData.getData("Text");
}
//-->
</SCRIPT>
</BODY>//

226.获得对象类型
switch (object.constructor){
   case Date:
   ...
   case Number:
   ...
   case String:
   ...
   case MyObject:
   ...
   default:
   ...
}//

 
227.图片加载失败时重新加载图片
<img src="aa.gif" onerror="this.src='aa.gif'">//
 
228.
//font_effect.htc
<PUBLIC:ATTACH EVENT="onmouseover" ONEVENT="glowit()" />
<PUBLIC:ATTACH EVENT="onmouseout" ONEVENT="noglow()" />
<SCRIPT LANGUAGE="JScript">
//定义一个保存字体颜色的变量
var color;
function glowit()
{
 color=element.style.backgroundColor;
 element.style.backgroundColor='white'
}
function noglow()
{
  element.style.backgroundColor=color
}
</SCRIPT>

//abc.css
tr{behavior:url(font_effect.htc);}

229.可以通过css和htc改变表格的颜色,仅IE支持
//xxx.html
<link rel="stylesheet" type="text/css" href="abc.css">
<TABLE border='1'  id="a1">
<TR style="background-color:red">
 <TD>1</TD>
 <TD>2</TD>
 <TD>3</TD>
</TR>
<TR style="background-color:yellow">
 <TD>4</TD>
 <TD>5</TD>
 <TD>6</TD>
</TR>
</TABLE>//

230.在页面上画点
function a(x,y,color)
{
 document.write("<img border='0' style='position: absolute; left: "+(x+20)+"; top:

"+(y+20)+";background-color: "+color+"' width=1 height=1>")
}//

 231.自动关闭网页
<script LANGUAGE="javascript">
<!--
setTimeout('window.close();', 10000); //60秒后关闭
// -->
</script>
<p align="center">本页10秒后自动关闭,请注意刷新页面</p>