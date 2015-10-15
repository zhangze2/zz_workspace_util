Sub Initialize
	On Error GoTo errormsg

	Dim session As New NotesSession
	Dim cdoc As NotesDocument
	Set cdoc=session.Documentcontext
	
	Dim qs As String
	qs = cdoc.request_content(0)
	
	Dim sql As String
	sql = GetUrlArg(qs,"sql")
	sql = UrlDeCode(sql)
	
	Dim i As Integer
	Dim json As String,jone As String
	Dim conn As Lcconnection
	Set conn = rdb.Getnewconnectbyid("lyoa")
	Dim FldLst As Lcfieldlist,Fd As Lcfield,FdName As String,FdText As String
	Set FldLst = New Lcfieldlist
	Call conn.Execute(sql, FldLst)
	While conn.Fetch(FldLst)>0
		jone=""
		For i=0 To FldLst.Fieldcount-1
			FdName = FldLst.Names(i)
			FdText = FldLst.Fields(i).Text(0)
			jone = jone+|,"|+FdName+|":"|+FdText+|"|
		Next
		If Left(jone,1)="," Then jone=Mid(jone,2)
		jone = "{"+jone+"}"
		json = json+","+jone
	Wend
	
	If Left(json,1)="," Then json=Mid(json,2)
	
	Print "Content-Type:text/json; charset=UTF-8"
	Print "["+json+"]"

	Exit Sub
errormsg:
	MsgBox "Rule Error:" & Str(Erl) & "  " & Error
	Call TestVar(sql,"根据SQL语句获取JSON")
End Sub