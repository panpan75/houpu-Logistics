using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace Logistics.DAL
{
    public  class TruckTeam
    {
       
        /// <summary>
        /// 查询车队信息
        /// </summary>
        /// <returns></returns>
        public DataTable getTruckTeam() {

            DataTable dt;
            string sql = "select * from TruckTeam";

            return dt = DBHelper.getdataset(sql, null).Tables[0];
        }
        /// <summary>
        /// 通过下拉列表查询车队信息中的车队
        /// </summary>
        public DataTable getTruckTeam_TeamName()
        {
            DataTable dt;
            string sql = "select TeamName,TeamID from TruckTeam";

            return  dt=DBHelper.getdataset(sql, null).Tables[0];
        }
        /// <summary>
        /// 根据文本框进行条件查询
        /// </summary>
        /// <param name="leader">文本框中的车队负责人</param>
        /// <param name="ID">下拉列表中的ID</param>
        /// <returns></returns>
        public DataSet TetLeader( string ID,string leader) {
        
            DataSet dt;
            string sql = "select * from TruckTeam where 1=1 ";

            if (ID != "-1") {
                sql += "  and TeamID=@id";
            }
            if (!string.IsNullOrEmpty(leader)) {
                sql += "  and Leader=@Leader";
            }
            SqlParameter[] sp = {
                new SqlParameter("@id",ID),
                new SqlParameter("@Leader",leader)
            };

             return  dt = DBHelper.getdataset(sql, sp);


        }
        /// <summary>
        /// 根据下拉列表和文本框删除车队信息
        /// </summary>
        /// <param name="id">下拉列表的ID</param>
        /// <returns></returns>
        public int DeleterTruckTeam(string id) {


     
            string sql = "delete  from TruckTeam where TeamID=@id";
            SqlParameter[] ps = {
                    new SqlParameter ("@id",id)
            };


            int relut = DBHelper.ExecuteNonQuery(sql, ps);
            return relut;
        }
        /// <summary>
        /// 进行对车队的更新操作
        /// </summary>
        /// <param name="truckteam"></param>
        /// <returns></returns>
        public int UpdateTruckTeam(Model.TruckTeam truckteam)
        {
            string sql = "update TruckTeam set TeamName=@teamname,Leader=@leader,Remark=@remark,CheckInTime=@CheckInTime,AlterTime=@AlterTime  where TeamID=@teamid";
            SqlParameter[] ps = {
                new SqlParameter("@teamname",truckteam.TeamName),
                new SqlParameter("@leader",truckteam.Leader),
                new SqlParameter("@remark",truckteam.Remark),
                new SqlParameter("@teamid",truckteam.TeamID),
                new SqlParameter("@CheckInTime",truckteam.CheckInTime),
                new SqlParameter("@AlterTime",truckteam.AlterTime)
                    };
               int  result=DBHelper.ExecuteNonQuery(sql,ps);
               return result;
        
        }
        /// <summary>
        /// 添加车队
        /// </summary>
        /// <returns></returns>
        public int AddTruckTeam(Model.TruckTeam truckteam)
        {

            string sql = "insert into TruckTeam values(@name,@leader,@rem,getdate(),0,getdate());";
            SqlParameter[] sp = {
                new SqlParameter("@name",truckteam.TeamName),
                new SqlParameter("@leader",truckteam.Leader),
                new SqlParameter("@rem",truckteam.Remark),                          
            // new SqlParameter("@delete",UserModer.IsDelete),
            };
            int result = DBHelper.ExecuteNonQuery(sql, sp);
            return result;
        }
          
    }
}
