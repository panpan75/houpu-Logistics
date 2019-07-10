use  master;
create database Logistics
go
use Logistics
--1��������
--������ɫ��
if exists(select * from sys.objects where name='[Role]')
drop table [Role]
create table [Role]
(
	RoleID int  not null primary key identity(1,1),--��ɫ���
	RoleName nvarchar(50) ,--��ɫ����
	RolePurview nvarchar(50),--��ɫȨ��
)

--�����û���
if exists (select * from sys.objects where name='[User]')
drop table	[User]
create table [User]
(
	UserID int not null identity(1,1) primary key,--0��ɫ���
	UserName varchar(20) not null,--1�û�����
	Sex tinyint null,--2�Ա� 
	Account varchar(20) not null,--3�û��˺�
	Password varchar(100) not null,--4�û�����
	Phone varchar(20) null,--5��ϵ�绰
	Email varchar(50) ,--6��������
	FK_RoleID int not null references Role(RoleID),--7�û���ɫ���
	CheckInTime  dateTime not null  ,--8����ʱ��
	IsDelete tinyint not null,--9���ݼ�¼״̬ 0��ʹ���� 1���ü�¼��ɾ��	
	AlterTime datetime not null --10�޸�ʱ��
)	

--������Ϣ�����ڴ�ź͹�������Ϣ��
if  exists (select * from sys.objects  where name ='TruckTeam')
drop table TruckTeam 
create table TruckTeam
(
	TeamID int not null identity(1,1) primary key,		--���ӱ�ţ��ֶ��Զ���ţ�
	TeamName varchar(50) not null,						--��������
	Leader varchar(50) ,								--���Ӹ�����
	Remark varchar(200) ,								--��ע
	CheckInTime datetime  ,								--����ʱ��
	isDelete tinyint   Check (isDelete=1 or isDelete=0),--���ݼ�¼״̬ 0��ʹ���� 1����¼��ɾ��
	AlterTime datetime									--�޸�ʱ��
)
go
update   TruckTeam set isDelete=0

--������Ϣ��(������Ϣ�����ڴ�ź͹���)
if exists ( select * from sys.objects where  name='Truck')
drop table Truck
create table Truck
(
	TruckID int not null primary key identity(1,1),--�������
	Number varchar(20) not null,--���ƺ���
	BuyDate datetime ,--��������
	Type varchar(20) ,--��������
	Length varchar(20) ,--����
	Tonnage int ,--��λ
	FK_TeamID int  references TruckTeam(TeamID ),--�������ӱ��
	State tinyint,--����״̬��1�������� 2������
	Remark varchar(500),--��ע
	CheackInTime datetime ,--����ʱ��
)
go


insert into Truck values
(111,getdate(),'��˾����',11,'11',11,1,2222,getdate())
--��ʻԱ��Ϣ�����ڴ�ź͹����ʻԱ��Ϣ��
if exists (select * from sys.objects where name='Driver')
drop table Driver 
create table Driver
(
	DriverID int not null primary key  identity (1,1),--˾�����
	Name varchar(20) not null,--˾������
	Sex tinyint ,--�Ա�0 �� 1Ů
	Birth datetime ,--��������
	Phone varchar(20),--��ϵ�绰
	IDCard varchar(50),--���֤����
	FK_TeamID int references TruckTeam(TeamID ) ,--���ӱ��
	State tinyint,--����״̬: 1:������2:����
	Remark varchar(500),--��ע
	CheckInTime datetime,--����ʱ��
	IsDelete tinyint not null,--���ݼ�¼״̬�� 0ʹ���� 1���ü�¼��ɾ��
	AlterTime datetime ,--�޸�ʱ��
)
go

--������ʻԱ�����󶨱�
if exists (select * from sys.objects where name='Contact')
drop table Contact 
create table Contact
(
	ContactID int not null identity(1,1) primary key,--��ϵ���
	FK_TruckID int  references Truck(TruckID),--�������
	FK_DriverID int references Driver(DriverID) ,--˾�����
)


