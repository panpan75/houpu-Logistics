use  master
create database Logistics
go
use Logistics;

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


--������Ϣ��(������Ϣ�����ڴ�ź͹���)
if exists ( select * from sys.objects where  name='Truck')
drop table Truck
create table Truck
(
	TruckID int not null primary key identity(1,1),--�������
	Number varchar(20) not null,--���ƺ���
	BuyDate datetime ,--��������
	Type varchar(20) ,--��������
	Length varchar(20) ,--����ʱ��
	Tonnage int ,--��λ
	FK_TeamID int  references TruckTeam(TeamID ),--�������ӱ��
	State tinyint,--����״̬��1�������� 2������
	Remark varchar(500),--��ע
	CheackInTime datetime ,--����ʱ��
)
go

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
		 datetime,--�ջ�ʱ��
	FinishedState tinyint not null,--��������0�������� 1���ѵ��� 2����ǩ�� 3:�ѽ��� ���в����޸�   2Ĭ��
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

--��ѯ��
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


select * from [User] where Account =1 and Password=1
select  * from  [User] join [Role] on  [User].FK_RoleID=[Role].RoleID
select * from TruckTeam where 1=1 and TeamID=10 and Leader=''
select * from TruckTeam join Truck on Truck.FK_TeamID=TruckTeam.TeamID join  Driver on Driver.FK_TeamID=TruckTeam.TeamID
select * from Truck where FK_TeamID not in (select FK_DriverID from Contact) and FK_TeamID=3
--select [User].*,[Role].RoleName from [User]  join [Role] on [User].UserID=[Role].RoleID where  UserID=1
--��ѯ�󶨳�����id
select FK_DriverID from Contact
--��ѯ��������û�󶨹����� ����id
select * from Driver
--��ѯ��������û�󶨹����ĳ���id  �� ��ǰ���ӵ�id
--select * from Driver where FK_TeamID not in (select FK_DriverID from Contact) and FK_TeamID=3


--�������
--���û����в�������
insert into [Role] values('ϵͳ����Ա','����Ȩ��')
insert into [Role] values('�������Ա','����Ȩ��')
insert into [Role] values('�������Ա','����Ȩ��')
insert into [Role] values('����Ա','����Ȩ��')
insert into [Role] values('����ҵ��Ա','����Ȩ��')
insert into [Role] values('����','ȫ��Ȩ��')

insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime) values('����',0,1,1,'119','123@q.cn',1,getdate(),0,getdate());
insert into [User] values('����',1,2,2,'120','124@q.cn',2,getdate(),0,getdate());
insert into [User] values('����',0,3,3,'110','125@q.cn',3,getdate(),1,getdate());
insert into [User] values('��4',0,4,4,'110','125@q.cn',6,getdate(),6,getdate());

insert into TruckTeam values   ('һ��','����','���Ǵ���','2017-01-01',0,'2017-01-01');
insert into TruckTeam values   ('����','����','��������һ������','2017-01-01',0,'2017-01-01');
insert into TruckTeam values   ('����','����','��������һ������','2017-01-01',0,'2017-01-01');

insert into Truck values('һ��100010','2017-01-01','��˾����','2017-02-01',150,1,1,'','2017-02-01')
insert into Truck values('����100010','2017-01-01','��˾����','2017-02-01',150,2,2,'','2017-02-01')
insert into Truck values('����100011','2017-01-01','��˾����','2017-02-01',150,2,2,'','2017-02-01')
insert into Truck values('����100012','2017-01-01','��˾����','2017-02-01',150,2,1,'','2017-02-01')
insert into Truck values('����100010','2017-01-01','��˾����','2017-02-01',150,3,2,'','2017-02-01')
insert into Truck values('����100010','2017-01-01','˽�ҳ���','2017-02-01',150,3,2,'','2017-02-01')
insert into Truck values('����100011','2017-01-01','��˾����','2017-02-01',150,3,2,'','2017-02-01')
insert into Truck values('����100012','2017-01-01','��˾����','2017-02-01',150,3,1,'','2017-02-01')
insert into Truck values('����100013','2017-01-01','��˾����','2017-02-01',150,3,2,'','2017-02-01')

--�����ʻԱ��Ϣ��
insert into Driver values('С��',0,'1996-11-26 09:00:00','186371868300','410482198804138128',1,2,'',GETDATE(),0,GETDATE())
insert into Driver values('С��',2,'1996-11-26 09:00:00','186371868301','410482198804138148',1,2,'',GETDATE(),0,GETDATE())
insert into Driver values('С��',1,'1996-11-26 09:00:00','186371868302','410482198804138138',1,1,'',GETDATE(),0,GETDATE())
insert into Driver values('С��',0,'1996-11-26 09:00:00','186371868303','410482198804138128',2,2,'',GETDATE(),0,GETDATE())
insert into Driver values('С��',0,'1996-11-26 09:00:00','186371868304','410482198804238148',3,1,'',GETDATE(),0,GETDATE())
insert into Driver values('С��',1,'1996-11-26 09:00:00','186371868305','410482198804438138',3,2,'',GETDATE(),0,GETDATE())
insert into Driver values('С��',0,'1996-11-26 09:00:00','186371868306','410482198804238148',3,1,'',GETDATE(),0,GETDATE())
insert into Driver values('С��',1,'1996-11-26 09:00:00','186371868307','41048219880428138',3,2,'',GETDATE(),0,GETDATE())
insert into Driver values('С��',0,'1996-11-26 09:00:00','186371868308','410482198804138148',3,1,'',GETDATE(),0,GETDATE())
insert into Driver(Name,Sex,Birth,Phone,IDCard,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime) values('С��',1,'1996-11-26 09:00:00',
'186371868309','410482198804138138',3,1,'',GETDATE(),0,GETDATE())

