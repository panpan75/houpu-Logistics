using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.BLL
{
    public class Role
    {
        DAL.Role role =new  DAL.Role();
        public DataSet GetRole()
        {
            DataSet ds = new DataSet();
            return ds = role.GetRole();
        }
    }
}
