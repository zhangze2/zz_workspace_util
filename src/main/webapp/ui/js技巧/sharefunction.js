var UIEngineUrl="http://engine.bpm.com/bpm";  //client add
var UIORGPath="admin.nsf";
var UIAdminDbName="admin.nsf";
var UIUserDbName="bpm.nsf";
var UIAppDbName="app.nsf";
var WF_FdName;
var hostname=location.hostname;
var topurl=location.href;
var spos=topurl.indexOf(hostname);
var epos=topurl.indexOf(".nsf");
var WF_CurDbPath=topurl.substring(spos+hostname.length,epos+4);
if(WF_CurDbPath.indexOf(":")!=-1){spos=WF_CurDbPath.indexOf("\/");WF_CurDbPath=WF_CurDbPath.substring(spos,WF_CurDbPath.length);}
spos=WF_CurDbPath.lastIndexOf("\/");
folder=WF_CurDbPath.substring(1,spos);
var FdErrorMsg="",FdErrorList="",FdList="";
try{var exdh = Ext.DomHelper;}catch(e){}
try{Ext.onReady(function(){ SetLinkeyTableBg();})}catch(e){}

function SelUser(name,mul)
{
 var url="ORG_SelectUser.html?obj="+name+"&mul="+mul;
 var swidth=screen.availWidth;
 var sheight=screen.availHeight;
 var wwidth=900;
 var wheight=560;	
 var wleft=(swidth/2-0)-wwidth/2;
 var wtop=(sheight/2-0)-wheight/2;
 window.open(url,'pwin','Width='+wwidth+'px,Height='+wheight+'px,Left='+wleft+',Top='+wtop+',status=no,resizable=yes,scrollbars=no,resezie=no');
}
function WF_SelUser(name,mul)
{
 var url="ORG_WFSelectUser.html?&obj="+name;
 var swidth=screen.availWidth;
 var sheight=screen.availHeight;
 var wwidth=900;
 var wheight=560;	
 var wleft=(swidth/2-0)-wwidth/2;
 var wtop=(sheight/2-0)-wheight/2;
 window.open(url,'pwin','Width='+wwidth+'px,Height='+wheight+'px,Left='+wleft+',Top='+wtop+',status=no,resizable=yes,scrollbars=no,resezie=no');
}

function SelDeptList(objName,mul,ReturnType)
{
 //2013-5-10增加ReturnType参数,v9
 if(mul=="one"){var Action="";}else{Action="MulSel"}
 var url="ORG_SelectDept.html?ObjName="+objName+"&Action="+Action+"&ReturnType="+ReturnType;
 var swidth=screen.availWidth;
 var sheight=screen.availHeight;
 var wwidth=500;
 var wheight=500;	
 var wleft=(swidth/2-0)-wwidth/2;
 var wtop=(sheight/2-0)-wheight/2;
 window.open(url,'pwin','Width='+wwidth+'px,Height='+wheight+'px,Left='+wleft+',Top='+wtop+',status=no,resizable=yes,scrollbars=no,resezie=no');
}
function OpenDocument(DocURL,lnum,rnum)
{
 var swidth=screen.availWidth;
 var sheight=screen.availHeight;
 if(!lnum) lnum=14;
 if(!rnum) rnum=50;
 var wwidth=swidth-lnum;
 var wheight=sheight-rnum;
 var wleft=(swidth/2-0)-wwidth/2-5;
 var wtop=(sheight/2-0)-wheight/2-25;
 window.open(DocURL,'','Width='+wwidth+'px,Height='+wheight+'px,Left='+wleft+',Top='+wtop+',location=no,menubar=no,status=yes,resizable=yes,scrollbars=auto,resezie=no');
}
function OpenWindow(url,widthnum,heightnum)
{
 var swidth=screen.availWidth;
 var sheight=screen.availHeight;
 var wwidth=500;
 var wheight=400;	
 var wleft=(swidth/2-0)-wwidth/2;
 var wtop=(sheight/2-0)-wheight/2;
 window.open(url,'pwin','Width='+wwidth+'px,Height='+wheight+'px,Left='+wleft+',Top='+wtop+',status=no,resizable=yes,scrollbars=no,resezie=no');
}
function OpenModalWindow(url,lnum,rnum)  
{
	 var swidth=screen.availWidth;
	 var sheight=screen.availHeight;
	 if(!lnum) lnum=14;
	 if(!rnum) rnum=50;
	 var wwidth=swidth-lnum;
	 var wheight=sheight-rnum;
	 var wleft=(swidth/2-0)-wwidth/2-5;
	 var wtop=(sheight/2-0)-wheight/2-25;
	var features =
	'dialogWidth:'+wwidth+'px;' +
	'dialogHeight:'+wheight+'px;' +
	'dialogLeft:'+wleft+'px;' +
	'dialogTop:'+wtop+'px;' +
	'directories:no; localtion:no; menubar:no; status=no; toolbar=no;scrollbars:no;Resizeable=no;help:0;';
	var retval = window.showModalDialog(url,window, features );
}
function OpenModelWindow(url,lnum,rnum) 
{
	 var swidth=screen.availWidth;
	 var sheight=screen.availHeight;
	 if(!lnum) lnum=14;
	 if(!rnum) rnum=50;
	 var wwidth=swidth-lnum;
	 var wheight=sheight-rnum;
	 var wleft=(swidth/2-0)-wwidth/2-5;
	 var wtop=(sheight/2-0)-wheight/2-25;
	var features =
	'dialogWidth:'+wwidth+'px;' +
	'dialogHeight:'+wheight+'px;' +
	'dialogLeft:'+wleft+'px;' +
	'dialogTop:'+wtop+'px;' +
	'directories:no; localtion:no; menubar:no; status=no; toolbar=no;scrollbars:no;Resizeable=no;help:0;';
	var retval = window.showModelessDialog(url,window, features );
}

function GetUrlArg(name){var reg = new RegExp("(^|\\?|&)"+ name +"=([^&]*)(\\s|&|$)", "i");       if (reg.test(location.href)) return unescape(RegExp.$2.replace(/\+/g, " ")); return ""; }; 

