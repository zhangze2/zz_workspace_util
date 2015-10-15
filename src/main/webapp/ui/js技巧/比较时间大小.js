//IE和Firefox下Date.parse出现NaN有关问题解决

var startTime = $("#manage_release_start_release_time").val();
var endTime = $("#manage_release_end_release_time").val();
//当前系统时间
var today = new Date();
//				var today = date.getFullYear()+"-"+(date.getMonth() + 1) + "-" + date.getDate() ;

if(startTime == ""){
     $.LYUtils.msgWin("发布招聘计划开始时间不能为空!","warn");
    return false;
 }
if(endTime == ""){
     $.LYUtils.msgWin("发布招聘计划截止时间不能为空!","warn");
   return false;
}
//转换为日期格式
startTime = startTime.replace(/-/g,"/");  //将“2000-01-01” 这种格式中的横线‘-’ 全部(/g)替换为 ‘/’
endTime = endTime.replace(/-/g,"/");
if(Date.parse(startTime)-Date.parse(endTime)>0){
	$.LYUtils.msgWin("开始时间不能大于截止时间!","warn");
	return false;
}
if(Date.parse(today)-Date.parse(endTime)>0){
	$.LYUtils.msgWin("发布的招聘计划已过时,请重新设置","warn");
	return false;
}