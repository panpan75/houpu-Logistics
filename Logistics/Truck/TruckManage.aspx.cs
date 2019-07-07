using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.Truck
{
    public partial class TruckManage : System.Web.UI.Page
    {
        BLL.Truck tuckBll = new BLL.Truck();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();
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
            DataTable dt = new DataTable();
            dt = tuckBll.bindddlTruck();
            Pager(this.rptTruckList, this.AspNetPager1, dt);

            //rptTruckList.DataSource = dt;
            //rptTruckList.DataBind();

            return dt;
        }
        /// <summary>
        /// 获取下拉框中车辆信息中的车队编号
        /// </summary>
        /// <returns></returns>
        public DataSet bindddlTruckTeamID()
        {
            DataSet dst = new DataSet();
            dst = tuckBll.bindddlTruckTeamID();
            ddlTruckTeamID.DataTextField = "TeamID";
            ddlTruckTeamID.DataValueField = "TeamName";
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
            ddlTruckType.DataValueField = "TruckID";
            ddlTruckType.DataSource = dst;

            ddlTruckType.DataBind();
            ddlTruckType.Items.Insert(0, new ListItem("---全部---", "-1"));
            return dst;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           int TruckTeamID = int.Parse(ddlTruckTeamID.SelectedValue);
           string texnumber= txtNumber.Text;
           string trcktype= ddlTruckType.SelectedValue;
           DataSet dst=new DataSet();

            dst = tuckBll.rptTruckList(TruckTeamID, texnumber, trcktype);
            rptTruckList.DataSource = dst;
            rptTruckList.DataBind();
        }
      

        protected void rptTruckList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                int Truckid =int.Parse( e.CommandArgument.ToString());
                //删除车辆返回的结果
                int result = tuckBll.deleteTruck(Truckid);

                //获得用户id
                int Userid = Model.User.CurrentUser.UserID;
                //添加操作行为
                SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：删除车辆";
                //获得行为类型
                SysLogModel.Fk_TypeID = 9;
                //获取用户ID
                SysLogModel.FK_UserID = Userid;

                //存储过程名
                SysLogModel.Parameters = Userid + ",";
                //存储过程名
                SysLogModel.ProcName = "没有存储过程";
                //获取客户端的Ip地址
                SysLogModel.IP = Request.UserHostAddress;
                SysLogModel.Exception = "0";

                if (result > 0)
                {
                    //0：正常 1：异常
                    SysLogModel.IsException = 0;

                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除成功');</script>");
                    bindddlTruck();
                }
                else
                {
                    //0：正常 1：异常
                    SysLogModel.IsException = 0;

                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除失败');</script>");
                }
                //向数据库添加系统日志操作
                int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);

            }
        }

        /// <summary>
        /// 数据绑定内容
        /// </summary>
        //protected void BindData()
        //{
        //    DataTable dt = new DataTable();
        //    dt.Columns.Add("ID");
        //    dt.Columns.Add("Name");
        //    for (int i = 0; i < 10; i++)
        //    {
        //        dt.Rows.Add(i.ToString(), i.ToString());
        //    }
        //    DataSet ds = new DataSet();
        //    ds.Tables.Add(dt);
        //    Pager(this.rptTruckList, this.AspNetPager1, ds);

        //}

        /// <summary>
        ///  分页具体方法
        /// </summary>
        /// <param name="dl"></param>
        /// <param name="anp"></param>
        /// <param name="dst"></param>
        protected void Pager(Repeater rl, Wuqi.Webdiyer.AspNetPager anp, System.Data.DataTable dst)
        {
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dst.DefaultView;
            pds.AllowPaging = true;
            anp.RecordCount = dst.DefaultView.Count;
            pds.CurrentPageIndex = anp.CurrentPageIndex - 1;
            pds.PageSize = anp.PageSize;
            rl.DataSource = pds;
            rl.DataBind();
        }
        /// <summary>
        ///  当选择页数变化时重新绑定数据
        /// </summary>

        protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            AspNetPager1.CurrentPageIndex = e.NewPageIndex;
            bindddlTruck();
        }
    }
}