function AssNextField(ParentFieldName,TableFlag)
{
   //TableFlag=true is the dwtable's assfd 
   //ParentFieldName must be same for this field dictionary parent folderName
   //3 AssField must required ParentFieldName Arg
   var obj=event.srcElement;
   var AppId=document.all.WF_AppId.value;
   var objName=obj.name;
   var IndexNum="";
   var AidFdName="";
   var ParentFieldValue="";
   if(ParentFieldName && ParentFieldName!=""){ParentFieldValue=g(ParentFieldName);}else{ParentFieldValue="";ParentFieldName="";}
   if(TableFlag==true)
   {
	var spos=objName.indexOf("_");
	IndexNum=objName.substring(spos+1,objName.length);
	objName=objName.substring(0,spos);
   }
   var url=UIEngineUrl+"/interface.nsf/Client_DicAssNextField?openagent&AppId="+AppId+"&FieldName="+objName+"&ParentFieldName="+ParentFieldName+"&ParentFieldValue="+ParentFieldValue+"&FieldValue="+obj.value;
   Ext.getBody().mask('Waiting...', 'x-mask-loading');
   Ext.Ajax.request({
   url: url,
   success : function(response, action) 
   {
     var rsArray=Ext.util.JSON.decode(response.responseText);
     for(var FieldName in rsArray)
     { 
	   AidFdName=FieldName;
	   if(TableFlag==true){AidFdName+="_"+IndexNum}
       SetFieldValue(AidFdName,rsArray[FieldName],"%2C%");
     }
     Ext.getBody().unmask();         
   },
   failure: function(){alert('URL Error!');Ext.getBody().unmask();}
 });
}
function GetJsonByUrl(url,async,mask)
{
   //Print "Content-Type:text/json; charset=UTF-8"
   //Print "{字段名:'字段值',username:'admin'}"
   if(mask){Ext.getBody().mask('Waiting...', 'x-mask-loading');}
   if(!async){async=true;}
   if(async==false)
	{
	   var conn = Ext.lib.Ajax.getConnectionObject().conn;
	   var method="post";
	   var async=async;
	   conn.open(method,url,async);   
	   conn.send();    
	   var rsArray=Ext.util.JSON.decode(conn.responseText);
	   return rsArray;
	   if(mask){Ext.getBody().unmask();}
	}else
	{
		   Ext.Ajax.request({
		   url: url,
		   success : function(response, action) 
		   {
			   var rsArray=Ext.util.JSON.decode(response.responseText);
			   return rsArray;
			   if(mask){Ext.getBody().unmask();}
		   },
		   failure: function(){Ext.Msg.alert('URL Error!')}
		 });
	}
}
function GetValueByUrl(url,async)
{
   //Print "Content-Type:text/json; charset=UTF-8"
   //Print "{字段名:'字段值',username:'admin'}"
   Ext.getBody().mask('Waiting...', 'x-mask-loading');
   if(!async){async=true;}
   if(async==false)
	{
	   var conn = Ext.lib.Ajax.getConnectionObject().conn;
	   var method="post";
	   var async=async;
	   conn.open(method,url,async);   
	   conn.send();    
	   var rsArray=Ext.util.JSON.decode(conn.responseText);
	   for(var FieldName in rsArray){ SetFieldValue(FieldName,rsArray[FieldName])}
	   Ext.getBody().unmask(); 
	}else
	{
		   Ext.Ajax.request({
		   url: url,
		   success : function(response, action) 
		   {
			   var rsArray=Ext.util.JSON.decode(response.responseText);
			   for(var FieldName in rsArray){ SetFieldValue(FieldName,rsArray[FieldName])}
			   Ext.getBody().unmask();         
		   },
		   failure: function(){Ext.Msg.alert('URL Error!')}
		 });
	}
}
function s(FieldName,FieldValue){SetFieldValue(FieldName,FieldValue);}
function SetFieldValue(FieldName,FieldValue,separator,WinObj)
{
	if(!WinObj){WinObj=window;}
	if(!separator){separator=",";}
	var FdArray=FieldName.split(",");
	for (f=0;f<FdArray.length;f++)
	{
		FieldName=FdArray[f];
		var obj=GetObj(FieldName,WinObj);
		if(obj)
		{
			   var tagName=GetTagName(FieldName,WinObj);
			   if(tagName=="textarea")
			   {
					obj.value=FieldValue.replaceAll(separator,",");
			   }
			   else if(tagName=="div"||tagName=="span")
			   {
					obj.innerHTML=FieldValue.replaceAll(separator,",");
			   }
			   else if(tagName=="input")
			   {
					 if(obj.length)  //more checkbox radio
					 {
						var tempArray=FieldValue.split(separator);
						for(j=0;j<obj.length;j++)
						{
							if(tempArray.in_array(obj[j].value)){obj[j].checked=true;}else{obj[j].checked=false;}
						}
					 }
					 else // one field
					 {
						if((obj.type.toLowerCase()=="text"||obj.type.toLowerCase()=="password")&&obj.style.display!="none")
						{
							obj.value=FieldValue.replaceAll(separator,",");
						}else if(obj.type.toLowerCase()=="hidden"||obj.style.display=="none")
						{
							obj.value=FieldValue.replaceAll(separator,",");
							try{GetObj("idShow_"+obj.name,WinObj).innerText=obj.value;}catch(e){}
						}
						else if(obj.type.toLowerCase()=="checkbox"||obj.type.toLowerCase()=="radio")
						{
							var tempArray=FieldValue.split(separator);
							if(tempArray.in_array(obj.value)){obj.checked=true;}else{obj.checked=false;}
						}
					 }
			   }else //select or select-multi
			   {
						var Num=obj.length;
						for(N=0;N<Num;N++){obj.remove(0);}
						var tempArray=FieldValue.split(separator)
						for(i=0;i<tempArray.length;i++)
						{
							var oOption=WinObj.document.createElement("OPTION");
							if(tempArray[i].indexOf("|")==-1)
							{
								oOption.text=tempArray[i];
								oOption.value=tempArray[i];
							}else
							{
								var vArray=tempArray[i].split("|");
								oOption.text=vArray[0];
								oOption.value=vArray[1];
							}
							obj.add(oOption);  
						}
			   }
		}
	}
}

function g(FdName,WinObj) //get the field value
{
	var rval="";
	var obj=GetObj(FdName,WinObj);
	if(!obj) return "";
	var TagName=GetTagName(FdName,WinObj);
	if(TagName=="textarea")
	{
		return obj.value;
	}
	else if(TagName=="select" || TagName=="option")
	{
		for(y=0;y<obj.length;y++)
		{
			if(obj.options){if(obj.options[y].selected==true){if(rval==""){rval=obj.options[y].value}else{rval+=","+obj.options[y].value;}}}
		}
		return rval;
	}
	else if(TagName=="div")
	{
		return obj.innerText;
	}else if(TagName=="span")
	{
		return obj.innerText;
	}
	else if(TagName=="input")
	{
		if(obj.type=="text"||obj.type=="hidden"||obj.type=="password"){return obj.value;}
		else{
			var obj=eval("document.all."+FdName);
			if(obj.length)
			{
				for(y=0;y<obj.length;y++)
				{
					if(obj[y].checked==true){if(rval==""){rval=obj[y].value}else{rval+=","+obj[y].value}}
				}
				return rval;
			}else{if(obj.checked==true){return obj.value;}else{return "";}}
		}
	}
}

