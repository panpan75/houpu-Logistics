using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
    public class SearchLog
    {
        /// <summary>
        /// 查询日志用户
        /// </summary>
        /// <returns></returns>
        public DataTable bingSearchLog()
        {
            string Proc = "P_SysLog_selectALLSysLog";
            DataTable dt;
            dt = DBHelper.getTableProc(Proc);
            return dt;
        }
        public DataTable getLog(int pageIndex, int pageSize, string tableName, string keyID, string strWhere, out int RecordCount)
        {
            //  string sql = "select* from Truck";
            string proName = "p_getpage_table";
            SqlParameter[] para = {

                                 new SqlParameter("@pageIndex",SqlDbType.Int

),
                                  new SqlParameter("@pageSize",SqlDbType.Int

),
                                   new SqlParameter("@tableName",SqlDbType.VarChar),
                                   new SqlParameter("@keyID",SqlDbType.VarChar),
                                    new SqlParameter("@strWhere",SqlDbType.NVarChar),
                                   new SqlParameter("@RecordCount",SqlDbType.Int

),

                                 };

            para[0].Value = pageIndex;
            para[1].Value = pageSize;
            para[2].Value = tableName;
            para[3].Value = keyID;
            para[4].Value = strWhere;
            para[5].Direction = ParameterDirection.Output;

            DataTable ds = DAL.DBHelper.getTableProc(proName, para);
            RecordCount = (int)para[5].Value;
            return ds;
        }


    }
}