--�������˵���
if exists(select * from sys.objects where name='Carriers')
drop table Carriers
create table Carriers
(
	
	CarriersID int not null primary key identity(1,1),--���˵����
	SendCompany varchar(50),--������λ
	SendAddress varchar(100),--������λ��ַ
	SendLinkman varchar(20),--������
	SendPhone varchar(20),--�����˵绰
	ReceiveCompany varchar(50),--�ջ�λ
	FK_ReceiveAddress varchar(100),--�ջ�λ��ַ   
	ReceiveLinkman varchar(20),--�ջ���/��ϵ��
	ReceivePhone varchar(20),--�ջ��˵绰/��ϵ�˵绰
	LeaverDate datetime,--����ʱ��
	ReceiveDate datetime,--�ջ�ʱ��
	FinishedState tinyint not null,--��������0�������� 1���ѵ��� 2����ǩ�� 3:�ѽ��� ���в����޸�  
	InsuranceCost float,--���շ�
	TransportCost float,--�˷�
	OtherCost float,--��������
	TotalCOst float,--�ϼƷ���
	Remark varchar(500),--��ע
	FK_UserID int not null references [User](UserID),--ҵ��Ա
	CheckInTime datetime not null,--¼��ʱ��
	IsDelete tinyint not null,--���ݼ�¼״̬��0:ʹ���� 1:�ü�¼��ɾ��
	AlterTime datetime,--�޸�ʱ��
)



--���������
if exists(select * from sys.objects where name='Goods')
drop table Goods
create table Goods
(
	GoodsID int not null identity(1,1) primary key,--���
	GoodsName varchar(50),--����
	Amount int,--����
	[Weight] float,--����
	Volume float,--���
	FK_CarriersID int references Carriers(CarriersID),--���˵����
	IsDelete tinyint not null,--���ݼ�¼״̬��0��ʹ���� 1���ü�¼��ɾ��

)


if exists(select * from sys.objects where name='Scheduling')
drop table Scheduling
--����������Ϣ��
create table Scheduling 
(
	SchedulingID int NOT NULL  primary key identity(001,1),--���ȱ�ţ��ֶ��Զ���ţ�
	StartTime datetime NULL ,--����ʱ��
	FK_CarriersID int NULL references Carriers(CarriersID),-- ���˵����
	FK_TruckID int NULL references Truck(TruckID),-- �������
	OilCost float NULL,-- �ͷ�
	Toll float NULL ,--���ŷ�
	Fine float NULL ,--����
	OtherCost float NULL ,--��������
	TotalCost float NULL ,--�ϼƳɱ�
	FK_UserID int NULL references [user](UserID),-- ����Ա
	Remark varchar(500) NULL,-- ��ע
	CheckInTime datetime NULL ,--����ʱ��
	IsDelete tinyint NOT NULL ,--���ݼ�¼״̬ : 0:ʹ���� 1:�ü�¼��ɾ��
	AlterTime datetime NULL ,--�޸�ʱ��
)


--������־�ֵ� 
if exists(select * from sys.objects where name='[Type]')
drop table [Type]
create table [Type]
(
	TypeID int not null  primary key,--����ID
	TypeName varchar(20) --������
)


--ϵͳ��־��
if exists(select * from sys.objects where name='SysLog')
drop table SysLog
create table  SysLog
(
	LogID int  not null identity(1,1) primary key,--��־���
	Behavior varchar(500),--������Ϊ
	Fk_TypeID int references Type (TypeID),--��Ϊ����
	FK_UserID int references [User](UserID),--�û�ID
	[Parameters] varchar(max),--����
	ProcName varchar(50),--�洢������
	IP varchar(20),--��¼IP
	CheckInTime datetime ,--д��ʱ��
	Exception varchar(max),--�쳣ʱ������
	IsException tinyint ,--0������ 1���쳣
	
)
select TypeName from [Type]
-- SysLog(LogID, Behavior, FK_TypeID, FK_UserID, Parameters, ProcName, IP, CheckInTime, Exception, IsException) VALUES 
---(1, '��������Ա����½ϵͳ', 1, 1, 'admin,888888', 'dbo.P_User_VerifyPassword', '192.168.50.48', CAST(N'2009-09-10 15:35:28.000' AS DateTime), N'0', 0)

-------------------------------------------------------------------------------------------------------------------------------------------
--2����ѯ��

select * from [Role]
select * from [User]
select * from TruckTeam  
select * from Truck
select * from Driver
select * from Contact
select * from Carriers
select * from Goods
select * from Scheduling
select * from [Type]
select * from SysLog