--������˵���
 insert into  Carriers
(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany ,FK_ReceiveAddress ,ReceiveLinkman ,ReceivePhone,LeaverDate
,ReceiveDate,FinishedState,InsuranceCost,TransportCost ,OtherCost ,TotalCOst ,Remark ,FK_UserID,CheckInTime  ,IsDelete ,AlterTime)
values ('ˮ��ѧУ','��԰·136��','����','110','ѧ���㳡','���Ӻ�','С��','119',getdate(),getdate(),2,10,10,0,20,'',1,getdate(),0,getdate())

insert into  Carriers
(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany ,FK_ReceiveAddress ,ReceiveLinkman ,ReceivePhone,LeaverDate
,ReceiveDate,FinishedState,InsuranceCost,TransportCost ,OtherCost ,TotalCOst ,Remark ,FK_UserID,CheckInTime  ,IsDelete ,AlterTime)
values ('ˮ��ѧУ','��԰·136��','ɧ��','114','ѧ���㳡','���Ӻ�','С��','119',getdate(),getdate(),2,5,5,0,10,'',1,getdate(),0,getdate())

--�����ʻԱ�����󶨱�
insert into Contact values(1,1)
insert into Contact values(2,2)

insert into Goods values('�ײ�',1,1,1,1,0)
insert into Goods values('�ϰײ�',10,12,1,1,0)

--������ͼ


--�����洢����
--���˵��Ĳ�ѯ
if exists(select * from sys.objects where name='P_Carriers_selectCarriers')
drop proc P_Carriers_selectCarriers
go
create  proc P_Carriers_selectCarriers
as
begin
	select * from Carriers
	return 
end
--ͨ��id���г��˵��Ĳ�ѯ
if exists(select * from sys.objects where name='P_Carriers_selectALLCarriersCarriersID')
drop proc P_Carriers_selectALLCarriersCarriersID
go

create  proc P_Carriers_selectALLCarriersCarriersID
@Carriersid int
as
begin
	select * from Carriers where CarriersID=@Carriersid	 
end



--��ӳ��˵�
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
	@FK_UserID int 
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
	2 ,
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
end

--�޸ĳ��˵�
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


--�Գ��˵�����������ѯ
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
	 c @sql varchar(200)
	 set @sql='	select * from Carriers where 1=1';
	 if(@CarriersID is not null)
	 begin
		set @sql+=' and CarriersID='+@CarriersID
	 end
	 if(@ReceiveLinkman is not null)
	 begin
	  set @sql+=' and ReceiveLinkman='+''''+@ReceiveLinkman+'''';
	 end
	 if(@leaverDateBegin is not null and @leaverDateEnd is null)
	 begin
		set @sql+=' and leaverDate>='+''''+@leaverDateBegin+'''';
	 end
	 if(@leaverDateBegin is  null and @leaverDateEnd is not  null)
	 begin
		set @sql+=' and leaverDate<='+''''+@leaverDateEnd+'''';
	 end
	  if(@leaverDateBegin is not null and @leaverDateEnd is not  null)
	 begin
		set @sql+=' and leaverDate between'+''''+@leaverDateBegin+''''+' and '+''''+@leaverDateEnd+'''';
	 end
	print @sql;--��ӡ
	exec @sql --ִ��
go


P_Carriers_selectCarriers
--�Լ�ʻԱ�������ӵ�������������ѯ
if exists(select * from sys.objects where name='P_CommandTask_selectAll')
drop proc P_CommandTask_selectAll
go
	
create proc P_CommandTask_selectAll
as
	select Truck.*,Driver.Name, TruckTeam.Leader,TruckTeam.TeamID from TruckTeam 
	join Truck on Truck.FK_TeamID=TruckTeam.TeamID 
	join Driver on Driver.FK_TeamID=TruckTeam.TeamID 
	join Contact on Contact.FK_TruckID=Truck.TruckID

where TruckTeam.isDelete=0 and    Truck.State=2
go 
--Truck.State=2����״̬δ����

--��ӳ��˵��������ﴦ�����
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
	set AlterTime=getdate()
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




--���ﵥ��ѯ����

if exists(select * from sys.objects where name='P_Goods_selectGoods')
drop proc P_Goods_selectGoods
go
	
create proc P_Goods_selectGoods
as
	select * from Goods
go 

--�����ɱ�ά��
 if exists(select * from sys.objects where name='P_CostMaintenance_create')
drop proc P_CostMaintenance_create 
go
	
create proc P_CostMaintenance_create
as
select Carriers.*,Scheduling.TotalCOst from  Carriers join Scheduling on Scheduling.FK_CarriersID=Carriers.CarriersID 
go
--�ɱ�ά��������ѯ
 if exists(select * from sys.objects where name='P_CostMaintenance_select')
drop proc P_CostMaintenance_select 
go	
create proc P_CostMaintenance_select
@rbFinishedState int ,
@ReceiveDateBegin varchar(100),
@ReceiveDateEnd varchar(100)
as	
	declare @sql varchar(200)
	set @sql='select * from  Carriers where 1=1'
	if (@rbFinishedState is not null)
	set @sql+=' and FinishedState=' +@rbFinishedState
	if( @ReceiveDateBegin is not null and @ReceiveDateBegin is null)
	set @sql+=' and FinishedState>=' +''''+@ReceiveDateBegin+''''
	if( @ReceiveDateBegin is  null and @ReceiveDateBegin is  not null)
	set @sql+=' and FinishedState<=' +''''+@ReceiveDateEnd+''''
	if( @ReceiveDateBegin is not  null and @ReceiveDateBegin is   null)
	set @sql+=' and FinishedState between' +''''+@ReceiveDateBegin +''''+' and'+''''+@ReceiveDateEnd+''''
go