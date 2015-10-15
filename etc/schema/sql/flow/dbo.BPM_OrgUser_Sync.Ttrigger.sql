USE [BPM]
GO
/****** Object:  Trigger [dbo].[tgr_bpm_user_sync]    Script Date: 08/28/2014 11:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
* 触发器
*/
ALTER trigger [dbo].[tgr_bpm_user_sync]
on [dbo].[BPM_OrgUserList]
after insert,update,delete
AS
declare @action varchar(50)
declare @createTime datetime
set @createTime=GETDATE()
if ((exists (select 1 from inserted)) and (exists (select 1 from deleted)))
begin
	set @action='update'
end
else if (exists (select 1 from inserted) and not exists (select 1 from deleted))
begin
	set @action='insert'
end
else if (not exists (select 1 from inserted) and exists (select 1 from deleted))
begin
	set @action='delete'
end
if (@action='update' or @action='insert')
begin

insert into dbo.BPM_OrgUser_sync(
			WF_OrUNID
           ,ShortName
           ,ChinaeseName
           ,FolderId
           ,JobTitle
           ,secretary
           ,CellPhoneNumber
           ,QQ
           ,IndexFlag
           ,SortNumber
           ,MailPath
           ,MailSize
           ,MailServer
           ,InternetAddress
           ,AddName
           ,WF_DocCreated
           ,WF_LastModified
           ,workphone
           ,action
           ,createTime
           ,password) 
           select 
           WF_OrUNID
           ,ShortName
           ,ChinaeseName
           ,FolderId
           ,JobTitle
           ,secretary
           ,CellPhoneNumber
           ,QQ
           ,IndexFlag
           ,SortNumber
           ,MailPath
           ,MailSize
           ,MailServer
           ,InternetAddress
           ,AddName
           ,WF_DocCreated
           ,WF_LastModified
           ,workphone
           ,@action
           ,@createTime
           ,password
            from BPM_OrgUserList t 
where t.WF_OrUNID=(select t2.WF_OrUNID from inserted t2)
end
else
begin

insert into dbo.BPM_OrgUser_sync(
			WF_OrUNID
           ,ShortName
           ,ChinaeseName
           ,FolderId
           ,JobTitle
           ,secretary
           ,CellPhoneNumber
           ,QQ
           ,IndexFlag
           ,SortNumber
           ,MailPath
           ,MailSize
           ,MailServer
           ,InternetAddress
           ,AddName
           ,WF_DocCreated
           ,WF_LastModified
           ,workphone
           ,action
           ,createTime) 
           select 
           WF_OrUNID
           ,ShortName
           ,ChinaeseName
           ,FolderId
           ,JobTitle
           ,secretary
           ,CellPhoneNumber
           ,QQ
           ,IndexFlag
           ,SortNumber
           ,MailPath
           ,MailSize
           ,MailServer
           ,InternetAddress
           ,AddName
           ,WF_DocCreated
           ,WF_LastModified
           ,workphone
           ,@action
           ,@createTime
            from deleted
end