-------------------------------------------------------------------------------------------------------------------------------------------
--3���������
--���û����в�������
insert into [Role] values('ϵͳ����Ա','ϵͳά������־ά��')
insert into [Role] values('�������Ա','�����ۺϲ�ѯ����ʷ���������ѯ������ɱ�����')
insert into [Role] values('�������Ա','��ʻԱ��Ϣά��')
insert into [Role] values('����Ա','�����ۺϲ�ѯ����ʷ���������ѯ����������')
insert into [Role] values('����ҵ��Ա','�����������')
insert into [Role] values('����','ȫ��Ȩ��')

--insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
insert into [User] values('�ϴ�',0,1,1,'119','123123123@q.cn',1,getdate(),0,getdate());
insert into [User] values('�϶�',1,2,2,'120','124123123@q.cn',2,getdate(),0,getdate());
insert into [User] values('����',0,3,3,'112','125123123@q.cn',3,getdate(),0,getdate());
insert into [User] values('����',1,4,4,'198','126123123@q.cn',4,getdate(),0,getdate());
insert into [User] values('����',0,5,5,'110','127123123@q.cn',5,getdate(),0,getdate());
insert into [User] values('����',0,6,6,'110','127123123@q.cn',6,getdate(),0,getdate());

--insert into TruckTeam values ('һ��','����','���Ǵ���','2017-01-01',0,'2017-01-01');
--insert into TruckTeam values ('����','����','��������һ������','2017-01-01',0,'2017-01-01');
--insert into TruckTeam values ('����','����','��������һ������','2017-01-01',0,'2017-01-01');


--�����ʻԱ��Ϣ��
--(Name,Sex,Birth,Phone,IDCard,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)



--������˵���


INSERT [Type] VALUES (1, '��½')
INSERT [Type] VALUES (2, '���Ա��')
INSERT [Type] VALUES (3, 'ɾ��Ա��')
INSERT [Type] VALUES (4, '�޸�Ա��')
INSERT [Type] VALUES (5, '��ӳ���')
INSERT [Type] VALUES (6, 'ɾ������')
INSERT [Type] VALUES (7, '�޸ĳ���')
INSERT [Type] VALUES (8, '��ӳ���')
INSERT [Type] VALUES (9, 'ɾ������')
INSERT [Type] VALUES (10, '�޸ĳ���')
INSERT [Type] VALUES (11, '��Ӽ�ʻԱ')
INSERT [Type] VALUES (12, 'ɾ����ʻԱ')
INSERT [Type] VALUES (13, '�޸ļ�ʻԱ')
INSERT [Type] VALUES (14, '��ӳ��˵�')
INSERT [Type] VALUES (15, 'ɾ�����˵�')
INSERT [Type] VALUES (16, '�޸ĳ��˵�')
INSERT [Type] VALUES (17, '���ճ��˵�')
INSERT [Type] VALUES (18, '������˵�')
INSERT [Type] VALUES (19, '�޸Ľ���')
INSERT [Type] VALUES (20, '��ӵ�������')
INSERT [Type] VALUES (21, '�󶨳�����ʻԱ')
INSERT [Type] VALUES (22, '�������ʻԱ')
INSERT [Type] VALUES (23, 'ע��')

insert into TruckTeam values ('һ��','����','���Ǵ���','2017-01-01',0,'2017-01-01');

--������˵���
 insert into  Carriers
(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany ,FK_ReceiveAddress ,ReceiveLinkman ,ReceivePhone,LeaverDate
,ReceiveDate,FinishedState,InsuranceCost,TransportCost ,OtherCost ,TotalCOst ,Remark ,FK_UserID,CheckInTime  ,IsDelete ,AlterTime)
values ('ˮ��ѧУ','��԰·136��','����','110','ѧ���㳡','���Ӻ�','С��','119',getdate(),getdate(),2,10,10,0,20,'',0,getdate(),0,getdate())


-------------------------------------------------------------------------------------------------------------------------------------------
--������ͼ


--4��	�����洢����
--
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<���˵��Ĳ�ѯ,,>
-- =============================================
if exists(select * from sys.objects where name='P_Carriers_selectCarriers')
drop proc P_Carriers_selectCarriers
go
create  proc P_Carriers_selectCarriers
as
begin
	select * from Carriers
	return 
