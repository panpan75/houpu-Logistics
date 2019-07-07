using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
   public  class SysLog
    {
        /// <summary>
        /// 添加系统日志表表
        /// </summary>
        /// <param name="SysLogModel"></param>
        /// <returns></returns>
        public int AddAllSysLog(Model.SysLog SysLogModel)
        {
            string Proc = "P_SysLog_AddSysLog";
            SqlParameter[] Para = {
             
                new SqlParameter("@Behavior",SqlDbType.VarChar),
                new SqlParameter("@Fk_TypeID",SqlDbType.VarChar),
                new SqlParameter("@FK_UserID",SqlDbType.Int),
                new SqlParameter("@Parameters",SqlDbType.VarChar),
                new SqlParameter("@ProcName",SqlDbType.VarChar),
                new SqlParameter("@IP",SqlDbType.VarChar),
                new SqlParameter("@Exception",SqlDbType.VarChar),
                new SqlParameter("@IsException",SqlDbType.Int)
            };

         
            Para[0].Value = SysLogModel.Behavior;
            Para[1].Value = SysLogModel.Fk_TypeID;
            Para[2].Value = SysLogModel.FK_UserID;
            Para[3].Value = SysLogModel.Parameters;
            Para[4].Value = SysLogModel.ProcName;
            Para[5].Value = SysLogModel.IP;
            Para[6].Value = SysLogModel.Exception;
            Para[7].Value = SysLogModel.IsException;

            return DBHelper.getCommExecuteNonQuery(Proc, Para);
        }
        /// <summary>
        /// 查询行为类型
        /// </summary>
        public DataTable bingType()
        {
            string sql = "select * from Type";
            return DBHelper.getdataset(sql).Tables[0];
        }
    }
}
