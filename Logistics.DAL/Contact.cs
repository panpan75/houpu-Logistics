using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
    public class Contact
    {
        /// <summary>
        /// 通过司机ID查询驾驶员车辆绑定表
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public object ContactDriverID(int id)
        {
            string sql = "select * from  Contact where FK_DriverID=@id";
            SqlParameter[] para = {
               new  SqlParameter("@id",SqlDbType.Int)

            };
            para[0].Value = id;
            return DBHelper.ExecuteScalar(sql, para);
        }

        /// <summary>
        /// 通过车辆id查询驾驶员车辆绑定表
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public object ContactTruckID(int id)
        {
            string sql = "select * from  Contact where FK_TruckID=@id";
            SqlParameter[] para = {
               new  SqlParameter("@id",SqlDbType.Int)

            };
            para[0].Value = id;
            return DBHelper.ExecuteScalar(sql, para);
        }

    }
}
