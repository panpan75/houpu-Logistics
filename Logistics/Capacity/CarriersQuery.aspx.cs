using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.Capacity
{
    public partial class CarriersQuery : System.Web.UI.Page
    {
        BLL.Carriers CarriersBll = new BLL.Carriers();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                bindCarriers();
            }
        }

        public void bindCarriers()
        {
            DataTable ds;
            ds = CarriersBll.bindCarriers();
            rpCarriers.DataSource = ds;
            rpCarriers.DataBind();
        }
        /// <summary>
        /// 进行条件查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btinquiry_Click(object sender, EventArgs e)
        {
            //承运编号
            string CarriersID = txtCarriersID.Text;
            //收货人
            string ReceiveLinkman = txtReceiveLinkman.Text;
            //发货人：
            string Account = txtAccount.Text;
            //承运日期：
            string leaverBegin =  txtLeaverDateBegin.Text;
            string LeaverDateEnd=txtLeaverDateEnd.Text;
            //收货日期
            string ReceiveDateBegin = txtReceiveDateBegin.Text;
            string ReceiveDateEnd = txtLeaverDateEnd.Text;
            //业务员
            string FK_UserID = txtFK_UserID.Text;
            



        }
    }
}