end

-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<ͨ��id���г��˵��Ĳ�ѯ>
-- =============================================

if exists(select * from sys.objects where name='P_Carriers_selectALLCarriersCarriersID')
drop proc P_Carriers_selectALLCarriersCarriersID
go
create  proc P_Carriers_selectALLCarriersCarriersID
@Carriersid int
as
begin
	select * from Carriers where CarriersID=@Carriersid	 
end



-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<�޸ĳ��˵�>
-- =============================================

if exists(select * from sys.objects where name='P_Carriers_updateCarriers')
drop proc P_Carriers_updateCarriers
go
create  proc P_Carriers_updateCarriers
	@CarriersID int,
	@SendCompany varchar(50),
	@SendAddress varchar(100),
	@SendLinkman varchar(20),
	@SendPhone varchar(20),
	@ReceiveCompany varchar(50),
	@FK_ReceiveAddress varchar(100),
	@ReceiveLinkman varchar(20),
	@ReceivePhone varchar(20),
	@InsuranceCost float,
	@TransportCost float,
	@OtherCost float	
as
begin
	update Carriers 
	set 
	SendCompany=@SendCompany ,
	SendAddress=@SendAddress, 
	SendLinkman=@SendLinkman,
	SendPhone=@SendPhone ,
	ReceiveCompany=@ReceiveCompany ,
	FK_ReceiveAddress=@FK_ReceiveAddress ,
	ReceiveLinkman=@ReceiveLinkman,
	ReceivePhone=@ReceivePhone, 	
	InsuranceCost=@InsuranceCost,
	TransportCost=@TransportCost,
	OtherCost=@OtherCost	
	where CarriersID=@CarriersID	
end
go
-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<ɾ�����˵�>
-- =============================================


if exists(select * from sys.objects where name='P_Carriers_deleteCarriers_CarriersID')
drop proc P_Carriers_deleteCarriers_CarriersID
go
create  proc P_Carriers_deleteCarriers_CarriersID
	@CarriersID int
as
begin
	delete from Carriers where CarriersID=@CarriersID
end

-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<���˵��е�������ѯ>
-- =============================================


if exists(select * from sys.objects where name='P_Carriers_ConditionQueryCarriers')
drop proc P_Carriers_ConditionQueryCarriers
go
create  proc P_Carriers_ConditionQueryCarriers
	@CarriersID int,
	@ReceiveLinkman varchar(20),
	@SendLinkman varchar(20),
	@leaverDateBegin varchar(20),
	@leaverDateEnd varchar(20)
as
	 declare @sql varchar(200)
	 set @sql='	select * from Carriers where 1=1';
	 if(@CarriersID is not null and @CarriersID<>'')
	 begin 
		set @sql+=' and CarriersID='+  CAST(@CarriersID as varchar);
	 end
	 if(@ReceiveLinkman is not null and @ReceiveLinkman<>'')
	 begin
	  set @sql+=' and ReceiveLinkman='+''''+@ReceiveLinkman+'''';
	 end
	 if(@leaverDateBegin is not null and @leaverDateBegin<>'' )
	 begin
		set @sql+=' and leaverDate>='+''''+@leaverDateBegin+'''';
	 end
	 if( @leaverDateEnd is not  null and @leaverDateEnd<>'')
	 begin
		set @sql+=' and leaverDate<='+''''+@leaverDateEnd+'''';
	 end
	
	print @sql;--��ӡ
	exec @sql --ִ��
go
-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<��ѯ��ǰ�ɵ��ȳ���>
-- =============================================

P_Carriers_selectCarriers
--�Լ�ʻԱ�������ӵ�������������ѯ
--���ȵĳ����Ǳ��󶨵ĳ���
if exists(select * from sys.objects where name='P_CommandTask_selectAll')
drop proc P_CommandTask_selectAll
go
	
create proc P_CommandTask_selectAll
as
	select Truck.*,Driver.Name, TruckTeam.Leader,TruckTeam.TeamID from TruckTeam 
	join Truck on Truck.FK_TeamID=TruckTeam.TeamID 
	join Driver on Driver.FK_TeamID=TruckTeam.TeamID 
	join Contact on Contact.FK_TruckID=Truck.TruckID
	where TruckTeam.isDelete=0  and    Truck.State=2   --ûɾ�����ǿ���
