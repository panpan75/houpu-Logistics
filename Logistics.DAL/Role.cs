using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
    public class Role
    {
        /// <summary>
        /// 获取角色信息
        /// </summary>
        /// <returns></returns>
        /// 
        //public DataSet GetRole()
        //{
        //    DataSet ds = new DataSet();
        //    string sql = "select  RoleName,RoleID from  [Role] ";
        //    return ds = DBHelper.getdataset(sql);
        //}

        public DataSet GetRole()
        {
            DataSet ds = new DataSet();
            string sql = "select  RoleName,RoleID from  [Role] ";
            return ds = DBHelper.getdataset(sql);
        }
    }
}
