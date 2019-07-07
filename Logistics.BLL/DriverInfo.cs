using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.BLL
{
    public class DriverInfo
    {
        BLL.Driver DriverBLL = new BLL.Driver();
        Model.Driver driverModel = new Model.Driver();
        public Model.Driver getDriver(int DriverID  )
        {
            //调用dal层的方法 传进入id

            DataTable dt = DriverBLL.DrverListDriverID(DriverID).Tables[0];
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                driverModel.Name = dr["Name"].ToString();
                driverModel.FK_TeamID =int.Parse( dr["FK_TeamID"].ToString());
                driverModel.Sex =byte.Parse( dr["Sex"].ToString());
                driverModel.Birth =DateTime.Parse( dr["Birth"].ToString());
                driverModel.Phone = dr["Phone"].ToString();
                driverModel.IDCard = dr["IDCard"].ToString();
                driverModel.Remark = dr["Remark"].ToString();
                driverModel.State =byte.Parse( dr["State"].ToString());
            }
            return driverModel;

        }


    }
}