go 

--Truck.State=2����״̬δ����

-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<��������>
-- =============================================

--��ӳ��˵��������ﴦ���������˾�����������и��²���
if exists(select * from sys.objects where name='P_CommandTask_InsertScheduling')
drop proc P_CommandTask_InsertScheduling
go	
create proc P_CommandTask_InsertScheduling
@Userid int,
@CarriersID int,
@TruckID int
--@DriverID int
as 

begin transaction--��ʼ����
	declare @errorSun int--��������������
    set @errorSun=0;--Ĭ�ϸ�ֵΪ0

	--���³��˱�״̬���޸�ʱ��ĳɵ�ǰʱ��
	update Carriers
	set AlterTime=getdate(),
	FinishedState=1 --״̬�޸ĳ��ѵ���
	where CarriersID=@CarriersID
	SET @errorSun+=@@ERROR --�ۼ��Ƿ��д�

	--���³�����״̬��Ϊ�����У��޸�ʱ��ĳɵ�ǰʱ��
	update Truck 
	set State=1
	where TruckID=@TruckID
	SET @errorSun+=@@ERROR --�ۼ��Ƿ��д�

	--���¼�ʻԱ��״̬��Ϊ�����У��޸�ʱ��ĳɵ�ǰʱ��
 --   update  Driver --�������SQL���
	--set State=1 
	--where DriverID=@DriverID
 --   set @errorSun+=@@ERROR --�ۼ��Ƿ��д�



	--����ȱ����һ������
    insert into Scheduling (		
	StartTime, 
	FK_CarriersID, 
	FK_TruckID, 
	OilCost, 
	Toll, 
	Fine, 
	OtherCost, 
	TotalCost, 
	FK_UserID, 	
	CheckInTime,
	IsDelete,	
	AlterTime
	) 
	values(
	getdate(),
	@CarriersID,
	@TruckID,
	0,
	0,
	0,
	0,
	0,
	@Userid,	
	getdate(),
	0,
	getdate()
	)
    set @errorSun+=@@ERROR --�ۼ��Ƿ��д�

	IF @errorSun<>0 --����д���
	BEGIN
	PRINT '�д��󣬻ع�'
	ROLLBACK TRANSACTION--����ع����
	END

	ELSE
	BEGIN
	PRINT '�ɹ����ύ'
	COMMIT TRANSACTION--�����ύ���
END
--return @errorSun--��������ύ�ɹ�Ϊ0����������ύʧ�ܴ���0
go 



-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<���ﵥ��ѯ>
-- =============================================
--

if exists(select * from sys.objects where name='P_Goods_selectGoods')
drop proc P_Goods_selectGoods
go
	
create proc P_Goods_selectGoods
as
	select * from Goods
go 
-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<��ѯ�ɱ�ά��>
-- =============================================
--
if exists(select * from sys.objects where name='P_CostMaintenance_create')
drop proc P_CostMaintenance_create 
go
	
create proc P_CostMaintenance_create
as
   select s.TotalCost as CarriersCost,c.TotalCOst as SchedulingCost,* from  Carriers  c join Scheduling  s on s.FK_CarriersID=c.CarriersID 
go