function IsNull(FdName)
{
	var rval="";
	var obj=GetObj(FdName);
	if(!obj) return false;
	var TagName=GetTagName(FdName);
	if(TagName=="textarea")
	{
		var tmpStr="";
		if(GetFdTypeByName(FdName)=="HTMLEDITOR")
		{
			try{eval("tmpStr=HTMLFRAEM_"+FdName+".oEdit_"+FdName+".getHTMLBody();");}catch(e){tmpStr=obj.value.trim();}
		}else{tmpStr=obj.value.trim();}
		if(tmpStr=="") return true;
	}
	else if(TagName=="select")
	{
		for(y=0;y<obj.length;y++)
		{
			if(obj.options){if(obj.options[y].selected==true){rval+=obj.options[y].value;}}
		}
		if(rval.trim()==""){return true;}
	}
	else if(TagName=="div"||TagName=="span")
	{
		if(obj.innerText.trim()=="") return true;
	}
	else if(TagName=="input")
	{
		if(obj.type=="text"||obj.type=="hidden"||obj.type=="password"){if(obj.value.trim()=="")return true;}
		else{
			var obj=eval("document.all."+FdName);
			if(obj.length)
			{
				for(y=0;y<obj.length;y++)
				{
					if(obj[y].checked==true){return false;}
				}
				return true;
			}else{if(obj.checked==false){return true;}}

		}
	}
	return false;
}
function GetFdTypeByName(FieldName) //get fields type
{
	var FdArray=FdList.split(",");
	var FdName,FdType;
	for(i=0;i<FdArray.length;i++)
	{
		FdName=FdArray[i].getItemValue("FdName");
		FdType=FdArray[i].getItemValue("FdType");
		if(FdName==FieldName){return FdType;}
	}
	return "";
}
function InitFormField()
{
	var i,j;
	SetLinkeyTableBg();
	InitMainFormFdAcl(); //主表单字段默认只读
	SetSubFormReadOnly(); //子表单字段默认只读
	DefaultZheDieSubForm(); //折叠子表单
	if(FdList==""){return;}
	var InitStr="";
	var FdArray=FdList.split(",");
	var tmpArray;
	var FdName,FdBlank,FdType,FdAcl;
	var useroptions = {script: "/"+folder+"/linkey_user.nsf/Org_AutoUserName?openagent&",varname: "WF_KeyWord",json: true,minchars:1};
	var deptoptions = {script: "/"+folder+"/linkey_user.nsf/Org_AutoDeptName?openagent&",varname: "WF_KeyWord",json: true,minchars:1};
	var dicoptions = {script: "/"+folder+"/linkey_dictionary.nsf/Dic_AutoDictionary?openagent&WF_AppId="+document.all.WF_AppId.value+"&",varname: "WF_KeyWord",json: true,minchars:1};
	//设置字段权限
	for(i=0;i<FdArray.length;i++)
	{
		if(FdArray[i]!="")
		{
			FdName=FdArray[i].getItemValue("FdName");
			FdBlank=FdArray[i].getItemValue("FdBlank");
			FdType=FdArray[i].getItemValue("FdType");
			FdAcl=FdArray[i].getItemValue("FdAcl");
			tmpArray=InitFormGetDTFdList(FdName).split(",");
			for(j=0;j<tmpArray.length;j++)
			{
				if(GetObj(tmpArray[j])){InitFormField_SetFdAcl(tmpArray[j],FdAcl);}
			}
		}
	}
	//设置字段控件
	for(i=0;i<FdArray.length;i++)
	{
		if(FdArray[i]!="")
		{
			FdName=FdArray[i].getItemValue("FdName");
			FdBlank=FdArray[i].getItemValue("FdBlank");
			FdType=FdArray[i].getItemValue("FdType");
			FdAcl=FdArray[i].getItemValue("FdAcl");
			tmpArray=InitFormGetDTFdList(FdName).split(",");
			for(j=0;j<tmpArray.length;j++)
			{
				if(GetObj(tmpArray[j])){InitStr=InitStr+InitFormField_GetFdCode(tmpArray[j],FdType,FdBlank);}
			}
		}
	}
	if(InitStr!=""){eval(InitStr);}
}

//设置所有没有配制的子表单默认为只读
function SetSubFormReadOnly()
{
	if(g("WF_NewDocFlag")=="1"){return;} //新文档时不执行
	var x=0;
	var getobj=document.all.FormBody.getElementsByTagName("div");
	var FdArray=FdList.split(",");
	for(x=0;x<getobj.length;x++)
	{
		if(getobj[x].id.indexOf("SUBFORM_")!=-1 && typeof(getobj[x].Nodeid)!="undefined" ){
			if(InFdListAcl(getobj[x].id,FdArray)==false)
			{
				//在字段没有配制属性的情况下才进行自动的权限设定
				if(getobj[x].Nodeid!=g("WF_CurrentNodeid")) 
				{
					SetDivAcl(getobj[x].id,"readonly"); //如果不是当前环节的子表单默认设为只读
				}else{
					SetDivAcl(getobj[x].id,"edit"); //如果是当前环节则自动设为可以编辑
				}
			}
		}
	}
}

//按DIV区段控制字段权限
function SetDivAcl(DivID,FdAcl)
{
	var i=0;
	var x=0;
	var j=0;
	var FdArray=FdList.split(",");
	var DivObj=document.all(DivID);
	//控制文本框
	var getobj=DivObj.getElementsByTagName("input");
	for(x=0;x<getobj.length;x++)
	{
		var eobj=getobj[x];
		var FdName=eobj.name;
		if(InFdListAcl(FdName,FdArray)==false) //说明没有定义权限
		{
			if(eobj.type=="text") //text 文本输入框
			{
				if(FdAcl=="readonly")
				{
					eobj.style.display="none";
					if(!GetObj("idShow_"+FdName))
					{
						exdh.insertHtml('AfterEnd',eobj,"<span id='idShow_"+FdName+"'>"+eobj.value+"</span>");
					}else{
						GetObj("idShow_"+FdName).value=eobj.value;
					}
				}else if(FdAcl=="edit"){
					eobj.style.display="";
					var obj=GetObj("idShow_"+FdName);
					if(obj){if(obj.parentNode){obj.parentNode.removeChild(obj);}else{}}
				}
			}else if(eobj.type=="button")
			{
				if(FdAcl=="readonly"){eobj.style.display="none";}
				else if(FdAcl=="edit"){eobj.style.display="";}
			}else //checkbox radio
			{
				if(FdAcl=="readonly"){eobj.disabled=true;}
				else if(FdAcl=="edit"){eobj.disabled=false;}
			}
		}
	}

	//控制textarea
	var eobj=DivObj.getElementsByTagName("textarea");
	for(i=0;i<eobj.length;i++)
	{
		var FdName=eobj[i].name;
		if(InFdListAcl(FdName,FdArray)==false) //说明没有定义权限
		{
			if(FdAcl=="readonly")
			{
				var BodyStr=eobj[i].value;
				if(BodyStr.indexOf("</DIV>")==-1 && BodyStr.indexOf("</TD>")==-1 && BodyStr.indexOf("</SPAN>")==-1)
				{
						BodyStr=BodyStr.replace(/(\n\r)/gi,"<br>");
						BodyStr=BodyStr.replace(/( )/gi,"&nbsp;");
						BodyStr=BodyStr.replace(/(\r)/gi,"<br>");
				}
				eobj[i].style.display="none";
				if(!GetObj("idShow_"+FdName))
				{
					exdh.insertHtml('AfterEnd',eobj[i],"<span id='idShow_"+FdName+"'>"+BodyStr+"</span>");
				}else{
					GetObj("idShow_"+FdName).value=eobj[i].value;
				}
			}else if(FdAcl=="edit"){
					eobj[i].style.display="";
					var obj=GetObj("idShow_"+FdName);
					if(obj){if(obj.parentNode){obj.parentNode.removeChild(obj);}else{}}
			}
		}
	}

	//控制select
	var eobj=DivObj.getElementsByTagName("select");
	for(i=0;i<eobj.length;i++)
	{
		var FdName=eobj[i].name;
		if(InFdListAcl(FdName,FdArray)==false) //说明没有定义权限
		{
			if(FdAcl=="readonly")
			{
				eobj[i].style.display="none";
				var SelText="";
				if(eobj[i].options.length!=0){SelText=eobj[i].options[eobj[i].selectedIndex].text;}
				if(!GetObj("idShow_"+FdName))
				{
					exdh.insertHtml('AfterEnd',eobj[i],"<span id='idShow_"+FdName+"'>"+SelText+"</span>");
				}else{
					GetObj("idShow_"+FdName).value=SelText;
				}
			}else if(FdAcl=="edit"){
					eobj[i].style.display="";
					var obj=GetObj("idShow_"+FdName);
					if(obj){if(obj.parentNode){obj.parentNode.removeChild(obj);}else{}}
			}
		}
	}

	//控制附件上载框
	var eobj=DivObj.getElementsByTagName("iframe");
	for(i=0;i<eobj.length;i++)
	{
		var obj=eobj[i];
		if(FdAcl=="readonly"){obj.style.display="none";}else if(FdAcl=="edit"){obj.style.display="";}
	}

	//控制附件的删除按扭
	var eobj=DivObj.getElementsByTagName("div");
	for(i=0;i<eobj.length;i++)
	{
		var obj=eobj[i];
		if(obj.id.indexOf("wf_attachmentlist")!=-1)
		{
			if(FdAcl=="readonly"){obj.readonly="true";}else if(FdAcl=="edit"){obj.readonly="";}
		}
	}

	//控制动态表格的操作条
	var eobj=DivObj.getElementsByTagName("div");
	for(i=0;i<eobj.length;i++)
	{
		var obj=eobj[i];
		if(obj.id.indexOf("tabletoolbar_")!=-1)
		{
			if(FdAcl=="readonly"){obj.style.display="none";}else if(FdAcl=="edit"){obj.style.display="";}
		}
	}
}

