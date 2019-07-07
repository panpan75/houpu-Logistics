using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
   public class Driver
    {
     
        /// <summary>
        /// 查询驾驶员信息表
        /// </summary>
        /// <returns></returns>
        public DataSet  bindDrverList()
        {
            DataSet dst = new DataSet();
            string sql = "select * from  Driver";

            dst = DBHelper.getdataset(sql, null);
            return dst;
        }
        /// <summary>
        /// 查询驾驶员信息表根据id
        /// </summary>
        /// <returns></returns>
        public DataSet DrverListDriverID(int id)
        {
            DataSet dst = new DataSet();
            string sql = "select * from  Driver where DriverID=@id";
            SqlParameter[] sp = {
                new SqlParameter ("@id",id)
            };
           
            dst = DBHelper.getdataset(sql, sp);
            return dst;
        }

        /// <summary>
        /// 绑定下拉列表信息
        /// </summary>
        /// <returns></returns>
        public DataSet ddlDrver()
        {
            DataSet dst = new DataSet();
            string sql = "select distinct State, FK_TeamID,DriverID from  Driver";
            dst = DBHelper.getdataset(sql, null);
            return dst;
        }
        /// <summary>
        /// 根据条件查询驾驶员信息
        /// </summary>
        /// <param name="driverModel"></param>
        /// <returns></returns>
        public DataSet CriteriaDrver(Model.Driver driverModel)
        {
            DataSet dst = new DataSet();
            string sql = "select * from  Driver where 1=1";
            if (!string.IsNullOrEmpty(driverModel.Name))
            {
                sql += " and  Name=@name";
            }
            if (!string.IsNullOrEmpty(driverModel.Phone))
            {
                sql += " and  Phone=@phone";
            }
            if (driverModel.State >0)
            {
                sql += " and  State=@state";
            }
            if (driverModel.FK_TeamID >= 0)
            {
                sql += " and  FK_TeamID=@teamid";
            }

            SqlParameter[] sp = {

                new SqlParameter("@name",driverModel.Name),
                new SqlParameter("@phone",driverModel.Phone),
                new SqlParameter("@state",driverModel.State),
                new SqlParameter("@teamid",driverModel.FK_TeamID),
            };

            dst = DBHelper.getdataset(sql,sp);
            return dst;
        }
        /// <summary>
        /// 删除驾驶员信息
        /// </summary>
        /// <param name="DriverModel"></param>
        /// <returns></returns>
        public int DeleteDrver(Model.Driver DriverModel)
        {

            string sql = "delete from  Driver where  DriverID =@Driverid";
            SqlParameter[] sp = {
                new SqlParameter("@Driverid",DriverModel.DriverID)
            };

            int result = DBHelper.ExecuteNonQuery(sql,sp);
            return result;
        }
         /// <summary>
         /// 向驾驶员表中插入数据
         /// </summary>
         /// <param name="DriverModel"></param>
         /// <returns></returns>
        public int InsertDrver(Model.Driver DriverModel)
        {
            string sql = "insert into Driver  values(@name,@sex,@birth,@phone,@idcard,@temaid,@state,@reark,GETDATE(),0,GETDATE())";
            SqlParameter[] sp = {
                new SqlParameter("@name",DriverModel.Name),
                new SqlParameter("@sex",DriverModel.Sex),
                new SqlParameter("@birth",DriverModel.Birth),
                new SqlParameter("@phone",DriverModel.Phone),
                new SqlParameter("@idcard",DriverModel.IDCard),
                new SqlParameter("@temaid",DriverModel.FK_TeamID),
                new SqlParameter("@state",DriverModel.State),
                new SqlParameter("@reark",DriverModel.Remark),
           
            };
            int result;
            result = DBHelper.ExecuteNonQuery(sql,sp);
            return result;
        }
        /// <summary>
        /// 更新驾驶员表
        /// </summary>
        /// <param name="DriverModel"></param>
        /// <returns></returns>
        public int UpdateDrver(Model.Driver DriverModel)
        {
            string sql = "update  Driver set Name=@name,Sex=@sex,Birth=@birth,Phone=@phone,IDCard=@idcard,State=@state,Remark=@reark  where  DriverID=@id";
            SqlParameter[] sp = {
                new SqlParameter("@name",DriverModel.Name),
                new SqlParameter("@sex",DriverModel.Sex),
                new SqlParameter("@birth",DriverModel.Birth),
                new SqlParameter("@phone",DriverModel.Phone),
                new SqlParameter("@idcard",DriverModel.IDCard),
                new SqlParameter("@temaid",DriverModel.FK_TeamID),
                new SqlParameter("@state",DriverModel.State),
                new SqlParameter("@reark",DriverModel.Remark),
                new SqlParameter("@id",DriverModel.DriverID)

            };
            int result;
            result = DBHelper.ExecuteNonQuery(sql, sp);
            return result;
        }
       
        /// <summary>
        /// 接触绑定 删除驾驶员车辆绑定表
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int DeleteContact(int id)
        {
            string sql = "Delete from Contact where FK_DriverID = @id";
            SqlParameter[] para = {
                 new  SqlParameter("@id",SqlDbType.Int)
            };
            para[0].Value = id;
            return DBHelper.ExecuteNonQuery(sql,para);

        }
      
    }


           
}
