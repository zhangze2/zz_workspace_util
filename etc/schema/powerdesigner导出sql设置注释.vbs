'****************************************************************************** 
'*   File:           name2comment.vbs 
'*   Purpose:     Database   generation   cannot   use   object   names   anymore   
'                         in   version   7   and   above. 
'                         It   always   uses   the   object   codes. 
'
'                         In   case   the   object   codes   are   not   aligned   with   your   
'                         object   names   in   your   model,   this   script   will   copy   
'                         the   object   Name   onto   the   object   Comment   for   
'                         the   Tables   and   Columns. 
'
'*   Title:         
'*   Version:     1.0 
'*   Company:     Sybase   Inc.   
'******************************************************************************

Option Explicit
ValidationMode   = True
InteractiveMode   =   im_Batch
Dim   mdl   '   the   current   model
'   get   the   current   active   model 
Set   mdl   =   ActiveModel 
If   (mdl   Is Nothing)   Then
MsgBox "There   is   no   current   Model "
ElseIf Not   mdl.IsKindOf(PdPDM.cls_Model)   Then
MsgBox "The   current   model   is   not   an   Physical   Data   model. "
Else
      ProcessFolder   mdl 
End If
'   This   routine   copy   name   into   comment   for   each   table,   each   column   and   each   view 
'   of   the   current   folder 
Private sub   ProcessFolder(folder) 
Dim   Tab   'running     table 
for each   Tab   in   folder.tables 
if not   tab.isShortcut   then
                  '把表明作为表注释，其实不用这么做
                  tab.comment   =   tab.name 
Dim   col   '   running   column 
for each   col   in   tab.columns 
                        '把列name和comment合并为comment
                        col.comment=   col.name 
next
end if
next
Dim   view   'running   view 
for each   view   in   folder.Views 
if not   view.isShortcut   then
                  view.comment   =   view.name 
end if
next
'   go   into   the   sub-packages 
Dim   f   '   running   folder 
For Each   f   In   folder.Packages 
if not   f.IsShortcut   then
                  ProcessFolder   f 
end if
Next
end sub