//初始化主表单默认字段权限为只读
function InitMainFormFdAcl()
{
	if(g("WF_NewDocFlag")=="1"){return;} //新文档时不执行
	if(g("WF_NodeProperty").indexOf("MainFormReadOnly")!=-1){return;} //主表单为只读时不执行
	if(g("WF_NodeProperty").indexOf("DefaultFieldToRead")==-1 && g("WF_IsFirstNodeFlag")!="1"){return false;} //环节中没有勾上默认字段为只读时也不执行.
	if(g("WF_IsFirstNodeFlag")=="1"){SetDivAcl("DIVMAINFORM","edit")} //首环节时主表单自动设为可编辑
	else{SetDivAcl("DIVMAINFORM","readonly"); //把主表单FormBody下的区段字段全部设为只读
	}
}

function InFdListAcl(FdName,FdArray)
{
	//判断字段是否在环节权限定义的中有定义，如果有定义则返回true,否则返回false
	var j=0;
	for(j=0;j<FdArray.length;j++)
	{
		if(FdArray[j]!="")
		{
			var gFdName=FdArray[j].getItemValue("FdName");
			var gFdAcl=FdArray[j].getItemValue("FdAcl");
			if(gFdName==FdName && gFdAcl!=""){return true}
		}
	}
	return false;
}
//默认字段权限结束初始化

