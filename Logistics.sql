use  master
create database Logistics
go
use Logistics;

--创建角色表
if exists(select * from sys.objects where name='[Role]')
drop table [Role]
create table [Role]
(
	RoleID int  not null primary key identity(1,1),--角色编号
	RoleName nvarchar(50) ,--角色名称
	RolePurview nvarchar(50),--角色权限
)

--创建用户表
if exists (select * from sys.objects where name='[User]')
drop table	[User]
create table [User]
(
	UserID int not null identity(1,1) primary key,--0角色编号
	UserName varchar(20) not null,--1用户姓名
	Sex tinyint null,--2性别 
	Account varchar(20) not null,--3用户账号
	Password varchar(100) not null,--4用户密码
	Phone varchar(20) null,--5联系电话
	Email varchar(50) ,--6电子邮箱
	FK_RoleID int not null references Role(RoleID),--7用户角色编号
	CheckInTime  dateTime not null  ,--8加入时间
	IsDelete tinyint not null,--9数据记录状态 0：使用中 1：该记录已删除	
	AlterTime datetime not null --10修改时间
)	

--车队信息表（用于存放和管理车队信息）
if  exists (select * from sys.objects  where name ='TruckTeam')
drop table TruckTeam 
create table TruckTeam
(
	TeamID int not null identity(1,1) primary key,		--车队编号（字段自动编号）
	TeamName varchar(50) not null,						--车队名称
	Leader varchar(50) ,								--车队负责人
	Remark varchar(200) ,								--备注
	CheckInTime datetime  ,								--创队时间
	isDelete tinyint   Check (isDelete=1 or isDelete=0),--数据记录状态 0：使用中 1：记录已删除
	AlterTime datetime									--修改时间
)
go


--车辆信息表(车辆信息表用于存放和管理)
if exists ( select * from sys.objects where  name='Truck')
drop table Truck
create table Truck
(
	TruckID int not null primary key identity(1,1),--车辆编号
	Number varchar(20) not null,--车牌号码
	BuyDate datetime ,--购车日期
	Type varchar(20) ,--车辆类型
	Length varchar(20) ,--创队时间
	Tonnage int ,--吨位
	FK_TeamID int  references TruckTeam(TeamID ),--所属车队编号
	State tinyint,--工作状态：1：承运中 2：空闲
	Remark varchar(500),--备注
	CheackInTime datetime ,--加入时间
)
go

--驾驶员信息表（用于存放和管理驾驶员信息）
if exists (select * from sys.objects where name='Driver')
drop table Driver 
create table Driver
(
	DriverID int not null primary key  identity (1,1),--司机编号
	Name varchar(20) not null,--司机姓名
	Sex tinyint ,--性别：0 男 1女
	Birth datetime ,--出生日期
	Phone varchar(20),--联系电话
	IDCard varchar(50),--身份证号码
	FK_TeamID int references TruckTeam(TeamID ) ,--车队编号
	State tinyint,--工作状态: 1:承运中2:空闲
	Remark varchar(500),--备注
	CheckInTime datetime,--加入时间
	IsDelete tinyint not null,--数据记录状态： 0使用中 1：该记录已删除
	AlterTime datetime ,--修改时间
)
go

--创建驾驶员车辆绑定表
if exists (select * from sys.objects where name='Contact')
drop table Contact 
create table Contact
(
	ContactID int not null identity(1,1) primary key,--联系编号
	FK_TruckID int  references Truck(TruckID),--车辆编号
	FK_DriverID int references Driver(DriverID) ,--司机编号
)


