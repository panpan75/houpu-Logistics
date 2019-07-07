using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
    public class Cost
    {
        /// <summary>
        /// 查询成本维护信息
        /// </summary>
        /// <returns></returns>
        public DataTable CostMaintenance()
        {
            string Proc = "P_CostMaintenance_create";
            DataTable dt = DBHelper.getTableProc(Proc);
            return dt;
        }
        /// <summary>
        /// 条件查询
        /// </summary>
        /// <param name="rbFinishedState"></param>
        /// <param name="ReceiveDateBegin"></param>
        /// <param name="ReceiveDateEnd"></param>
        /// <returns></returns>
        public DataTable selectCost( int rbFinishedState,string ReceiveDateBegin,string ReceiveDateEnd)
        {
            string Proc = "P_CostMaintenance_select";
            SqlParameter[] sp = {
                new SqlParameter("@rbFinishedState", SqlDbType.Int),
                new SqlParameter("@ReceiveDateBegin",SqlDbType.VarChar),
                new SqlParameter("@ReceiveDateEnd",SqlDbType.VarChar)

            };
       
            sp[0].Value = rbFinishedState;
            //判断传入的值是不是空字符串，如何是就赋值为空
            if (!string.IsNullOrEmpty(ReceiveDateBegin))
            {
                sp[1].Value = ReceiveDateBegin;
            }
            else {
                //传入空字符串 赋值为空
                sp[1].Value = DBNull.Value;
            }
            //传入的是一个空字符串 
            sp[2].Value = ReceiveDateEnd;

            DataTable dt = DBHelper.getTableProc(Proc,sp);
            return dt;
        }
        
    }
}