function InitFormField_GetFdCode(FdName,FdType,FdBlank)
{
		if(FdName==undefined){return "";}
		var InitStr="";
		var fobj=GetObj(FdName,window,1);
		if( GetObj("idShow_"+FdName)==undefined || FdType=="TEXTHIDDEN" || GetObj("WF_FormNumber") ) //GetObj("WF_FormNumber")No Check UI Designer
		{
				if(FdType=="DATEONLY")
				{
						InitStr+="Calendar.setup({inputField:'"+FdName+"',ifFormat:'%Y-%m-%d',showsTime:false,singleClick:true});GetObj('"+FdName+"').className='datetime';";
				}else if(FdType=="DATETIMES")
				{
						InitStr+="Calendar.setup({inputField:'"+FdName+"',ifFormat:'%Y-%m-%d %H:%M',showsTime:true,singleClick:true});GetObj('"+FdName+"').className='datetime';";
				}else if(FdType=="TIMESONLY")
				{
						InitStr+="Calendar.setup({inputField:'"+FdName+"',ifFormat:'%H:%M',showsTime:true,singleClick:true});GetObj('"+FdName+"').className='datetime';";
				}else if(FdType=="USERNAMEAUTO")
				{
						InitStr+="new AutoSuggest('"+FdName+"', useroptions);";
				}else if(FdType=="DEPARTMENTAUTO")
				{
						InitStr+="new AutoSuggest('"+FdName+"', deptoptions);";
				}else if(FdType=="DICTIONARYAUTO")
				{
						InitStr+="new AutoSuggest('"+FdName+"', dicoptions);";
				}else if(FdType=="USERNAME"||FdType=="READERSSELECT"||FdType=="AUTHORSSELECT")
				{
						InitStr+="exdh.insertHtml('AfterEnd',GetObj('"+FdName+"'),\"<input id='tmpElement' type='button'  title='用户选择单选'  class=userbtn value='' onclick=\\\"SelUser('"+FdName+"','one')\\\" >\");if(GetObj('"+FdName+"_CN')){GetObj('"+FdName+"_CN').readOnly=true;GetObj('"+FdName+"').style.width='1px';GetObj('"+FdName+"').style.visibility='hidden';}";
				}else if(FdType=="USERNAMEMUL"||FdType=="READERSMULSELECT"||FdType=="AUTHORSMULSELECT")
				{
						InitStr+="exdh.insertHtml('AfterEnd',GetObj('"+FdName+"'),\"<input id='tmpElement' type='button' title='用户选择可以多选' class=userbtn value='' onclick=\\\"SelUser('"+FdName+"','MUL')\\\" >\");if(GetObj('"+FdName+"_CN')){GetObj('"+FdName+"_CN').readOnly=true;GetObj('"+FdName+"').style.width='1px';GetObj('"+FdName+"').style.visibility='hidden';}";
				}else if(FdType=="TEXTAREAUSER")
				{
						InitStr+="exdh.insertHtml('AfterEnd',GetObj('"+FdName+"'),\"<br><input id='tmpElement' type='button' title='用户选择可选择多个' class=userbtn value='' onclick=\\\"SelUser('"+FdName+"','MUL')\\\" >\");";
				}else if(FdType=="DEPARTMENT")
				{
						InitStr+="exdh.insertHtml('AfterEnd',GetObj('"+FdName+"'),\"<input id='tmpElement' type='button' title='部门选择单选' class=deptbtn value='' onclick=\\\"SelDeptList('"+FdName+"','one')\\\" >\");";
				}else if(FdType=="DEPARTMENTMUL")
				{
						InitStr+="exdh.insertHtml('AfterEnd',GetObj('"+FdName+"'),\"<input id='tmpElement' type='button' class=deptbtn title='部门选择可以多选' value='' onclick=\\\"SelDeptList('"+FdName+"','MUL')\\\" >\");";
				}else if(FdType=="DEPARTMENT2")
				{
						InitStr+="exdh.insertHtml('AfterEnd',GetObj('"+FdName+"'),\"<input id='tmpElement' type='button' title='部门简称单选' class=deptbtn value='' onclick=\\\"SelDeptList('"+FdName+"','one','1')\\\" >\");";
				}else if(FdType=="DEPARTMENTMUL2")
				{
						InitStr+="exdh.insertHtml('AfterEnd',GetObj('"+FdName+"'),\"<input id='tmpElement' type='button' class=deptbtn title='部门简称多选' value='' onclick=\\\"SelDeptList('"+FdName+"','MUL','1')\\\" >\");";
				}else if(FdType=="HTMLEDITOR")
				{
						InitStr+="GetObj('"+FdName+"').style.display='none';exdh.insertHtml('AfterEnd',GetObj('"+FdName+"'),\"<iframe  id='tmpElement'  height='99%' src='editor/htmleditor.html?FdName="+FdName+"' width='100%' name='HTMLFRAEM_"+FdName+"'></iframe>\");";
				}else if(FdType=="TEXTHIDDEN")
				{
						InitStr+="GetObj('"+FdName+"').style.display='none';if(GetObj('idShow_"+FdName+"')){GetObj('"+FdName+"').innerText='"+g(FdName).replace(/\\/gi,"\\\\")+"';}else{exdh.insertHtml('AfterEnd',GetObj('"+FdName+"'),\"<span id='tmpElement'><span id=\\\"idShow_"+FdName+"\\\">"+g(FdName).replace(/\\/gi,"\\\\")+"</span></span>\");}";
				}else if(FdType=="HIDDEN")
				{
						InitStr+="GetObj('"+FdName+"').style.display='none';";
				}
				if(FdBlank=="true")
				{
						InitStr+="var objtype=GetObj('"+FdName+"').type;if(objtype!='checkbox' && objtype!='radio' && objtype!='textarea' && objtype!=undefined ){exdh.insertHtml('AfterEnd',GetObj('"+FdName+"'),\"<font id='tmpElement' color=red>*</font>\");}";
				}
		}
		return InitStr;
}
function InitFormGetDTFdList(FdName)
{
	var MulFdList="";
	var f=0;
	if(FdName.substring(FdName.length-2,FdName.length)!="_N"){MulFdList=FdName;}
	else{
		FdName=FdName.substring(0,FdName.indexOf("_N"));
		for(f=0;f<200;f++){if(GetObj(FdName+"_"+f)){if(MulFdList==""){MulFdList=FdName+"_"+f;}else{MulFdList+=","+FdName+"_"+f;}}}
	}
	return MulFdList;
}
function InitFormField_SetFdAcl(FdName,FdAcl)
{
	var j,i;
	if(FdAcl=="" || FdAcl==undefined) return;
	var eobj=GetObj(FdName); //ie Ext.getDom(FdName);
	if(eobj)
	{
			var tagName=GetTagName(FdName);
			if(tagName=="input"||tagName=="textarea") //input radio checkbox
			{
				if(eobj.length) //checkbox radio
				{
					if(FdAcl=="readonly"||FdAcl=="disabled")
					{
						var lobj=eval("document.all."+FdName);
						if(lobj.length){for(var b=0;b<lobj.length;b++){lobj[b].disabled=true;} }
						else{eobj.disabled=true;}
					}else if(FdAcl=="edit")
					{
						var lobj=eval("document.all."+FdName);
						if(lobj.length){for(var b=0;b<lobj.length;b++){lobj[b].disabled=false;} }
						else{eobj.disabled=false;}
					}else if(FdAcl=="hidden"){
						var lobj=eval("document.all."+FdName);
						if(lobj.length){for(var b=0;b<lobj.length;b++){lobj[b].style.display="none";} }
						else{eobj.style.display="none";}
					}
				}else{ //input text textarea
					if(FdAcl=="readonly")
					{
						eobj.style.display="none";
						if(!GetObj("idShow_"+FdName))
						{
							var BodyStr=eobj.value;
							if(BodyStr.indexOf("</DIV>")==-1 && BodyStr.indexOf("</TD>")==-1 && BodyStr.indexOf("</SPAN>")==-1)
							{
									BodyStr=BodyStr.replace(/(\n\r)/gi,"<br>");
									BodyStr=BodyStr.replace(/( )/gi,"&nbsp;");
									BodyStr=BodyStr.replace(/(\r)/gi,"<br>");
							}
							exdh.insertHtml('AfterEnd',eobj,"<span id='idShow_"+FdName+"'>"+BodyStr+"</span>");
						}else{
							GetObj("idShow_"+FdName).value=eobj.value;
						}
					}else if(FdAcl=="disabled"){
						eobj.disabled=true;
						eobj.style.display="";
						var obj=GetObj("idShow_"+FdName);
						if(obj){obj.parentNode.removeChild(obj);}
					}else if(FdAcl=="edit"){
						eobj.style.display="";
						eobj.disabled=false;
						//eobj.readonly=false;
						//eobj.readOnly=false;
						var obj=GetObj("idShow_"+FdName);
						if(obj){if(obj.parentNode){obj.parentNode.removeChild(obj);}else{}}
					}else if(FdAcl=="hidden"){
						eobj.style.display="none";
						var obj=GetObj("idShow_"+FdName);
						if(obj){if(obj.parentNode){obj.parentNode.removeChild(obj);}else{}}
					}
				}
			}else if(tagName=="div"){
				//div 区段
				SetDivAcl(FdName,FdAcl);
			}else{ //select
				if(FdAcl=="readonly")
				{
					eobj.style.display="none";
					var SelText="";
					if(eobj.options.length!=0){SelText=eobj.options[eobj.selectedIndex].text;}
					if(!GetObj("idShow_"+FdName))
					{
						exdh.insertHtml('AfterEnd',eobj,"<span id='idShow_"+FdName+"'>"+SelText+"</span>");
					}else{
						GetObj("idShow_"+FdName).value=SelText;
					}
				}else if(FdAcl=="disabled")
				{
					eobj.style.display="";
					eobj.disabled=true;
					var obj=GetObj("idShow_"+FdName);
					if(obj){obj.parentNode.removeChild(obj);}
				}else if(FdAcl=="edit"){
					eobj.style.display="";
					eobj.disabled=false;
					var obj=GetObj("idShow_"+FdName);
					if(obj){obj.parentNode.removeChild(obj);}
				}else if(FdAcl=="hidden"){
					eobj.style.display="none";
					eobj.disabled=true;
					var obj=GetObj("idShow_"+FdName);
					if(obj){obj.parentNode.removeChild(obj);}
				}
			}
	}
}
function SetLinkeyTableBg()
{
	var tbarray=document.getElementsByTagName("table");
	for(t=0;t<tbarray.length;t++)
	{
		var tableobj=tbarray[t];
		if(tableobj.className.toLowerCase()=="linkeytable" && tableobj.noformat!="1")
		{
			var rnum=tableobj.rows.length;
			for (var i=0;i<rnum;i++) 
			{
				var cnum=tableobj.rows[i].cells.length;
				if(cnum>1){
					for(j=0;j<cnum;j++)
					{
						if(!(j % 2)){tableobj.rows[i].cells[j].className="texttd";}
					}
				}
			}
		}
	}
}
//折叠指定子表单13-04-08
function ZheDieSubForm(SubFormId,IMGID)
{
	var obj=GetObj(SubFormId);
	if(obj.style.display=="none"){obj.style.display="";GetObj(IMGID).src="images/collapse.gif";}else{obj.style.display="none";GetObj(IMGID).src="images/expand.gif";}
}
//默认折叠不在本环节的子表单13-04-08
function DefaultZheDieSubForm()
{
	var obj=document.all.DivZheDieSubForm;
	if(obj){
		if(obj.length){
			for(var i=0;i<obj.length;i++)
			{
				var SubFormId="SUBFORM_"+obj[i].Nodeid+"_"+obj[i].indexNum;
				var ImgId="IMGDIV_"+obj[i].Nodeid+"_"+obj[i].indexNum;
				if(obj[i].Nodeid==g("WF_CurrentNodeid")){
					GetObj(SubFormId).style.display="";
					GetObj(ImgId).src="images/collapse.gif";
				}else{
					GetObj(SubFormId).style.display="none";
					GetObj(ImgId).src="images/expand.gif";
				}
			}
		}else
		{
			var SubFormId="SUBFORM_"+obj.Nodeid+"_"+obj.indexNum;
			var ImgId="IMGDIV_"+obj.Nodeid+"_"+obj.indexNum;
			if(obj.Nodeid==g("WF_CurrentNodeid"))
			{
				GetObj(SubFormId).style.display="";
				GetObj(ImgId).src="images/collapse.gif";
			}else{
					GetObj(SubFormId).style.display="none";
					GetObj(ImgId).src="images/expand.gif";
			}
		}
	}
}
function RemoveTmpElement(idStr)
{
	var obj=document.getElementsByName(idStr);
	if(obj.length==0||!obj){return};
	if(!obj.length)
	{
		var iname=obj.name;
		if(iname)
		{
			if(iname.indexOf("HTMLFRAEM_")!=-1)
			{
				var spos=iname.indexOf("_");
				var FdName=iname.substring(spos+1,iname.length);
				eval("var tmpStr="+iname+".oEdit_"+FdName+".getHTMLBody();");
				GetObj(FdName).value=tmpStr;
			}
		}
		obj.parentNode.removeChild(obj);
	}else
	{
		var num=obj.length;
		for(i=0;i<num;i++)
		{
			var iname=obj[0].name;
			if(iname)
			{
				if(iname.indexOf("HTMLFRAEM_")!=-1)
				{
					var spos=iname.indexOf("_");
					var FdName=iname.substring(spos+1,iname.length);
					eval("var tmpStr="+iname+".oEdit_"+FdName+".getHTMLBody();");
					GetObj(FdName).value=tmpStr;
				}
			}
			obj[0].parentNode.removeChild(obj[0]);
		}
	}
	var el;var form=document.forms[0];for (var i = 0; i < form.elements.length; i++){el = form.elements[i];if(el.className=="lsinvalid"){el.className="";};}
}

