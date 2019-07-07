using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Logistics.Cost
{
    public partial class CostMaintenance : System.Web.UI.Page
    {
        BLL.Cost CostBll = new BLL.Cost();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bingCostMaintenance();
            }

        }
        //获取成本维护信息
        public DataTable bingCostMaintenance()
        {
            DataTable dt;
            dt = CostBll.CostMaintenance();
            
            rpCostMaintenance.DataSource = dt;
            rpCostMaintenance.DataBind();
            return dt;
        }
        /// <summary>
        /// 条件查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSelCost_Click(object sender, EventArgs e)
        {
            //结算状态
            int rbFinishedState = int.Parse(rbCostMaintenance.SelectedValue);
            string ReceiveDateBegin = txtReceiveDateBegin.Text;
            string ReceiveDateEnd = txtReceiveDateEnd.Text;
            DataTable dt = CostBll.selectCost(rbFinishedState, ReceiveDateBegin, ReceiveDateEnd);
            rpCostMaintenance.DataSource = dt;
            rpCostMaintenance.DataBind();

        }
        /// <summary>
        /// 判断按钮显示不显示
        /// </summary>
        /// <param name="id"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public bool bingFinishedState(object id,string type)
        {
            bool result = false;
            if (type == "paying")
            {            
                if (id.ToString() == "2")
                {
                    result = true;
                 }
                else
                {
                    result = false;
                }
               
            }
             else if(type == "modification")
            {
                if (id.ToString() != "2")
                {
                    result = true;
                }
                else
                {
                    result = false;
                }
            }   
            return result;
          

        }
        /// <summary>
        /// 成本核素
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //获取LinkButton的值
            int SchedulingID = int.Parse(((LinkButton)sender).CommandArgument);
            Response.Redirect("AlterCost.aspx?SchedulingID="+ SchedulingID) ;
          
        }
     
    }
}   