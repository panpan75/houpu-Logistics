using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
    public class Scheduling
    {
        /// <summary>
        /// 通过id对调度任务信息表进行查询
        /// </summary>
        /// <param name="Schedulingid"></param>
        /// <returns></returns>
        public DataTable selectScheduling(int Schedulingid)
        {
            string ProName = "P_Scheduling_selectScheduling_SchedulingID";
            SqlParameter[] Para = {
                new SqlParameter("SchedulingID",SqlDbType.Int)
            };
            Para[0].Value = Schedulingid;
            return DBHelper.getTableProc(ProName,Para);
        }
        /// <summary>
        /// 通过id调用存储过程对调度表进行更新
        /// </summary>
        /// <param name="Schedulingid"></param>
        /// <returns></returns>
        public int updateScheduling(Model.Scheduling SchedulingModel)
        {
            
            string ProName = "P_Scheduling_updateScheduling_SchedulingID";
            SqlParameter[] Para = {
                new SqlParameter("@Schedulingid",SqlDbType.Int),
                new SqlParameter("@OilCost",SqlDbType.Float),
                new SqlParameter("@Toll",SqlDbType.Float),
                new SqlParameter("@Fine",SqlDbType.Float),
                new SqlParameter("@OtherCost",SqlDbType.Float)
            };

            Para[0].Value = SchedulingModel.SchedulingID;
            Para[1].Value = SchedulingModel.OilCost;
            Para[2].Value = SchedulingModel.Toll;
            Para[3].Value = SchedulingModel.Fine;
            Para[4].Value = SchedulingModel.OtherCost;
            return DBHelper.getCommExecuteNonQuery(ProName,Para);

        }
    }
}
