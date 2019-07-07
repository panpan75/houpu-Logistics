using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Logistics.Driver
{
    public partial class DriverBindTruck : System.Web.UI.Page
    {
        BLL.Driver DriverBLL = new BLL.Driver();
        BLL.DriverInfo DriverInfoBll = new BLL.DriverInfo();
        public  Model.Driver DriverModel = new Model.Driver();
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                if (!IsPostBack)
                {
                    DriverID(id);
                }
            }
        

        }
        public void DriverID(int id)
        {
            // Model.Driver  DriverModel = DriverInfoBll.getDriver(id);

            DriverModel = DriverInfoBll.getDriver(id);


        }
    }
}