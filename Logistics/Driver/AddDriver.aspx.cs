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
    public partial class AddDriver : System.Web.UI.Page
    {
        BLL.Driver DriverBll = new BLL.Driver();
        Model.Driver DriverModer = new Model.Driver();
        BLL.TruckTeam TruckTeamBll = new BLL.TruckTeam();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {

                TruckTeamID();
            }
        }
        /// <summary>
        /// 绑定驾驶员中车队信息
        /// </summary>
        public void TruckTeamID()
        {
            DataTable dst;
            dst = TruckTeamBll.getTruckTeam();
            ddlTruckTeamID.DataSource = dst;
            ddlTruckTeamID.DataTextField = "TeamName";
            ddlTruckTeamID.DataValueField = "TeamID";
            ddlTruckTeamID.DataBind();
            ddlTruckTeamID.Items.Insert(0, new ListItem("请选择", "-1"));


        }
        /// <summary>
        /// 添加驾驶员信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            
          string carid= txtCarID.Text;
          string name= txtname.Text;
          string phone= txtphone.Text;
          string ramrk= txtramrk.Text;
          DateTime birth=Convert.ToDateTime( txtBirth.Text);
            if (rblDriverSex.SelectedValue == "0")
            {
                DriverModer.Sex = 0;
            }
            else {
                DriverModer.Sex = 1;
            }
            if (rblstate.SelectedValue == "0")
            {
                DriverModer.State = 0;
            }
            else
            {
                DriverModer.State = 1;
            }
            int teamid= int.Parse( ddlTruckTeamID.SelectedValue);
            DriverModer.IDCard = carid;
            DriverModer.Name = name;
            DriverModer.Phone = phone;
            DriverModer.Remark = ramrk;
            DriverModer.Birth = birth;
            DriverModer.FK_TeamID = teamid;
            //获得结果
            int result=  DriverBll.InsertDrver(DriverModer);
            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：添加驾驶员";
            //获得行为类型
            SysLogModel.Fk_TypeID = 14;
            //获取用户ID
            SysLogModel.FK_UserID = Userid;
            //SysLogModel.FK_UserID =int.Parse( Session["SessionID"].ToString());
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
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功');</script>");
            }
            else
            {
                //0：正常 1：异常
                SysLogModel.IsException = 0;
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加失败');</script>");
            }

            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.location='CostMaintenance.aspx'</script>");
        }
    }
}