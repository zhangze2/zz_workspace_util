//1���ڹ���������iframeǶ����Ǭ������������ȡ�������ı��ֵ
//2�������ַ���url��Ϊ����
function formonload()
{
    var applyId = $("#zcrd_report_page_div input[name='applyId']").val();
    var achievement= $("#zcrd_report_page_div input[name='achievement']").val();
  var src = $("#zcrd_report_page_iframe").attr("src");
  if(src == "" || typeof(src)=='undefined'){
     $("#zcrd_report_page_iframe").attr("src",'http://hr.ly-sky.com:8080/zcps/business_apply/wf_apply/confirm/previewApply.do?applyId='+applyId+'&achievement='+encodeURIComponent(achievement));

  }
}
function formCheckValue()
{

}
function formonsubmit()
{
  document.domain="ly-sky.com";
  var iObj = document.getElementById('zcrd_report_page_iframe').contentDocument;
  $("#zcrd_report_page_div input[name='orgOpinion']").val(iObj.getElementById('confirm_B16').innerHTML);

  //alert(iObj.getElementById('confirm_B16').innerHTML);


}
function SaveDocumentCallBack(Action,rs)
{
  if(rs.Status!="ok"){alert(rs.msg+rs.ErrorMsg);Ext.getBody().unmask();}
  else{
    alert(rs.msg);
    if(opener){try{opener.store.reload();}catch(e){};window.close();}
    else{location.href="/"+folder+"/"+UIUserDbName+"/LinkeyGrid?readform&Num=G_001_001&ProcessNumber="+g("WF_ProcessNumber");}
  }
}