--创建承运单表
if exists(select * from sys.objects where name='Carriers')
drop table Carriers
create table Carriers
(
	
	CarriersID int not null primary key identity(1,1),--承运单编号
	SendCompany varchar(50),--发货单位
	SendAddress varchar(100),--发货单位地址
	SendLinkman varchar(20),--发货人
	SendPhone varchar(20),--发货人电话
	ReceiveCompany varchar(50),--收获单位
	FK_ReceiveAddress varchar(100),--收获单位地址   
	ReceiveLinkman varchar(20),--收获人/联系人
	ReceivePhone varchar(20),--收获人电话/联系人电话
	LeaverDate datetime,--承运时间
		 datetime,--收货时间
	FinishedState tinyint not null,--完成情况：0：待调查 1：已调查 2：已签收 3:已结算 进行操作修改   2默认
	InsuranceCost float,--保险费
	TransportCost float,--运费
	OtherCost float,--其他费用
	TotalCOst float,--合计费用
	Remark varchar(500),--备注
	FK_UserID int not null references [User](UserID),--业务员
	CheckInTime datetime not null,--录入时间
	IsDelete tinyint not null,--数据记录状态：0:使用中 1:该记录已删除
	AlterTime datetime,--修改时间
)



--创建货物表
if exists(select * from sys.objects where name='Goods')
drop table Goods
create table Goods
(
	GoodsID int not null identity(1,1) primary key,--编号
	GoodsName varchar(50),--名称
	Amount int,--数量
	[Weight] float,--重量
	Volume float,--体积
	FK_CarriersID int references Carriers(CarriersID),--承运单编号
	IsDelete tinyint not null,--数据记录状态：0：使用中 1：该记录已删除

)


if exists(select * from sys.objects where name='Scheduling')
drop table Scheduling
--调度任务信息表
create table Scheduling 
(
	SchedulingID int NOT NULL  primary key identity(001,1),--调度编号（字段自动编号）
	StartTime datetime NULL ,--出发时间
	FK_CarriersID int NULL references Carriers(CarriersID),-- 承运单编号
	FK_TruckID int NULL references Truck(TruckID),-- 车辆编号
	OilCost float NULL,-- 油费
	Toll float NULL ,--过桥费
	Fine float NULL ,--罚款
	OtherCost float NULL ,--其他费用
	TotalCost float NULL ,--合计成本
	FK_UserID int NULL references [user](UserID),-- 调度员
	Remark varchar(500) NULL,-- 备注
	CheckInTime datetime NULL ,--调度时间
	IsDelete tinyint NOT NULL ,--数据记录状态 : 0:使用中 1:该记录已删除
	AlterTime datetime NULL ,--修改时间
)


--创建日志字典 
if exists(select * from sys.objects where name='[Type]')
drop table [Type]
create table [Type]
(
	TypeID int not null  primary key,--类型ID
	TypeName varchar(20) --类型名
)


--系统日志表
if exists(select * from sys.objects where name='SysLog')
drop table SysLog
create table  SysLog
(
	LogID int  not null identity(1,1) primary key,--日志编号
	Behavior varchar(500),--操作行为
	Fk_TypeID int references Type (TypeID),--行为类型
	FK_UserID int references [User](UserID),--用户ID
	[Parameters] varchar(max),--参数
	ProcName varchar(50),--存储过程名
	IP varchar(20),--登录IP
	CheckInTime datetime ,--写入时间
	Exception varchar(max),--异常时间详情
	IsException tinyint ,--0：正常 1：异常
	
)

--查询表
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
--查询绑定车辆过id
select FK_DriverID from Contact
--查询车辆表中没绑定过车的 车辆id
select * from Driver
--查询车辆表中没绑定过车的车辆id  和 当前车队的id
--select * from Driver where FK_TeamID not in (select FK_DriverID from Contact) and FK_TeamID=3


--添加数据
--向用户表中插入数据
insert into [Role] values('系统管理员','部分权限')
insert into [Role] values('财务管理员','部分权限')
insert into [Role] values('运输管理员','部分权限')
insert into [Role] values('调度员','部分权限')
insert into [Role] values('承运业务员','部分权限')
insert into [Role] values('管理','全部权限')

insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime) values('张三',0,1,1,'119','123@q.cn',1,getdate(),0,getdate());
insert into [User] values('李四',1,2,2,'120','124@q.cn',2,getdate(),0,getdate());
insert into [User] values('王五',0,3,3,'110','125@q.cn',3,getdate(),1,getdate());
insert into [User] values('王4',0,4,4,'110','125@q.cn',6,getdate(),6,getdate());

