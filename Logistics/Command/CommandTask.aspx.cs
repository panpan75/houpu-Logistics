using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Logistics.Command
{
    public partial class CommandTask : System.Web.UI.Page
    {
        BLL.Carriers CarriersBll = new BLL.Carriers();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bingCarriers();
            }
        }

        public DataTable bingCarriers()
        {
            DataTable dt = new DataTable();
            dt = CarriersBll.bindCarriers();
            rpDispatching.DataSource = dt;
            rpDispatching.DataBind();
            return dt;

        }
    }
}