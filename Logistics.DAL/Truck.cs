using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
   public class Truck
    {
        /// <summary>
        /// 获取车队信息
        /// </summary>
        /// <returns></returns>
        public DataSet bindddlTruck()
        {
            string sql = "select *  from Truck";
            DataSet dst;
            dst = DBHelper.getdataset(sql);
            return dst;
        }
        /// <summary>
        /// 获取下拉框中车队信息中的车队编号
        /// </summary>
        /// <returns></returns>
        public DataSet bindddlTruckTeamID()
        {
            string sql = "select  *  from TruckTeam";
            DataSet dst;
            dst = DBHelper.getdataset(sql);
            return dst;
        }
        /// <summary>
        /// 获取下拉框中车辆信息中的车辆类型
        /// </summary>
        /// <returns></returns>
        public DataSet bindddlTruckType()
        {
            string sql = "select DISTINCT Type,*   from Truck";
            DataSet dst;
            dst = DBHelper.getdataset(sql);
            return dst;
        }

     
        /// <summary>
        /// 根据条件查询
        /// </summary>
        /// <returns></returns>
        public DataSet rptTruckList(int fk_TeamID,string numer,string type)
        {
            string sql = "select * from Truck where 1=1  ";
            if(!string.IsNullOrEmpty(numer))
            {
                sql += "  and Number=@numer";
            }
            if (type!="-1")
            {
                sql += "  and Type=@type";
            }
            if (fk_TeamID>-1)
            {
                sql += " and FK_TeamID=@teamid";
            }
            SqlParameter[] sp = {
                   new SqlParameter("@teamid",fk_TeamID),
                   new SqlParameter("@numer",numer),
                   new SqlParameter("@type",type)
            };

            DataSet dst;
            dst = DBHelper.getdataset(sql,sp);
            return dst;
        }
        /// <summary>
        /// 向Truck中添加数据
        /// </summary>
        /// <param name="truckModel"></param>
        /// <returns></returns>
        public int AddTruck(Model.Truck truckModel)
        {
            string sql = "insert into Truck values(@number,@CheackInTime,@type,@length,@lonnane,@teamid,2,@remark,getdate())";
            SqlParameter[] sp = {

                  new SqlParameter("@number",truckModel.Number),
                  new SqlParameter("@CheackInTime",truckModel.CheackInTime),
                  new SqlParameter("@type",truckModel.Type),
                  new SqlParameter("@length",truckModel.Length),
                  new SqlParameter("@lonnane",truckModel.Tonnage),
                  new SqlParameter("@teamid",truckModel.FK_TeamID),
                  new SqlParameter("@remark",truckModel.Remark),

            };
            int result = DBHelper.ExecuteNonQuery(sql,sp);
            return result;
        }
        /// <summary>
        /// 通过 TruckID 获取truck信息
        /// </summary>
        /// <param name="truckid"></param>
        /// <returns></returns>
        public DataTable getTrucklistTruckid(int truckid)
        {
            string sql = "select * from Truck where TruckID=@id";
            SqlParameter[] sp = {
                new SqlParameter("@id",truckid)
            };
            return DBHelper.getdataset(sql, sp).Tables[0];
        }
        /// <summary>
        /// 更新truck信息
        /// </summary>
        /// <returns></returns>
        public int updeTruck(Model.Truck truckModer)
        {
            string sql = "update Truck set Number=@number,BuyDate=getdate(),Type=@type,Length=@length,Tonnage=@tonnage,FK_TeamID=@TeamID,State=@state,Remark=@remark,CheackInTime=getdate() where  TruckID=@id;";
            SqlParameter[] sp = {
                new SqlParameter("@id",truckModer.TruckID),
                new SqlParameter("@number",truckModer.Number),
               // new SqlParameter("@buyDate",truckModer.BuyDate),
                new SqlParameter("@type",truckModer.Type),
                new SqlParameter("@length",truckModer.Length),
                new SqlParameter("@tonnage",truckModer.Tonnage),
                new SqlParameter("@TeamID",truckModer.FK_TeamID),
                new SqlParameter("@state",truckModer.State),
                new SqlParameter("@remark",truckModer.Remark),
                new SqlParameter("@cheackintime",truckModer.CheackInTime),
            };
            return   DBHelper.ExecuteNonQuery(sql, sp);
            
        }
        /// <summary>
        /// 删除车辆
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int deleteTruck(int id)
        {
            string sql = "delete  from Truck where TruckID=@id";
            SqlParameter[] sp = {
                new SqlParameter("@id",id)

            };
            return DBHelper.ExecuteNonQuery(sql,sp);
        }
        /// <summary>
        /// 查询没有被绑定的车辆 
        /// </summary>
        /// <param name="DriverID">该传值过来的 车队id</param>
        /// <returns></returns>
        public DataSet getContactDriverID(int TeamID)
        {

            //查询没有被绑定的车辆 和 该传值过来的 车队的车
            string sql = "select * from Truck where TruckID not in ( select FK_TruckID from Contact) and FK_TeamID=@TeamID";
            SqlParameter[] para = {
                 new  SqlParameter("@TeamID",SqlDbType.Int)

            };
            para[0].Value = TeamID;
            return DBHelper.getdataset(sql, para);

        }
        /// <summary>
        /// 绑定车辆 向添加驾驶员车辆绑定表
        /// </summary>
        /// <param name="TruckID">车辆编号</param>
        /// <param name="DriverID">司机编号</param>
        /// <returns></returns>
        public int InsertContact(int TruckID,int DriverID)
         {
            string sql = "insert into Contact values(@TruckID,@DriverID)";
            SqlParameter[] para = {
                 new  SqlParameter("@TruckID",TruckID),
                 new  SqlParameter("@DriverID",DriverID),
            };
         
            return DBHelper.ExecuteNonQuery(sql, para);

        }

    }

}
