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
    public partial class TruckTeamQuery : System.Web.UI.Page
    {
        BLL.TruckTeam TruckTeamBll = new BLL.TruckTeam();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                bingTruckTeam();
                TeamName();
            }
        }
        /// <summary>
        /// 查询车队信息
        /// </summary>
        public void bingTruckTeam()
        {
            DataTable dt;
            dt = TruckTeamBll.getTruckTeam();
            dlTruckTeam.DataSource = dt;
            dlTruckTeam.DataBind();

        }
        /// <summary>
        /// 
        /// </summary>
        public void TeamName()
        {
            DataTable dt;
            dt = TruckTeamBll.getTruckTeam_TeamName();
            ddlTeamName.DataSource = dt;
            ddlTeamName.DataTextField = "TeamName";
            ddlTeamName.DataValueField = "TeamID";
            ddlTeamName.DataBind();
            ddlTeamName.Items.Insert(0, new ListItem("不限", "-1"));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //车队id
            string id = ddlTeamName.SelectedValue;
            //负责人
            string leader = txtLeader.Text;
            DataSet ds;
            ds = TruckTeamBll.TetLeader( id,leader);
            dlTruckTeam.DataSource = ds;
            dlTruckTeam.DataBind();

        }
    }
}