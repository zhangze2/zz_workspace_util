//1、弹出窗口
$("#attendence_holiday_meeting_info_index_add_btn").click(function(){
	var cfg={
		title:"增加会议信息",	
		url:"/manage/attendence_holiday/meeting_info/add.do",	
		data:"",	
		winId:"attendence_holiday_meeting_info_index_add_win",	
		height:"235px",	
		width:"576px"
		close:function(){
			alert("");
		}
	};
	$.LYUtils.openWin(cfg);
});

//公用的appendTo(("#application_menu");)


//2

//3.下拉框：
$("#manager_assess_on_record_onRecord_index_search_assessYear").kendoDropDownList({
	dataTextField : "text",
	dataValueField : "value",
	dataSource : [ {
		text : "2011",
		value : "2011"
	}, {
		text : "2012",
		value : "2012"
	} , {
		text : "2013",
		value : "2013"
	} ]
});

//4、下拉框+选择器：
$("#personal_attendance_meeting_index_meeting_report_status").kendoDropDownList({
	dataTextField : "text",
	dataValueField : "value",
	dataSource : [{text : "未上报",value : "0"}, 
				  {text : "已上报",value : "1"}],
	select: function (e) {
		var dataItem = this.dataItem(e.item.index());
		$.ajax({
			url : __ctxPath+"/personal/attendance/meeting/index.do?list=",
			type : "post",
			data : {'meetingInfo[meetingReportStatus]':dataItem.value},
			success : function() {
			}
		});
	}
});