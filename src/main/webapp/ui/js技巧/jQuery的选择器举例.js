
//find
//����б��˫���¼�������ȡtd��ֵ 
$("#common_person_selector_list_grid").find("tbody > tr").each(function(index,obj){
	 $(this).dblclick(function(){				       			
		var xName = $(this).find("td:eq(0)").text();
		var staffId = $(this).find("td:eq(1)").text();
		
	 });
 });


// ��idΪ table1�ı���Եڶ���ȫ��ɾ��
 $('#table1 tr:not(:first)').remove();
 
 
 
 //����������checkbox
 this.batch_entry = function(){
	var str = "";
	$("#entry_main_div input[name='entryIds[]']:checked").each(function(){
		str += "'" + $(this).val() + "',";
	});
	if(str==""){alert("��ѡ�������У�");return false;}
	str = str.substring(0, str.length-1);
	if(confirm("ȷ��������ְ��?")){
		$.ajax({
			type : "post",
			url : ctxPath + "/entry/entry.do",
			data : { "applyid" : str },
			success : function(data){
				alert("������ְ�ɹ���");
				$("#entry_grid_table").data("kendoGrid").dataSource.read();
			}
		});
	}
}