insert into TruckTeam values   ('一队','张三','这是大佬','2017-01-01',0,'2017-01-01');
insert into TruckTeam values   ('二队','李四','这是另外一个大佬','2017-01-01',0,'2017-01-01');
insert into TruckTeam values   ('三队','王五','这是另外一个大佬','2017-01-01',0,'2017-01-01');

insert into Truck values('一队100010','2017-01-01','公司车辆','2017-02-01',150,1,1,'','2017-02-01')
insert into Truck values('二队100010','2017-01-01','公司车辆','2017-02-01',150,2,2,'','2017-02-01')
insert into Truck values('二队100011','2017-01-01','公司车辆','2017-02-01',150,2,2,'','2017-02-01')
insert into Truck values('二队100012','2017-01-01','公司车辆','2017-02-01',150,2,1,'','2017-02-01')
insert into Truck values('三队100010','2017-01-01','公司车辆','2017-02-01',150,3,2,'','2017-02-01')
insert into Truck values('三队100010','2017-01-01','私家车辆','2017-02-01',150,3,2,'','2017-02-01')
insert into Truck values('三队100011','2017-01-01','公司车辆','2017-02-01',150,3,2,'','2017-02-01')
insert into Truck values('三队100012','2017-01-01','公司车辆','2017-02-01',150,3,1,'','2017-02-01')
insert into Truck values('三队100013','2017-01-01','公司车辆','2017-02-01',150,3,2,'','2017-02-01')

--插入驾驶员信息表
insert into Driver values('小明',0,'1996-11-26 09:00:00','186371868300','410482198804138128',1,2,'',GETDATE(),0,GETDATE())
insert into Driver values('小李',2,'1996-11-26 09:00:00','186371868301','410482198804138148',1,2,'',GETDATE(),0,GETDATE())
insert into Driver values('小方',1,'1996-11-26 09:00:00','186371868302','410482198804138138',1,1,'',GETDATE(),0,GETDATE())
insert into Driver values('小爱',0,'1996-11-26 09:00:00','186371868303','410482198804138128',2,2,'',GETDATE(),0,GETDATE())
insert into Driver values('小成',0,'1996-11-26 09:00:00','186371868304','410482198804238148',3,1,'',GETDATE(),0,GETDATE())
insert into Driver values('小龙',1,'1996-11-26 09:00:00','186371868305','410482198804438138',3,2,'',GETDATE(),0,GETDATE())
insert into Driver values('小周',0,'1996-11-26 09:00:00','186371868306','410482198804238148',3,1,'',GETDATE(),0,GETDATE())
insert into Driver values('小赵',1,'1996-11-26 09:00:00','186371868307','41048219880428138',3,2,'',GETDATE(),0,GETDATE())
insert into Driver values('小王',0,'1996-11-26 09:00:00','186371868308','410482198804138148',3,1,'',GETDATE(),0,GETDATE())
insert into Driver(Name,Sex,Birth,Phone,IDCard,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime) values('小孙',1,'1996-11-26 09:00:00',
'186371868309','410482198804138138',3,1,'',GETDATE(),0,GETDATE())

--插入承运单表
 insert into  Carriers
(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany ,FK_ReceiveAddress ,ReceiveLinkman ,ReceivePhone,LeaverDate
,ReceiveDate,FinishedState,InsuranceCost,TransportCost ,OtherCost ,TotalCOst ,Remark ,FK_UserID,CheckInTime  ,IsDelete ,AlterTime)
values ('水利学校','花园路136号','老猪','110','学府广场','龙子湖','小猪','119',getdate(),getdate(),2,10,10,0,20,'',1,getdate(),0,getdate())

