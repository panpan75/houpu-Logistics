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
    public partial class TruckQuery : System.Web.UI.Page
    {


        BLL.Truck tuckBll = new BLL.Truck();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindddlTruck();
                bindddlTruckTeamID();
                bindddlTruckType();

            }
        }
        /// <summary>
        /// 获取车队信息
        /// </summary>
        /// <returns></returns>
        public DataTable bindddlTruck()
        {
            DataTable dst = new DataTable();
            dst = tuckBll.bindddlTruck();

            rptTruckList.DataSource = dst;

            rptTruckList.DataBind();

            return dst;
        }
        /// <summary>
        /// 获取下拉框中车辆信息中的车队编号
        /// </summary>
        /// <returns></returns>
        public DataSet bindddlTruckTeamID()
        {
            DataSet dst = new DataSet();
            dst = tuckBll.bindddlTruckTeamID();
            ddlTruckTeamID.DataTextField = "TeamName";
            ddlTruckTeamID.DataValueField = "TeamID";
            ddlTruckTeamID.DataSource = dst;

            ddlTruckTeamID.DataBind();
            ddlTruckTeamID.Items.Insert(0, new ListItem("不限", "-1"));
            return dst;
        }
        /// <summary>
        /// 获取下拉框中车辆信息中的车队类型
        /// </summary>
        /// <returns></returns>
        public DataSet bindddlTruckType()
        {
            DataSet dst = new DataSet();
            dst = tuckBll.bindddlTruckType();
            ddlTruckType.DataTextField = "Type";

            ddlTruckType.DataSource = dst;

            ddlTruckType.DataBind();
            ddlTruckType.Items.Insert(0, new ListItem("---全部---", "-1"));
            return dst;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int TruckTeamID = int.Parse(ddlTruckTeamID.SelectedValue);
            string texnumber = txtNumber.Text;
            string trcktype = ddlTruckType.SelectedValue;
            DataSet dst = new DataSet();

            dst = tuckBll.rptTruckList(TruckTeamID, texnumber, trcktype);
            rptTruckList.DataSource = dst;
            rptTruckList.DataBind();
        }


      
    }
}