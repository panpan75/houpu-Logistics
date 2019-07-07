using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.BLL
{
   public  class TruckTeam
    {

        DAL.TruckTeam TruckTeamdal = new DAL.TruckTeam();
        /// <summary>
        /// 查询车队信息
        /// </summary>
        /// <returns></returns>
        public DataTable getTruckTeam()
        {
            DataTable dt;
            //定义一个缓存键
            string keyName = "CacheTruckTeam";
            //获取缓存
            dt = (DataTable)CaCheHelper.GedCache(keyName);
            //如果缓存没值就调用查询方法
            if (dt == null)
            {
                dt = TruckTeamdal.getTruckTeam();
                //如果能读取到表中数据 就加入缓存
                if (dt.Rows.Count > 0)
                {
                    CaCheHelper.insertCache(keyName, dt, DateTime.Now.AddMinutes(5));

                }
            }

           // dt = TruckTeamdal.getTruckTeam();
            return dt;




        }
        /// <summary>
        /// 通过下拉列表查询车队信息中的车队
        /// </summary>
        public DataTable getTruckTeam_TeamName()
        {
            DataTable dt;
            return dt=  TruckTeamdal.getTruckTeam_TeamName();  
            
        }
        /// <summary>
        /// 根据文本框进行条件查询
        /// </summary>
        /// <param name="leader">文本框中的车队负责人</param>
        /// <param name="ID">下拉列表中的ID</param>
        /// <returns></returns>
        public DataSet TetLeader(string ID ,string leader) {
  
            DataSet dt;
            return dt = TruckTeamdal.TetLeader(ID,leader);

        }

        /// <summary>
        /// 根据下拉列表和文本框删除车队信息
        /// </summary>
        /// <param name="id">下拉列表的ID</param>
        /// <returns></returns>
        public int DeleterTruckTeam(string id)
        {
            int TTID = TruckTeamdal.DeleterTruckTeam(id);
            return TTID;
        }
        /// <summary>
        /// 进行对车队的更新操作
        /// </summary>
        /// <param name="truckteam"></param>
        /// <returns></returns>
        public int UpdateTruckTeam(Model.TruckTeam truckteam)
        {

            int result = TruckTeamdal.UpdateTruckTeam(truckteam);
            return result;



        }
        /// <summary>
        /// 添加车队
        /// </summary>
        /// <returns></returns>
        public int AddTruckTeam(Model.TruckTeam truckteam)
        {

            int result = TruckTeamdal.AddTruckTeam(truckteam);
            return result;


        }
    }
}
