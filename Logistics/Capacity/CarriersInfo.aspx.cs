using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Logistics.Capacity
{
    public partial class CarriersInfo : System.Web.UI.Page
    {
        public Model.Carriers CarriersModel = new Model.Carriers();
        BLL.Carriers CarriersBll = new BLL.Carriers();
        BLL.Goods GoodsBll = new BLL.Goods();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Carriersid"] != null)
            {
                int id =int.Parse( Request.QueryString["Carriersid"].ToString());
                if (!IsPostBack)
                {
                   // Response.Write();
                   bingCarriers(id);
                    bingGoods();
                }
            }

             
        }
        /// <summary>
        /// 绑定驾驶员
        /// </summary>
        /// <param name="id"></param>
        public void bingCarriers(int id)
        {
            CarriersModel = CarriersBll.bingCapacityInfo(id);
        }
        /// <summary>
        /// 绑定货物
        /// </summary>
        public void bingGoods()
        {
            DataTable dt = GoodsBll.bindGoods();
            gvGoods.DataSource = dt;
            gvGoods.DataBind();
        }
    }
}