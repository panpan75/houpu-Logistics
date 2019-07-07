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
    public partial class AlterDriver : System.Web.UI.Page
    {
        Model.Driver DriverModel = new Model.Driver();
        BLL.Driver DriverBll = new BLL.Driver();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();

        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            //判断传入的id是否存在
            if (Request.QueryString["id"]!= null)
            {
                id = int.Parse(Request.QueryString["id"].ToString());
                if (!IsPostBack)
                {
                    Driver();
                }
                //有id传入 按钮是修改
               this.UpdateDriver.Visible = true;
            }           
            else {
                //没id传入 按钮是新增
                this.AddDriver.Visible = true;
            }            
        }



        /// <summary>
        ///获取车队信息
        /// </summary>
        public void Driver()
        {
            DataTable dt;
            dt = DriverBll.DrverListDriverID(id).Tables[0];
            if (dt.Rows.Count> 0) {    
                txtname.Text = dt.Rows[0]["Name"].ToString();
                ddlDriverTeamID.SelectedItem.Text = dt.Rows[0]["FK_TeamID"].ToString();
                rblDriverSex.SelectedValue = dt.Rows[0]["Sex"].ToString();
                txtphone.Text = dt.Rows[0]["Phone"].ToString();
                txtCarID.Text = dt.Rows[0]["IDCard"].ToString();
                txtBirth.Text = dt.Rows[0]["Birth"].ToString();
                txtramrk.Text = dt.Rows[0]["Remark"].ToString();
                rblstate.SelectedValue= dt.Rows[0]["State"].ToString();               
            }     
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            DriverModel.IDCard = txtCarID.Text;
            DriverModel.Name = txtname.Text;
            DriverModel.Phone = txtphone.Text;
            DriverModel.Remark = txtramrk.Text;
            DriverModel.Birth = Convert.ToDateTime(txtBirth.Text);
            DriverModel.FK_TeamID =int.Parse( ddlDriverTeamID.SelectedValue);
            DriverModel.DriverID = id;
            DriverModel.State =byte.Parse( rblstate.SelectedValue);
            //修改
            int result = DriverBll.UpdateDrver(DriverModel);

 
            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：修改驾驶员";
            //获得行为类型
            SysLogModel.Fk_TypeID = 14;
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
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功');</script>");
            }
            else
            {
                //0：正常 1：异常
                SysLogModel.IsException = 0;
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改失败');</script>");
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