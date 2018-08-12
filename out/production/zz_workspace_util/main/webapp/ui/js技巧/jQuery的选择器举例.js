
//find
//表格列表的双击事件，并获取td的值 
$("#common_person_selector_list_grid").find("tbody > tr").each(function(index,obj){
	 $(this).dblclick(function(){				       			
		var xName = $(this).find("td:eq(0)").text();
		var staffId = $(this).find("td:eq(1)").text();
		
	 });
 });


// 把id为 table1的表格自第二行全部删除
 $('#table1 tr:not(:first)').remove();
 
 
 
 //批量操作：checkbox
 this.batch_entry = function(){
	var str = "";
	$("#entry_main_div input[name='entryIds[]']:checked").each(function(){
		str += "'" + $(this).val() + "',";
	});
	if(str==""){alert("请选择数据行！");return false;}
	str = str.substring(0, str.length-1);
	if(confirm("确认批量到职吗?")){
		$.ajax({
			type : "post",
			url : ctxPath + "/entry/entry.do",
			data : { "applyid" : str },
			success : function(data){
				alert("批量到职成功！");
				$("#entry_grid_table").data("kendoGrid").dataSource.read();
			}
		});
	}
}