-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<�ɱ�ά��������ѯ(�ַ���ƴ��>
-- =============================================

if exists(select * from sys.objects where name='P_CostMaintenance_select')
drop proc P_CostMaintenance_select 
go	
create proc P_CostMaintenance_select
@rbFinishedState int ,
@ReceiveDateBegin nvarchar(100),
@ReceiveDateEnd nvarchar(100)
as	
	declare @sql nvarchar(500);
	set @sql='select s.TotalCost as CarriersCost,c.TotalCOst as SchedulingCost,* from  Carriers  c join Scheduling  s on s.FK_CarriersID=c.CarriersID  where 1=1 ';

	if (@rbFinishedState is not null  and @rbFinishedState<>0 )
	begin
	set @sql+=' and FinishedState=' +CAST(@rbFinishedState as nvarchar);
	end
	--�������ַ�����Ϊnull��Ҳ�����Ǹ����ַ���
	if( @ReceiveDateBegin is not null and @ReceiveDateBegin<>'' )
	begin
		set @sql+=' and ReceiveDate>=' +''''+@ReceiveDateBegin+'''';
	end

	if(@ReceiveDateEnd is  not null and @ReceiveDateEnd<>'')
	begin
		set @sql+=' and ReceiveDate<=' +''''+@ReceiveDateEnd+'''';
	end

	print @sql;
	exec  sp_executesql @sql;

go
-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<������־�ļ���>
-- =============================================

if exists(select * from sys.objects where name='P_SysLog_selectALLSysLog')
drop proc P_SysLog_selectALLSysLog 
go	
create proc P_SysLog_selectALLSysLog
as
	select * from SysLog
go

-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<ͨ��id�Ե���������Ϣ����в�ѯ>
-- =============================================

if exists(select * from sys.objects where name='P_Scheduling_selectScheduling_SchedulingID')
drop proc P_Scheduling_selectScheduling_SchedulingID 
go	
create proc P_Scheduling_selectScheduling_SchedulingID
@Schedulingid int
as
	select * from Scheduling where SchedulingID=@Schedulingid;
go

-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<ͨ��id�Ե���������Ϣ������޸�>
-- =============================================
if exists(select * from sys.objects where name='P_Scheduling_updateScheduling_SchedulingID')
drop proc P_Scheduling_updateScheduling_SchedulingID 
go	
create proc P_Scheduling_updateScheduling_SchedulingID
@Schedulingid int,
@OilCost float ,-- �ͷ�
@Toll float  ,--���ŷ�
@Fine float  ,--����
@OtherCost float  --��������

as
	update Scheduling set OilCost=@OilCost,Toll= @Toll,Fine=@Fine,OtherCost=@OtherCost
	where SchedulingID=@Schedulingid;
go


-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<���ϵͳ��־���>
-- =============================================

if exists(select * from sys.objects where name='P_SysLog_AddSysLog')
drop proc P_SysLog_AddSysLog 
go	
create proc P_SysLog_AddSysLog

  @Behavior varchar(500),
  @Fk_TypeID varchar(500),--type
  @FK_UserID int,
  @Parameters varchar(max),
  @ProcName varchar(50),
  @IP varchar(20),
  @Exception varchar(max),
  @IsException tinyint 
as
	insert into 
	 SysLog(	
	 Behavior, 
	 Fk_TypeID,  
	 FK_UserID,
	 [Parameters], 
	 ProcName, 
	 IP,
	 CheckInTime,
	 Exception,
	 IsException
	 )
	 values
	 (	
	  @Behavior, 
	  @Fk_TypeID,  
	  @FK_UserID,
	  @Parameters , 
	  @ProcName, 
	  @IP,
	  getdate(),
	  @Exception,
	  @IsException
	 )
go

-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-10>
-- Description:	<������ҳ>
-- =============================================

	--ȡǰn������
	--select  top 5 * from (select ROW_NUMBER() over ( order by TruckID) as rowNumber ,* from Truck )as a where TruckID>5*(n-1)--n(3)
if exists(select * from sys.objects where name='P_GetPage')
drop proc P_GetPage
go	
create proc P_GetPage
@PageIndex int ,--����ҳ
@PageSize int, --ÿ����ʾ����ҳ��
@RecordCount  int output  --�����������
as
	declare @sql nvarchar(500);
	select @RecordCount=count(0) from Carriers 
	set @sql ='select  top '+CAST(@PageSize as nvarchar)+
	' * from (select ROW_NUMBER() over ( order by CarriersID) as rowNumber , * from Carriers )as a where CarriersID>'
	+CAST(@PageSize as nvarchar)+'*('+CAST(@PageIndex as nvarchar) +'-1)';
	print @sql;
	exec  sp_executesql @sql--�������ô洢����
go



-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-10>
-- Description:	<��ѯ����>
-- =============================================

if exists(select * from sys.objects where name='P_Goods_select')
drop proc P_Goods_select
go	
create proc P_Goods_select
as 
	select * from Goods
go



-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<��ӳ��˵�>
-- =============================================

if exists(select * from sys.objects where name='P_Carriers_AddtCarriers_CarriersID')
drop proc P_Carriers_AddtCarriers_CarriersID
go
create  proc P_Carriers_AddtCarriers_CarriersID
	@SendCompany varchar(50),
	@SendAddress varchar(100),
	@SendLinkman varchar(20),
	@SendPhone varchar(20),
	@ReceiveCompany varchar(50),
	@FK_ReceiveAddress varchar(100),
	@ReceiveLinkman varchar(20),
	@ReceivePhone varchar(20),
	@InsuranceCost float,
	@TransportCost float,
	@OtherCost float,
	@FK_UserID int,
	@Carriersid int output
as
begin
   insert into  Carriers	
	 (SendCompany,
	  SendAddress,
	  SendLinkman,
	  SendPhone,
	  ReceiveCompany,
	  FK_ReceiveAddress ,
	  ReceiveLinkman ,
	  ReceivePhone,
	  LeaverDate
	  ,ReceiveDate,
	  FinishedState,
	  InsuranceCost,
	  TransportCost ,
	  OtherCost ,
	  TotalCOst ,
	  Remark ,
	  FK_UserID,
	  CheckInTime  ,
	  IsDelete ,
	  AlterTime)
      values 
   ( 
	@SendCompany ,
	@SendAddress ,
	@SendLinkman ,
	@SendPhone ,
	@ReceiveCompany ,
	@FK_ReceiveAddress ,
	@ReceiveLinkman ,
	@ReceivePhone ,
	getdate(),--����ʱ��
	getdate(),--�ջ�ʱ��
	0 ,
	@InsuranceCost ,--���շ�
	@TransportCost ,--�˷�
	@OtherCost ,--��������
	@InsuranceCost+@TransportCost+@OtherCost,--�ϼƷ���
	'' ,--��ע
	@FK_UserID ,--ҵ��Ա
	getdate(),
	0 ,--���ݼ�¼״̬��0:ʹ���� 1:�ü�¼��ɾ��
	getdate()
    )

	select top 1 @Carriersid=CarriersID from Carriers order by CarriersID desc
end

-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<�޸ĳ��˵�>
-- =============================================

if exists(select * from sys.objects where name='P_Carriers_updateCarrier')
drop proc P_Carriers_updateCarrier
go
create  proc P_Carriers_updateCarrier
	@CarriersID int,
	@SendCompany varchar(50),
	@SendAddress varchar(100),
	@SendLinkman varchar(20),
	@SendPhone varchar(20),
	@ReceiveCompany varchar(50),
	@FK_ReceiveAddress varchar(100),
	@ReceiveLinkman varchar(20),
	@ReceivePhone varchar(20),
	@InsuranceCost float,
	@TransportCost float,
	@OtherCost float	
as
begin
	update Carriers 
	set 
	SendCompany=@SendCompany ,
	SendAddress=@SendAddress, 
	SendLinkman=@SendLinkman,
	SendPhone=@SendPhone ,
	ReceiveCompany=@ReceiveCompany ,
	FK_ReceiveAddress=@FK_ReceiveAddress ,
	ReceiveLinkman=@ReceiveLinkman,
	ReceivePhone=@ReceivePhone, 	
	InsuranceCost=@InsuranceCost,
	TransportCost=@TransportCost,
	OtherCost=@OtherCost	
	where CarriersID=@CarriersID	
end
go
-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<ִ�����ҳ>
-- =============================================
if exists(select * from sys.objects where name='p_getpage_table')
drop proc p_getpage_table
go
create  PROCEDURE p_getpage_table

 @pageIndex int,--�ڼ�ҳ
 @pageSize int,--ÿҳչʾ������
 @tableName varchar(50),--����
 @keyID varchar(20),--ID
 @strWhere nvarchar(200),--����
 @RecordCount int output   --��ȡ��������
	AS
BEGIN
declare @sql nvarchar(500);
--select @RecordCount=count(0) from Truck
SET @sql='select @RowCount=count(0) from '+@tableName+@strWhere;
exec sp_executesql @sql,N'@RowCount int output',@RecordCount output;
print @sql


set @sql='select top '+cast(@pageSize as nvarchar) + '* from  (select row_number() over(order by ' + @keyID+') as rownum, * from '+@tableName+@strWhere+')as
a where rownum >'+cast(@pageSize as nvarchar)+ '*(' +cast(@pageIndex as nvarchar)+'-1)'

print @sql
exec sp_executesql @sql
END
