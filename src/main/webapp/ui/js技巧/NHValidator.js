/**
 * kendoUI 自动校验
 * 使用方法如下：
 * 			if($.kendo.validator("#formId",notRequiredFlag)){
 * 				//pass and do something
 * 			};
 * 可以校验的内容在下面
 */
(function($){
	$.replaceAll=function(srcStr,aimStr,replacement){
		var reg=new RegExp(aimStr,"g")
		srcStr=srcStr.replace(reg,replacement);
		return srcStr;
	}
	
	/**
	 * 方法创建时间：2013.12.24
	 * 最后更新时间：2014.1.6
	 * 完善此方法的人，别忘了更新说明，以免功能重复
	 * kendoUI统一校验入口：
	 * 目前拥有校验：
	 * 1.输入内容只有空格
	 * 2.textarea输入的值过多，超出1300字
	 * 3.没有输入的input，自动获取前一个td的Text添加必须输入校验。
	 * 4.添加kendoEditor校验，输入byte最多不超过30000 --2013.12.26
	 * 5.添加邮政编码格式校验 --2013.12.30：在input标签中添加data-type="postCode"属性
	 *   添加电话号码类型校验 --2014.1.6：在input标签中添加data-type="tel"属性
	 *   添加qq号码格式教研   --2014.1.6：在input标签中添加data-type="qq"
	 * 	 添加idCard格式教研  	--2014.1.6：在input标签中添加data-type="idCard"
	 *   添加email格式校验    --2014.3.14 data-type='email'
	 *   添加onlyNumeral校验,只能输入数字 	--2014.3.9：在input标签中添加data-type="onlyNumeral"
	 *   添加最短输入长度校验，在input或者textarea或者编辑器标签中添加 minlength,就可以进行。 --2014.4.10
	 * 6.添加input radio类型校验，使用校验时请至少在最后一个radio标签中添加required属性，
	 *   同时在合适的位置添加<span class="k-invalid-msg" data-for="companyAim"></span>标签类展示校验信息  pattern="/^\d{17}[\dxX]{1}$/";
	 * 7.添加必须输入校验开关，调用时设置notRequiredFlag为true,则不进行必须输入校验，这种情况试用保存草稿，不许需要进行必须输入校验，但依然要保证数据格式正确
	 */
	$.kendo.validator = function(parentSelectStr,notRequiredFlag) {
		//判断是否有绑定成kendoEidtor的textarea
		var maxLengthCount = 0;
		var form=$(parentSelectStr);
		var validator=form.kendoValidator({
			rules:{
				required:function(input){
					if(notRequiredFlag){
						return true;
					}
					var name=input.attr("name");
					var target=input.get(0).tagName;
					if(!input.attr("required")){
						return true;
					}
					if(input.attr("type")=="radio"){
						//如果input类型为radio，则判断是否有同名radio被选择
						var checkedRadio=form.find("input[name='"+name+"']:checked");
						if(checkedRadio.get(0)){
							return true;
						}else{
							return false;
						}
					}
					if(target=="TEXTAREA" && input.attr("data-role")=="editor"){
						if(!$(parentSelectStr+" span[data-for='"+name+"']").get(0)){
							var editor=input.parents("table.k-editor");
							$("<span data-for='"+name+"' class='k-invalid-msg'></span>").insertAfter(editor);
						}
					}
					return !input.val()=="";
				},
				notnull:function(input){
					var target=input.get(0).tagName;
					var nullabled=input.attr("nullabled");
					if(nullabled){//特殊情况下，暂时取消这个input的null值校验（此时只输入空格也可以通过检验，但是什么都不输入的话依然无法通过校验）
						return true;
					}
					if(notRequiredFlag){
						return true;
					}
					if(!input.attr("required")){
						return true;
					}
					var value = input.val();
					value = $.trim(value);
					if(value.length==0){
						return false;
					}
					if(target=="TEXTAREA" && input.attr("data-role")=="editor"){
						var value=$.trim($.replaceAll($.replaceAll($.replaceAll(input.val(),"&nbsp;",""),"<p>",""),"</p>",""));
						return value!="";
					}
					return !$.trim(input.val())=="";
				},
				patternError:function(input){
					var dataType=input.attr("data-type");
					var value=input.val();
					if(!value) return true;//格式校验不进行必须输入校验
					if(!dataType) return true;
					if(dataType=="postCode"){
						var pattern=/^\d{6}$/;
					}else if(dataType=='tel'){
						var pattern=/^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
					}else if(dataType=='qq'){
						var pattern=/^\d{5,10}$/;
					}else if(dataType=='idCard'){
						var pattern=/^\d{17}[\dxX]{1}$/;
					}else if(dataType=='onlyNumeral'){
						var pattern=/^\d+$/;
					}else if(dataType=='Email'){
						var pattern=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
					}
					return pattern.test(value);
				},
				textTooLong:function(input){  
					var target=input.get(0).tagName;  
					if(target=="TEXTAREA" && input.attr("data-role")!="editor"){  
						if(input.attr("maxlength")!=undefined){  
							maxLengthCount = input.attr("maxlength");  
						}else{  
							maxLengthCount = 1300;  
						}  
						return input.val().length<=maxLengthCount;  
					}else{  
						return true;  
					}  
				}, 
				textTooShort:function(input){
					var target=input.get(0).tagName;  
					var minlengthCount = input.attr("minlength");  
					if(((target=="TEXTAREA" && input.attr("data-role")!="editor") || target=="INPUT") && minlengthCount){  
						return GetLength(input.val())>=maxLengthCount;  
					}else{  
						return true;  
					}  
				},
				editorTooLong:function(input){
					var target=input.get(0).tagName;
					var name=input.attr("name");
					if(target=="TEXTAREA" && input.attr("data-role")=="editor"){
						var flag = GetLength(input.val())<30000;
						if(!flag){
							$(parentSelectStr+"span[data-for='"+name+"']").remove();
							var editor=input.parents("table.k-editor");
							if(!$("span[data-for='"+name+"']").get(0)){
								$("<span data-for='"+name+"' class='k-invalid-msg'></span>").insertAfter(editor);
							}
						}
						return flag;
					}else{
						return true;
					}
				},
				editorTooShort:function(input){
					var target=input.get(0).tagName;
					var name=input.attr("name");
					var minlengthCount = input.attr("minlength");  
					if(target=="TEXTAREA" && input.attr("data-role")=="editor" && minlengthCount){
						var flag = GetLength(input.val())>=minlengthCount;
						if(!flag){
							$(parentSelectStr+"span[data-for='"+name+"']").remove();
							var editor=input.parents("table.k-editor");
							if(!$("span[data-for='"+name+"']").get(0)){
								$("<span data-for='"+name+"' class='k-invalid-msg'></span>").insertAfter(editor);
							}
						}
						return flag;
					}else{
						return true;
					}
				}
			},
			messages:{
				notnull:"请输入有效内容！",
				patternError:function(input){
					var dataType=input.attr("data-type");
					if(dataType=="postCode"){
						return "邮政编码格式有误！";
					}else if(dataType=="tel"){
						return "格式有误(固定电话请添加区号)";
					}else if(dataType=='qq'){
						return "qq号格式有误！"
					}else if(dataType=='idCard'){
						return "身份证号格式有误！"
					}else if(dataType=='onlyNumeral'){
						return "只能输入数字！"
					}else if(dataType=='Email'){
						return "电子邮箱格式有误！!";
					}else{
						return "发现错误数据校验格式："+dataType;
					}
				},
				textTooLong:function(input){
					var maxLengthCount=input.attr("maxlength");
					return "你输入的内容过多，最多"+maxLengthCount+"字！";;
				},
				textTooShort:function(input){
					var minLengthCount=input.attr("minLength");
					return "你输入额内容过少，最少"+minLengthCount/3+"字(或者"+minLengthCount+"个字符)！";
				},
				editorTooLong:"你输入的内容过多，请精简内容！",
				editorTooShort:function(input){
					var minLengthCount=input.attr("minLength");
					return "你输入额内容过少，最少"+minLengthCount/3+"字(或者"+minLengthCount+"个字符)！";
				},
				required: function(input){
					//首先获得input的validatename
					var validatename=input.attr("validatename");
					var type=input.attr("type");
					var text=validatename;
					if(!text){
						text=input.parents("td:eq(0)").prev().text();
						text=text.replace("*","");
					}
					if(type=="radio") return text+"必须选择！";
					return text+"必须输入！";
				}
			}
		}).data("kendoValidator");
		return validator.validate();
	};
	function GetLength(str){
		var realLength=0,len=str.length,charCode=-1;
		for(var i=0;i<len;i++){
			charCode=str.charCodeAt(i);
			if(charCode>=0 && charCode<=128){
				realLength+=1;
			}else{
				realLength+=3;
			}
		}
		return realLength;
	};
})(jQuery);