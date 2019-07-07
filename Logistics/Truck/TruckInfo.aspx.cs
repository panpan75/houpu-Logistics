using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Logistics.Truck
{
    public partial class TruckInfo : System.Web.UI.Page
    {
        public Model.Truck TruckModel = new Model.Truck();
        BLL.Truck TruckBll = new BLL.Truck();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["truckid"] != null)
            {
                int id = int.Parse(Request.QueryString["truckid"].ToString());
                if (!IsPostBack)
                {

                    //  ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert(');</script>");
                    bingCarriers(id);
                }
            }
        }
        public void bingCarriers(int id)
        {
            TruckModel = TruckBll.TruckInfoTruckid(id);
        }
    }
}