insert into  Carriers
(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany ,FK_ReceiveAddress ,ReceiveLinkman ,ReceivePhone,LeaverDate
,ReceiveDate,FinishedState,InsuranceCost,TransportCost ,OtherCost ,TotalCOst ,Remark ,FK_UserID,CheckInTime  ,IsDelete ,AlterTime)
values ('水利学校','花园路136号','骚猪','114','学府广场','龙子湖','小猪','119',getdate(),getdate(),2,5,5,0,10,'',1,getdate(),0,getdate())

--插入驾驶员车辆绑定表
insert into Contact values(1,1)
insert into Contact values(2,2)

insert into Goods values('白菜',1,1,1,1,0)
insert into Goods values('老白菜',10,12,1,1,0)

--创建视图


--创建存储过程
--承运单的查询
if exists(select * from sys.objects where name='P_Carriers_selectCarriers')
drop proc P_Carriers_selectCarriers
go
create  proc P_Carriers_selectCarriers
as
begin
	select * from Carriers
	return 
end
--通过id进行承运单的查询
if exists(select * from sys.objects where name='P_Carriers_selectALLCarriersCarriersID')
drop proc P_Carriers_selectALLCarriersCarriersID
go

create  proc P_Carriers_selectALLCarriersCarriersID
@Carriersid int
as
begin
	select * from Carriers where CarriersID=@Carriersid	 
end



--添加承运单
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
	getdate(),--承运时间
	getdate(),--收货时间
	2 ,
	@InsuranceCost ,--保险费
	@TransportCost ,--运费
	@OtherCost ,--其他费用
	@InsuranceCost+@TransportCost+@OtherCost,--合计费用
	'' ,--备注
	@FK_UserID ,--业务员
	getdate(),
	0 ,--数据记录状态：0:使用中 1:该记录已删除
	getdate()
 )
end

--修改承运单
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


--对承运单进行条件查询
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
	print @sql;--打印
	exec @sql --执行
go


P_Carriers_selectCarriers
--对驾驶员车辆车队调补表进行连表查询
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
--Truck.State=2车辆状态未空闲

--添加承运单进行事物处理操作
if exists(select * from sys.objects where name='P_CommandTask_InsertScheduling')
drop proc P_CommandTask_InsertScheduling
go	
create proc P_CommandTask_InsertScheduling
@Userid int,
@CarriersID int,
@TruckID int
--@DriverID int
as 

begin transaction--开始事物
	declare @errorSun int--计算错误操作次数
    set @errorSun=0;--默认赋值为0

	--更新承运表状态，修改时间改成当前时间
	update Carriers
	set AlterTime=getdate()
	where CarriersID=@CarriersID
	SET @errorSun+=@@ERROR --累计是否有错

	--更新车辆表状态改为承运中，修改时间改成当前时间
	update Truck 
	set State=1
	where TruckID=@TruckID
	SET @errorSun+=@@ERROR --累计是否有错

	--更新驾驶员表状态改为承运中，修改时间改成当前时间
 --   update  Driver --事务操作SQL语句
	--set State=1 
	--where DriverID=@DriverID
 --   set @errorSun+=@@ERROR --累计是否有错

	--向调度表添加一条数据
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
    set @errorSun+=@@ERROR --累计是否有错

	IF @errorSun<>0 --如果有错误
	BEGIN
	PRINT '有错误，回滚'
	ROLLBACK TRANSACTION--事务回滚语句
	END

	ELSE
	BEGIN
	PRINT '成功，提交'
	COMMIT TRANSACTION--事务提交语句
END
--return @errorSun--如果事物提交成功为0，如果事物提交失败大于0
go 




--货物单查询操作

if exists(select * from sys.objects where name='P_Goods_selectGoods')
drop proc P_Goods_selectGoods
go
	
create proc P_Goods_selectGoods
as
	select * from Goods
go 

--创建成本维护
 if exists(select * from sys.objects where name='P_CostMaintenance_create')
drop proc P_CostMaintenance_create 
go
	
create proc P_CostMaintenance_create
as
select Carriers.*,Scheduling.TotalCOst from  Carriers join Scheduling on Scheduling.FK_CarriersID=Carriers.CarriersID 
go
--成本维护检索查询
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