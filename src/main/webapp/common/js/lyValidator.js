/**
 * kendoUI 统一校验
 * 使用方法如下：
 * 			if($.kendo.validator("#formId",notRequiredFlag)){
 * 				//pass and do something
 * 			};
 * 可以校验的内容在下面
 */
(function($){
	/**
	 * 方法创建时间：2013.12.24
	 * 最后更新时间：2014.1.6
	 * 完善此方法的人，别忘了更新说明，以免功能重复
	 * kendoUI统一校验入口：
	 * 目前拥有校验：
	 * 1.输入内容只有空格
	 * 2.textarea输入的值过多，超出1300字
	 * 3.没有输入的input，自动获取前一个td的Text添加必须输入校验。
	 * 4.添加kendoEditor校验，输入byte最多不超过60000 --2013.12.26
	 * 5.添加邮政编码格式校验 --2013.12.30：在input标签中添加data-type="postCode"属性
	 *   添加电话号码类型校验 --2014.1.6：在input标签中添加data-type="tel"属性
	 *   添加qq号码格式教研   --2014.1.6：在input标签中添加data-type="qq"
	 * 	 添加idCard格式教研  	--2014.1.6：在input标签中添加data-type="idCard"
	 *   添加email格式校验    --2014.3.14 data-type='email'
	 *   添加onlyNumeral校验,只能输入数字 	--2014.3.9：在input标签中添加data-type="onlyNumeral"
	 *   添加numLetter校验，只能输入数字或字母  --2014.12.1 在input标签中添加data-type="numLetter"
	 *   添加ip校验 --2015-3-21：在input标签中添加data-type="ip"
	 * 6.添加input radio类型校验，使用校验时请至少在最后一个radio标签中添加required属性，
	 *   同时在合适的位置添加<span class="k-invalid-msg" data-for="companyAim"></span>标签类展示校验信息 
	 * 7.添加必须输入校验开关，调用时设置notRequiredFlag为true,则不进行必须输入校验，这种情况试用保存草稿，不许需要进行必须输入校验，但依然要保证数据格式正确
	 * 8.在上传附件时进行校验是，请指定input的type为file，会提示“必须上传”而不是“必须输入！”,input 的 type='file' 请自行在jsp上添加
	 * 9.添加input checkbox类型校验，提示为请至少选择一项，一定要使用<span class="k-invalid-msg" data-for="companyAim"></span>制定校验位置 --2014.09.03
	 * 10.如果希望自定义校验提示语言，请在input标签中添加requiredMsg属性
	 * 11.添加了不可重复类型input的校验方法，目前为止校验的动作需要自己进行，在校验完成后，根据校验结果使用 $obj.setWarming("该内容已经存在，请重新输入！"),就可以使表单无法通过统一校验。
	 * 12.添加了不能输入中文input的校验方法，需要在input添加css样式 ime-mode:disabled,该样式的本意是禁用汉字输入法，统一校验会检测这个样式生命，添加只能输入汉语的校验提示 --2014.12.01
	 * 12.添加了验证YYYY-MM-DD日期格式，不能验证“2012-11-45”之类的不正确的日期 --2015.06.10 在input标签中添加data-type="date"
	 */
	$.LYUtils = function(){};
	$.LYUtils.validator = function(parentSelectStr,notRequiredFlag) {
		var maxLengthCount = 0;
		if($.type(parentSelectStr)=="string"){
			var form=$(parentSelectStr);
			var selector=parentSelectStr;
		}else{
			form=parentSelectStr;
			selector=parentSelectStr.selector;
		}
		var validator=form.kendoValidator({
			rules:{
				required:function(input){
					if(notRequiredFlag){
						return true;
					}
					var name=input.attr("name");
					var type=input.attr("type");
					var target=input.get(0).tagName;
					var dataRole=input.attr("data-role");
					
					var isRequired = true;
					if(!input.attr("required")){
						return true;
					}else{
						isRequired = !($.trim(input.val()) == '');// 空格处理
					}
					if(type=="radio" || type=="checkbox"){
						//如果input类型为radio或者checkbox，则判断是否有同名radio被选择
						var checkedRadio=form.find("input[name='"+name+"']:checked");
						if(checkedRadio.get(0)){
							return true;
						}else{
							return false;
						}
					}
					if(target=="TEXTAREA" && input.attr("data-role")=="editor"){
						if(!form.find("span[data-for='"+name+"']").get(0)){
							var editor=input.parents("table.k-editor");
							$("<span data-for='"+name+"' class='k-invalid-msg'></span>").insertAfter(editor);
						}
					}
					if(dataRole=="dropdownlist"){
						if(!form.find("span[data-for='"+name+"']").get(0)){
							input.data("kendoDropDownList").wrapper.after("<span data-for='"+name+"' class='k-invalid-msg'></span>");
						}
					}
					if(dataRole=="combobox"){
						if(!form.find("span[data-for='"+name+"']").get(0)){
							input.data("kendoComboBox").wrapper.after("<span data-for='"+name+"' class='k-invalid-msg'></span>");
						}
					}
					//判断input类型是否是AttachmentManage
					return isRequired;
				},
				notChinese:function(input){
					//如果input的
					if(input.css("ime-mode")!="disabled"){
						return true;//当input标签禁用汉语输入法的时候进行本项校验
					}else{
						var text=input.val();
						if(text.length<$.LYUtils.GetLength(text)){//字符串长度小于实际字节长度是，说明有汉字
							return false;
						}else{
							return true;
						}
					}
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
					if(!input.attr("required") || input.attr("type")=="checkbox" || input.attr("type")=="radio"){
						//非必须输入字段不进行非空校验
						//checkbox，radio也不进行非空校验
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
					}else if(dataType=="numLetter"){
						var pattern=/^[A-Za-z0-9_]+$/;
					}else if(dataType=="ip"){
						var pattern=/^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/
					}else if(dataType=="date"){
						var pattern=/^(\d{4})-(\d{2})-(\d{2})$/;
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
				editorTooLong:function(input){
					var target=input.get(0).tagName;
					var name=input.attr("name");
					if(target=="TEXTAREA" && input.attr("data-role")=="editor"){
						var flag = $.LYUtils.GetLength(input.val())<60000;
						if(!flag){
							form.find("span[data-for='"+name+"']").remove();
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
					}else if(dataType=="numLetter"){
						return "只能输入数字或字母";
					}else if(dataType=="ip"){
						return "ip地址格式有误，请修正！";
					}else if(dataType=="date"){
						return "请输入正确时间格式！";
					}else{
						return "发现错误数据校验格式："+dataType;
					}
				},
				textTooLong:function(input){
					return "你输入的内容过多，最多"+maxLengthCount+"字！";;
				},
				notChinese:function(input){
					return "请不要在这里输入汉字！";
				},
				textMaxLength:"你输入的内容超过限制",
				editorTooLong:"你输入的内容过多，请精简内容！",
				required: function(input){
					var type=input.attr("type");
					var dataType=input.attr("dataType");
					if(input.attr("requiredMsg")){
						return input.attr("requiredMsg");
					}
					var text=input.parents("td:eq(0)").prev().text();
					text=text.replace("*","");
					if(type=="file") return text+"必须上传！";
					if(type=="radio") return text+"必须选择！";
					if(type=="checkbox") return text+"至少选择一项";
					return text+"必须输入！";
				}
			}
		}).data("kendoValidator");
		if(validator==null){
			return true;
		}
		return validator.validate();
	};
	$.LYUtils.GetLength=function(str){
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
	/**
	 * 这个方法可以给一个$对象添加一个校验提示，这个提示会阻止校验通过，当这个校验提示消失后，统一校验才能通过
	 */
	$.fn.setWarming=function(warming){
		var name=this.attr("name");
		var valiName=name+"_tmpVali_"+warming;
		var warmingSpan=this.nextAll("span[data-for='"+valiName+"']:eq(0)");
		//使用
		if(!warmingSpan.get(0)){//同一种提示只能出现一次
			this.after("<input type='hidden' name='"+valiName+"' class='nh-tmpvali'required validationMessage='"+warming+"'>" +
					"<span warmingmsg='"+warming+"' data-for='"+valiName+"' class='k-invalid-msg warming1'></span>");
			$.kendo.validator(this.next().parent());
			var obj=this;
			this.change(function(){
				obj.cancelWarming(warming);
			});
		}
	}
	$.fn.cancelWarming=function(warming){
		var name=this.attr("name");
		var valiName=name+"_tmpVali_"+warming;
		var warmingSpan=this.nextAll("span[data-for='"+valiName+"']:eq(0)");
		var hiddenInput=this.nextAll("input[name='"+valiName+"']");
		hiddenInput.remove();
		warmingSpan.remove();
	}
})(jQuery);