use  master;
create database Logistics
go
use Logistics
--1、创建表
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
update   TruckTeam set isDelete=0

--车辆信息表(车辆信息表用于存放和管理)
if exists ( select * from sys.objects where  name='Truck')
drop table Truck
create table Truck
(
	TruckID int not null primary key identity(1,1),--车辆编号
	Number varchar(20) not null,--车牌号码
	BuyDate datetime ,--购车日期
	Type varchar(20) ,--车辆类型
	Length varchar(20) ,--长度
	Tonnage int ,--吨位
	FK_TeamID int  references TruckTeam(TeamID ),--所属车队编号
	State tinyint,--工作状态：1：承运中 2：空闲
	Remark varchar(500),--备注
	CheackInTime datetime ,--加入时间
)
go


insert into Truck values
(111,getdate(),'公司车辆',11,'11',11,1,2222,getdate())
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
	ReceiveDate datetime,--收货时间
	FinishedState tinyint not null,--完成情况：0：待调度 1：已调度 2：已签收 3:已结算 进行操作修改  
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
select TypeName from [Type]
-- SysLog(LogID, Behavior, FK_TypeID, FK_UserID, Parameters, ProcName, IP, CheckInTime, Exception, IsException) VALUES 
---(1, '超级管理员：登陆系统', 1, 1, 'admin,888888', 'dbo.P_User_VerifyPassword', '192.168.50.48', CAST(N'2009-09-10 15:35:28.000' AS DateTime), N'0', 0)

-------------------------------------------------------------------------------------------------------------------------------------------
--2、查询表

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
--3、添加数据
--向用户表中插入数据
insert into [Role] values('系统管理员','系统维护，日志维护')
insert into [Role] values('财务管理员','运力综合查询和历史承运任务查询，运输成本核算')
insert into [Role] values('运输管理员','驾驶员信息维护')
insert into [Role] values('调度员','运力综合查询，历史承运任务查询，调度任务')
insert into [Role] values('承运业务员','承运任务管理')
insert into [Role] values('管理','全部权限')

--insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime)
insert into [User] values('老大',0,1,1,'119','123123123@q.cn',1,getdate(),0,getdate());
insert into [User] values('老二',1,2,2,'120','124123123@q.cn',2,getdate(),0,getdate());
insert into [User] values('老三',0,3,3,'112','125123123@q.cn',3,getdate(),0,getdate());
insert into [User] values('老四',1,4,4,'198','126123123@q.cn',4,getdate(),0,getdate());
insert into [User] values('老五',0,5,5,'110','127123123@q.cn',5,getdate(),0,getdate());
insert into [User] values('老六',0,6,6,'110','127123123@q.cn',6,getdate(),0,getdate());

--insert into TruckTeam values ('一队','张三','这是大佬','2017-01-01',0,'2017-01-01');
--insert into TruckTeam values ('二队','李四','这是另外一个大佬','2017-01-01',0,'2017-01-01');
--insert into TruckTeam values ('三队','王五','这是另外一个大佬','2017-01-01',0,'2017-01-01');


--插入驾驶员信息表
--(Name,Sex,Birth,Phone,IDCard,FK_TeamID,State,Remark,CheckInTime,IsDelete,AlterTime)



--插入承运单表


INSERT [Type] VALUES (1, '登陆')
INSERT [Type] VALUES (2, '添加员工')
INSERT [Type] VALUES (3, '删除员工')
INSERT [Type] VALUES (4, '修改员工')
INSERT [Type] VALUES (5, '添加车队')
INSERT [Type] VALUES (6, '删除车队')
INSERT [Type] VALUES (7, '修改车队')
INSERT [Type] VALUES (8, '添加车辆')
INSERT [Type] VALUES (9, '删除车辆')
INSERT [Type] VALUES (10, '修改车辆')
INSERT [Type] VALUES (11, '添加驾驶员')
INSERT [Type] VALUES (12, '删除驾驶员')
INSERT [Type] VALUES (13, '修改驾驶员')
INSERT [Type] VALUES (14, '添加承运单')
INSERT [Type] VALUES (15, '删除承运单')
INSERT [Type] VALUES (16, '修改承运单')
INSERT [Type] VALUES (17, '接收承运单')
INSERT [Type] VALUES (18, '结算承运单')
INSERT [Type] VALUES (19, '修改结算')
INSERT [Type] VALUES (20, '添加调度任务')
INSERT [Type] VALUES (21, '绑定车辆驾驶员')
INSERT [Type] VALUES (22, '解绑车辆驾驶员')
INSERT [Type] VALUES (23, '注销')

insert into TruckTeam values ('一队','张三','这是大佬','2017-01-01',0,'2017-01-01');

--插入承运单表
 insert into  Carriers
