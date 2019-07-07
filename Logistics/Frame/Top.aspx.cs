using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
namespace Logistics.Frame
{
    public partial class Top : System.Web.UI.Page
    {
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();
        protected void Page_Load(object sender, EventArgs e)
        {

            


            lblRoleName.Text = Model.User.CurrentUser.RoleName;
            lblUserName.Text = Model.User.CurrentUser.UserName;


            //时间判断
            int Hourint = int.Parse(DateTime.Now.Hour.ToString());

            if (Hourint > 0 && Hourint < 12)
            {

                showDate.Text = "上午";
            }
            else if (Hourint == 12 && Hourint == 13)
            {
                showDate.Text = "中午";
            }

            else
            {
                showDate.Text = "下午";
            }



        }

        protected void ibtnWriteOff_Click(object sender, ImageClickEventArgs e)
        {
            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：退出登录";
            //获得行为类型
            SysLogModel.Fk_TypeID = 23;
            //获取用户ID
            SysLogModel.FK_UserID = Userid;

            //存储过程名
            SysLogModel.Parameters = Userid + ",";
            //存储过程名
            SysLogModel.ProcName = "没有存储过程";
            //获取客户端的Ip地址
            SysLogModel.IP = Request.UserHostAddress;
            SysLogModel.Exception = "0";
            //0：正常 1：异常
            SysLogModel.IsException = 0;
            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);
            //退出登录
            //Response.Redirect("login.aspx");
            Response.Write("<script> window.parent.location='/login.aspx'</script>");
        }
    }
}