function CancelInvalid(obj,FdName)
{
	if(!obj) return;
	if(!obj.length)
	{
		if(obj.className=="lsinvalid"){obj.className="";}else{obj.className=obj.className.replace(" lsinvalid-border","");obj.className=obj.className.replace(" lsinvalid","");}
	}
	else if(GetTagName(FdName)=="input") //more fields only checkbox radio
	{
			for(j=0;j<obj.length;j++){obj[j].className="lschk";}
	}
}
function si(FdName) //set field invalid
{
	var obj=GetObj(FdName);
	SetInvalid(obj,FdName);
}
function SetInvalid(obj,FdName)
{
	try{if(GetTagName(FdName)=="div"){return};}catch(e){}
	if(!obj.length)
	{
		if(obj.className.indexOf("lsinvalid")==-1)
		{
			if(obj.className){if(obj.className==""){obj.className="lsinvalid";}else{obj.className=obj.className+" lsinvalid-border";}}
			else{obj.className="lsinvalid";}
		}
	}
	else if(GetTagName(FdName)=="input") //more fields only checkbox radio
	{
		for(j=0;j<obj.length;j++){obj[j].className="lsinvalid";}
	}
}

function LoadAttachmentsByUrl(url,indexnum)
{
  //全局通用
  url=url+"&FormNumber="+g("WF_FormNumber")+"&rnum="+Math.random();
  Ext.Ajax.request({
   url: url,
   success : function(response, action) 
   {
	    var obj=GetObj("wf_attachmentlist"+indexnum);
	    if(obj.length){alert("附件上载框有重复编号,附件显示错误!");obj=obj[0];}
		if(obj.readonly=="true"){var fileStr=response.responseText;fileStr=fileStr.replaceAll("<img","<img2");obj.innerHTML=fileStr; //目标为readonly时不显示删除按扭
		}else{obj.innerHTML=decodeURIComponent(response.responseText);}
		try{LoadAttachmentsCallBack(indexnum,response.responseText);}catch(e){} //附件显示成功后的回调函数
   },
   failure: function(){alert('Error url!')}
  });
}
function WF_DelAttachmentByUrl(url,filename,indexnum)
{
  //url为删除附件的地址，filename为要删除附件的名称
  if(confirm("您确认要删除附件 \""+filename+"\"吗?"))
  {
   //var showfileurl=url.replace("AgentDelAttachment","AgentGetAttachList");
   Ext.Ajax.request({
   url: url,
   success : function(response, action) 
   {
       //LoadAttachmentsByUrl(showfileurl,indexnum)
	   WF_LoadAttachments();
   },
   failure: function(){alert('Error url!')},
   params: {}
  });
  }
}

function WF_OpenAttachmentLog(AttachmentServerUrl,AttachmentDbName,DocUNID)
{
	var url="/"+folder+"/"+UIUserDbName+"/WF_RunRule?openagent&RuleNum=RU016_003&DocUNID="+g("WF_DocUNID");
	OpenDocument(url,300,300);
}
function WF_OpenTemplateFile(filenum,indexnum)
{
  //filenum附件模板上传时的编号,indexnum附件在表单上的显示序号
  var url="/"+folder+"/"+UIUserDbName+"/frmopenform?readform&WF_FormNumber=F_001_F01&ProcessUNID="+g("WF_ProcessUNID")+"&DocUNID="+g("WF_DocUNID")+"&indexnum="+indexnum+"&CurNodeid="+g("WF_CurrentNodeid")+"&filenum="+filenum;
  OpenDocument(url);
}
function OpenAttachment(ProcessUNID,DocUNID,fileurl,indexnum)
{
	if(g("WF_WFForm")=="0") //Is UI Form
	{
		//var url="/"+folder+"/"+AttachDbPath+"/0/"+DocUNID+"/$file/"+filename;
		window.open(fileurl);
	}else {	//Workflow Engine Attachment
		if(g("WF_DocStatus")=="End") //Workflow End Document
		{
			var tmf=fileurl.toLowerCase();
			if(tmf.indexOf(".doc")!=-1||tmf.indexOf(".docx")!=-1||tmf.indexOf(".xls")!=-1||tmf.indexOf(".dot")!=-1||tmf.indexOf(".ppt")!=-1||tmf.indexOf(".pptm")!=-1||tmf.indexOf(".tif")!=-1)
			{
			  var fileurl="/"+folder+"/"+UIUserDbName+"/frmopenform?readform&WF_FormNumber=F_011_007&WF_DocUNID="+DocUNID+"&indexnum="+indexnum+"&CurNodeid=&url="+escape(fileurl);
			}
			OpenDocument(fileurl);
		}else{ //Workflow Runing Open Attachment
			var tmf=fileurl.toLowerCase();
			if(tmf.indexOf(".doc")!=-1||tmf.indexOf(".docx")!=-1||tmf.indexOf(".xls")!=-1||tmf.indexOf(".dot")!=-1||tmf.indexOf(".ppt")!=-1||tmf.indexOf(".pptm")!=-1||tmf.indexOf(".tif")!=-1)
			{
			  var fileurl="/"+folder+"/"+UIUserDbName+"/frmopenform?readform&WF_FormNumber=F_001_F01&ProcessUNID="+ProcessUNID+"&DocUNID="+DocUNID+"&indexnum="+indexnum+"&CurNodeid="+g("WF_CurrentNodeid")+"&url="+escape(fileurl);
			}
			OpenDocument(fileurl);
		} //end if
	} //end if
} //end function 

