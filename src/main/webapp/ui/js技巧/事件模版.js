//1����������
$("#attendence_holiday_meeting_info_index_add_btn").click(function(){
	var cfg={
		title:"���ӻ�����Ϣ",	
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

//���õ�appendTo(("#application_menu");)


//2

//3.������
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

//4��������+ѡ������
$("#personal_attendance_meeting_index_meeting_report_status").kendoDropDownList({
	dataTextField : "text",
	dataValueField : "value",
	dataSource : [{text : "δ�ϱ�",value : "0"}, 
				  {text : "���ϱ�",value : "1"}],
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