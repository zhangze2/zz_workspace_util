$.djs.namespace("/portal", "/ui/manage/user_index.js", function() {
	this.init = function() {
		load_content();
		bind_buttons();
	};
	
	function load_content() {
		var params = {
			object: $("#user_content_table"),
			data: function() {
				return $("#user_toolbar").toJSON();
			},
			url: _ctx + "/manage/user.do?list=",
			bind: function(e) {
				
			},
			columns: [
				{
					field: "checked",
					headerTemplate: '<input type="checkbox" name="checkAll" />',
					width: 35,
					template: "<input type='checkbox' name='uuid' value='#=userKey#'/>"
				},{
					field: "userKey",
					title: "职工号",
					width: 100,
				},{
					field: "userName",
					title: "用户名",
					width: 100
				},{
					field: "sex",
					title: "性别",
					width: 50,
					template:"#= $.KendoUtils.keyVal(sex,{1:'男',2:'女'}) #"
				},{
					field: "departmentName",
					title: "部门",
					width: 200,
				},{
					field: "phone",
					title: "手机号码",
					width: 100,
					template: "#= $.KendoUtils.formatNull(phone) #"
				},{
					field: "email",
					title: "邮箱",
					template: "#= $.KendoUtils.formatNull(email) #"
				}
			]
		};
		$.kendo.page(params);
	}
	
	function bind_buttons() {
		$("#user_toolbar a[name='create']").click(function(){ // 增
			var userKey = get_uuid();
			$.djs.invoke({ctxPath:_ctx,	js :'/ui/manage/user_add.js'},'pre_add', userKey);
		});
		$("#user_toolbar a[name='update']").click(function(){ // 改
			if($("#user_content_table :checked").size() > 1) {
				$.kendo.tips("不能同时修改多项...");
				$("#user_content_table :checked").attr("checked", false);
				return;
			} else if($("#user_content_table :checked").size() < 1) {
				$.kendo.tips("请至少选择一项...");
				return;
			} else {
				var userKey = get_uuid();
				$.djs.invoke({ctxPath:_ctx,	js :'/ui/manage/user_update.js'},'pre_update',userKey);		
			}
		});
		$("#user_toolbar a[name='delete']").click(function(){ // 删
			if($("#user_content_table :checked").size() > 1) {
				$.kendo.tips("不支持批量删除...");
				$("#user_content_table :checked").attr("checked", false);
				return;
			} else if($("#user_content_table :checked").size() < 1) {
				$.kendo.tips("请至少选择一项...");
				return;
			} else {
				var userKey = get_uuid();
				delete_btn(userKey);
			}
		});
		$("#user_toolbar a[name='search']").click(function(){ // 查
			table_refresh();
		});
		$("#user_toolbar a[name='clean']").click(function(){ // 清
			$("#user_toolbar :text").val("");
			table_refresh();
		});
	}
	
	function get_uuid() {
		return $("#user_content_table :checked").val();
	}
	
	function delete_btn(uuid) {
		$.ajax({
			type: "post",
			url: _ctx + "/manage/user.do?delete=&userKey="+uuid,
			success : function(message){
				$.kendo.tips("删除成功!", false);
				table_refresh();
			}
		});
	}
	
	function table_refresh() {
		$("#user_content_table").data("kendoGrid").dataSource.read();
	}
});