function lsformcheck()
{
	var obj=event.srcElement;
	if(obj.tagName.toLowerCase()!="input"&&obj.tagName.toLowerCase()!="textarea")return false;
	var evtFdName=obj.name;
	var FdArray=FdList.split(",");
	var FdName="",fcName="",blFlag="";
	var relName=evtFdName;
	var tmpFdName="";
	for(n=0;n<FdArray.length;n++)
	{
		FdName=getDataValue(FdArray[n],"FdName");
		blFlag=getDataValue(FdArray[n],"FdBlank");
		fcName=getDataValue(FdArray[n],"FdCheck");
		if(FdName.indexOf("_N")!=-1){FdName=FdName.substring(0,FdName.indexOf("_N"));tmpFdName=evtFdName.substring(0,evtFdName.indexOf("_"));}else{tmpFdName=evtFdName;}//check dw table field
		if(fcName.indexOf("(")==-1){var fcStr=fcName+"('"+relName+"')";}else{var fcStr=fcName;}
		WF_FdName=FdName;
		if(FdName.toLowerCase()==tmpFdName.toLowerCase())
		{
			var rflag=true;
			if(blFlag=="true" && IsNull(obj.name))
			{
				SetInvalid(obj);
			}
			else if(fcName!="")
			{
				if(!eval(fcStr)){SetInvalid(obj);}else{CancelInvalid(obj);}
			}
			else
			{
				CancelInvalid(obj);
			}
		}
	}
}
function lscheckallfd(CkFdName)
{
	if(FdList==""){return true;}
	var tmpArray;
	var FdArray=FdList.split(",");
	var FdName="",fcName="",blFlag="";ErrMsg="";
	var checkflag=true;FdErrorList="";
	for(i=0;i<FdArray.length;i++)
	{
		FdName=getDataValue(FdArray[i],"FdName");
		blFlag=getDataValue(FdArray[i],"FdBlank");
		fcName=getDataValue(FdArray[i],"FdCheck");
		ErrMsg=getDataValue(FdArray[i],"FdMsg");
		tmpArray=InitFormGetDTFdList(FdName).split(",");
		for(h=0;h<tmpArray.length;h++)
		{
			FdName=tmpArray[h];
			if(FdName!=""){
			if(fcName.indexOf("(")==-1){var fcStr=fcName+"('"+FdName+"')";}else{var fcStr=fcName;}
			var obj=document.all(FdName);
			WF_FdName=FdName;
			if(blFlag=="true" && IsNull(FdName)) //check blank
			{
					checkflag=false;
					SetInvalid(obj,FdName);
					if(ErrMsg!=""){FdErrorMsg+="\n"+ErrMsg;}else{FdErrorList+=FdName+" "}
			}
			else if(fcName!="") //check function 
			{
				if(!eval(fcStr))
				{
					checkflag=false;
					SetInvalid(obj,FdName);
					if(ErrMsg!=""){FdErrorMsg+="\n"+ErrMsg;}else{FdErrorList+=FdName+" "}
				}else{CancelInvalid(obj);}
			}
			else
			{
					CancelInvalid(obj,FdName);
			}
		   }
		}
	 }
	 return checkflag;
}
function lscheckallfd_setfd(fcName,FdName,blFlag,ErrMsg)
{
	    if(fcName.indexOf("(")==-1){var fcStr=fcName+"('"+FdName+"')";}else{var fcStr=fcName;}
		var obj=eval("document.all."+FdName);
		if(blFlag=="true" && IsNull(FdName)) //check blank
		{
				checkflag=false;
				SetInvalid(obj,FdName);
				if(ErrMsg!=""){FdErrorMsg+="\n"+ErrMsg;}else{FdErrorList+=FdName+" "}
		}
		else if(fcName!="") //check function 
		{
			if(!eval(fcStr))
			{
				checkflag=false;
				SetInvalid(obj,FdName);
				if(ErrMsg!=""){FdErrorMsg+="\n"+ErrMsg;}else{FdErrorList+=FdName+" "}
			}else{CancelInvalid(obj);}
		}
		else
		{
				CancelInvalid(obj,FdName);
		}
}

function getDataValue(DataStr,FdName)
{
		DataStr=DataStr.replace(/(%2E)/gi,",");
	  	var getArray=DataStr.split(";");
	  	for(j=0;j<getArray.length;j++)
	  	{
	  		var spos=getArray[j].indexOf("=");
	  		var getName=getArray[j].substring(0,spos);
	  		var getV=getArray[j].substring(spos+1,getArray[j].length);
	  		if(getName.toLowerCase()==FdName.toLowerCase())
	  		{
	  			return getV;
	  		}
	  	}
	  	return "";
}
//form and attachment end