(SendCompany,SendAddress,SendLinkman,SendPhone,ReceiveCompany ,FK_ReceiveAddress ,ReceiveLinkman ,ReceivePhone,LeaverDate
,ReceiveDate,FinishedState,InsuranceCost,TransportCost ,OtherCost ,TotalCOst ,Remark ,FK_UserID,CheckInTime  ,IsDelete ,AlterTime)
values ('水利学校','花园路136号','老猪','110','学府广场','龙子湖','小猪','119',getdate(),getdate(),2,10,10,0,20,'',0,getdate(),0,getdate())


-------------------------------------------------------------------------------------------------------------------------------------------
--创建视图


--4、	创建存储过程
--
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<承运单的查询,,>
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
-- Description:	<通过id进行承运单的查询>
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
-- Description:	<修改承运单>
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
-- Description:	<删除承运单>
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
-- Description:	<承运单中的条件查询>
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
	
	print @sql;--打印
	exec @sql --执行
go
-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<查询当前可调度车辆>
-- =============================================

P_Carriers_selectCarriers
--对驾驶员车辆车队调补表进行连表查询
--调度的车辆是被绑定的车辆
if exists(select * from sys.objects where name='P_CommandTask_selectAll')
drop proc P_CommandTask_selectAll
go
	
create proc P_CommandTask_selectAll
as
	select Truck.*,Driver.Name, TruckTeam.Leader,TruckTeam.TeamID from TruckTeam 
	join Truck on Truck.FK_TeamID=TruckTeam.TeamID 
	join Driver on Driver.FK_TeamID=TruckTeam.TeamID 
	join Contact on Contact.FK_TruckID=Truck.TruckID
	where TruckTeam.isDelete=0  and    Truck.State=2   --没删除且是空闲
go 

--Truck.State=2车辆状态未空闲

-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<调度任务>
-- =============================================

--添加承运单进行事物处理操作，对司机，车辆进行更新操作
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
	set AlterTime=getdate(),
	FinishedState=1 --状态修改成已调度
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



-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<货物单查询>
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
-- Description:	<查询成本维护>
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
-- Description:	<成本维护条件查询(字符串拼接>
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
	--穿过的字符串不为null，也可能是个空字符串
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
-- Description:	<创建日志文件表>
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
-- Description:	<通过id对调度任务信息表进行查询>
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
-- Description:	<通过id对调度任务信息表进行修改>
-- =============================================
if exists(select * from sys.objects where name='P_Scheduling_updateScheduling_SchedulingID')
drop proc P_Scheduling_updateScheduling_SchedulingID 
go	
create proc P_Scheduling_updateScheduling_SchedulingID
@Schedulingid int,
@OilCost float ,-- 油费
@Toll float  ,--过桥费
@Fine float  ,--罚款
@OtherCost float  --其他费用

as
	update Scheduling set OilCost=@OilCost,Toll= @Toll,Fine=@Fine,OtherCost=@OtherCost
	where SchedulingID=@Schedulingid;
go


-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<添加系统日志表表>
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
-- Description:	<添加真分页>
-- =============================================

	--取前n条数据
	--select  top 5 * from (select ROW_NUMBER() over ( order by TruckID) as rowNumber ,* from Truck )as a where TruckID>5*(n-1)--n(3)
if exists(select * from sys.objects where name='P_GetPage')
drop proc P_GetPage
go	
create proc P_GetPage
@PageIndex int ,--多少页
@PageSize int, --每行显示多少页数
@RecordCount  int output  --获得数据总量
as
	declare @sql nvarchar(500);
	select @RecordCount=count(0) from Carriers 
	set @sql ='select  top '+CAST(@PageSize as nvarchar)+
	' * from (select ROW_NUMBER() over ( order by CarriersID) as rowNumber , * from Carriers )as a where CarriersID>'
	+CAST(@PageSize as nvarchar)+'*('+CAST(@PageIndex as nvarchar) +'-1)';
	print @sql;
	exec  sp_executesql @sql--调用内置存储过程
go



-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-10>
-- Description:	<查询货物>
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
-- Description:	<添加承运单>
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
	getdate(),--承运时间
	getdate(),--收货时间
	0 ,
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

	select top 1 @Carriersid=CarriersID from Carriers order by CarriersID desc
end

-- =============================================
-- Author:		<Author,,zhoupan>
-- Create date: <2017-07-06>
-- Description:	<修改承运单>
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
-- Description:	<执行真分页>
-- =============================================
if exists(select * from sys.objects where name='p_getpage_table')
drop proc p_getpage_table
go
create  PROCEDURE p_getpage_table

 @pageIndex int,--第几页
 @pageSize int,--每页展示的数量
 @tableName varchar(50),--表名
 @keyID varchar(20),--ID
 @strWhere nvarchar(200),--条件
 @RecordCount int output   --获取数据总量
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