function GetTagName(ObjName,WinObj){var obj=GetObj(ObjName,WinObj);if(!obj) return "";if(obj.tagName){return obj.tagName.toLowerCase();}else{return obj[0].tagName.toLowerCase();}}
function GetObj(ObjName,WinObj,First)
{
	if(ObjName=="") return false;
	if(!WinObj) WinObj=window;
	if(WinObj.document.forms[0]){var obj=eval("WinObj.document.forms[0]."+ObjName); } //jy google ie
	if(!obj){var obj=eval("WinObj.document.all."+ObjName); } //ie
	if(!First){return obj;}else{if(!obj){return false;}if(obj.length){return obj[0];}else{return obj;}}
}
var EndNodeColor1="#3f6",EndNodeColor2="#38e100",CurrentNodeColor1="#ffa6a6",CurrentNodeColor2="#ff0000",OrNodeColor="#92cddc",NoStartNodeColor1="#e7e7e7",NoStartNodeColor2="#d7d7d7";
function ShowUserLink(v){var tmpStr="";var vStr="";var tmpArray=v.split(",");for(i=0;i<tmpArray.length;i++){vStr="<a href='#' onclick=\"ShowUserInfo('"+tmpArray[i]+"');return false;\">"+tmpArray[i]+"</a>";if(tmpStr==""){tmpStr=vStr}else{tmpStr=tmpStr+","+vStr;}} return tmpStr;}
function ShowUserInfo(UserName){var url="/"+folder+"/"+UIUserDbName+"/WF_RunRuleAdmin?openagent&RuleNum=RU001_011&UserName="+UserName;OpenDocument(url,350,150);}
function FieldInvalid(ObjId){GetObj(ObjId).className="lsinvalid"}
function CloseWindow(){window.close();}
function Back(){history.back();}
function GetSelDocUNID(grid){var DocUNIDList="";var seldoc=grid.getSelectionModel().getSelections();for(i=0;i<seldoc.length;i++){var DocUNID=seldoc[i].id;if(DocUNIDList==""){DocUNIDList=DocUNID}else{DocUNIDList+=","+DocUNID}}return DocUNIDList;}
function ViewSelect(keyword,lnum,rnum){if(!keyword){alert("Error keyword is required!");return false;};if(!lnum){lnum=300;rnum=300}var url="/"+folder+"/bpm.nsf/frmOpenForm?readform&WF_FormNumber=F_013_004&KeyWord="+keyword;OpenDocument(url,lnum,rnum);}
function isEn(s){var regu = "^[0-9a-zA-Z]+$"; var re = new RegExp(regu); if (re.test(s)) {return true; }else{return false;} } 
function InitTextAreaLine(objid){var str=GetObj(objid).value;str=str.replace(/\r/gi,"");str=str.split("\n");n=str.length;var lineobj=GetObj(objid+"Line");for(var i=1;i<=n;i++){if(document.all){num+=i+"\r\n";}else{num+=i+"\n";}}lineobj.value=num;num="";}
String.prototype.replaceAll=function(s1,s2){return this.replace(new RegExp(s1,"gm"),s2);}
Array.prototype.in_array = function(e){for(i=0;i<this.length && this[i]!=e;i++);return !(i==this.length);}
Array.prototype.ToString=function(str){var strTmp="";for(var i=0;i<this.length;i++) {if(this[i]!="") {if(strTmp=="") {strTmp = this[i];} else {strTmp = strTmp + str + this[i];}}}return strTmp;}
function trim(s){return s.replace(/(^\s*)|(\s*$)/gi, "")}
String.prototype.trim=function(){return this.replace(/(^\s*)|(\s*$)/g, "")}
String.prototype.getItemValue=function(ItemName)
{
	  	var getArray=this.replace(/(%2E)/gi,",").split(";");
	  	for(j=0;j<getArray.length;j++)
	  	{
	  		var spos=getArray[j].indexOf("=");
	  		var getName=getArray[j].substring(0,spos);
	  		var getV=getArray[j].substring(spos+1,getArray[j].length);
	  		if(getName.toLowerCase()==ItemName.toLowerCase())
	  		{
	  			return getV;
	  		}
	  	}
	  	return "";
}

function GridToRadio(grid)
{
  var gridEl=grid.getEl(); 
  gridEl.select('div.x-grid3-hd-checker').removeClass('x-grid3-hd-checker');
  grid.store.on('load',updategridclass);
  grid.getView().on('rowupdated',updategridclass); 
  grid.on('sortchange',updategridclass); 
  function updategridclass(){ gridEl.select("div[class=x-grid3-row-checker]").each(function(x) {  x.addClass('x-grid3-row-radioBtn');   }); }
}

function DateDiff(sDate1,sDate2)
{
  var aDate, oDate1, oDate2, iDays;  
  aDate = sDate1.split("-");
  oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);   
  aDate = sDate2.split("-");
  oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
  iDays = Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 /24;
  return iDays.toString();
}

function GridToExcel(grid){  
  
    try {  
        var xls = new ActiveXObject("Excel.Application");  
    }   
    catch (e) {  
        alert("要导出到Excel，您必须安装Excel，同时IE浏览器把本网址加入可信站点，并对可信站点的安全性中的\"对标记为可安全执行脚本的ActiveX控件初始化并执行脚本\”设为提示！");  
        //return "";  
    }  
      
    xls.visible = true; //设置excel为可见   
    var xlBook = xls.Workbooks.Add;  
    var xlSheet = xlBook.Worksheets(1);  
      
    var cm = grid.getColumnModel();  
    var colCount = cm.getColumnCount();  
    var temp_obj = [];  
    //只下载没有隐藏的列(isHidden()为true表示隐藏,其他都为显示)   
    //临时数组,存放所有当前显示列的下标   
	var cmHeader="";
    for (i = 1; i < colCount; i++) {  
		var cmHeader=cm.getColumnHeader(i);
        if (cm.isHidden(i) == true || cmHeader=="" || cmHeader.indexOf("<")!=-1){}
        else {temp_obj.push(i);}
    }
    for (i = 1; i <= temp_obj.length; i++) {  
        //显示列的列标题   
        xlSheet.Cells(1, i).Value = cm.getColumnHeader(temp_obj[i - 1]);  
    } 
    var store = grid.getStore();  
    var recordCount = store.getCount();  
    var view = grid.getView();  
    for (i = 1; i <= recordCount; i++) {  
        for (j = 1; j <= temp_obj.length; j++) {  
            //EXCEL数据从第二行开始,故row = i + 1;   
            xlSheet.Cells(i + 1, j).Value = view.getCell(i - 1, temp_obj[j - 1]).innerText;  
        }  
    }  
    xlSheet.Columns.AutoFit;  
    xls.ActiveWindow.Zoom = 75  
    xls.UserControl = true; //很重要,不能省略,不然会出问题 意思是excel交由用户控制   
    xls = null;  
    xlBook = null;  
    xlSheet = null;  
}
function formattable(tableid) //格式化table为交叉行
{
	 var overcolor='#FCF9D8';
	 var color1='#FFFFFF';
	 var color2='#F8F8F8';
	 var tablename=document.getElementById(tableid)
	 var tr=tablename.getElementsByTagName("tr")
	 for(var i=1 ;i<tr.length;i++)
	 {
		 tr[i].onmouseover=function(){this.style.backgroundColor=overcolor;}
		 tr[i].onmouseout=function(){if(this.rowIndex%2==0){this.style.backgroundColor=color1;}else{this.style.backgroundColor=color2;}}
	      if(i%2==0){tr[i].style.backgroundColor=color1;}else{tr[i].style.backgroundColor=color2;}
	 }
}

function GetDataFromExcel()
{
	OpenDocument('/'+folder+'/'+UIUserDbName+'/frmOpenForm?readform&WF_FormNumber=F_016_001&ProcessUNID='+g("WF_ProcessUNID"),750,700);
}

function UpdataFdValue(srcFdName) 
{
	 if(srcFdName==undefined){var FdName=event.srcElement.name;}else{var FdName=srcFdName;}
	  document.forms["linkeyform"].action=UIEngineUrl+"/interface.nsf/Client_GetGoalFdValue?openagent";
	  Ext.getBody().mask('Waiting...', 'x-mask-loading');
	  Ext.Ajax.request({
		 form:'linkeyform',
		 method:'POST',
		 timeout:600000,
		 success : function(response, action) {
			   Ext.getBody().unmask();
			   var rsArray=Ext.util.JSON.decode(response.responseText);
			   for(var FieldName in rsArray){ SetFieldValue(FieldName,rsArray[FieldName])}
			 },
		 failure: function(){alert('获得字段内容错误!');Ext.getBody().unmask();},
		 params: { GoalFdName: FdName}
	  });
}

function getCookie(label)
{
  var labelLen=label.length;
  var cLen=document.cookie.length;
  var i=0;
  var cEnd;
  while(i<cLen){
  var j=i+labelLen;
  if(document.cookie.substring(i,j)==label)
  {
    cEnd=document.cookie.indexOf(";",j)
    if(cEnd==-1)
    {
     cEnd=document.cookie.length;
    }
    return document.cookie.substring(j+1,cEnd);
  }
  i++
 }
 return ""
}