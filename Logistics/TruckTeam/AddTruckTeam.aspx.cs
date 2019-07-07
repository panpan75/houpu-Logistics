using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Logistics.TruckTeam
{
    public partial class AddTruckTeam : System.Web.UI.Page
    {
        Model.TruckTeam truckTeamModer = new Model.TruckTeam();
        BLL.TruckTeam truckTeamBll = new BLL.TruckTeam();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();

        protected void Page_Load(object sender, EventArgs e)
        {
                 
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
          string teamname=  txtTeamName.Text;
          string teamleadr= txtTeamLeader.Text;
          string remark=txtRemark.Text;
          truckTeamModer.TeamName = teamname;
          truckTeamModer.Leader = teamleadr;
          truckTeamModer.Remark = remark;
          int result = truckTeamBll.AddTruckTeam(truckTeamModer);

            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：添加车队";
            //获得行为类型
            SysLogModel.Fk_TypeID = 5;
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
                this.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('添加成功')", true);

            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('添加失败')", true);
            }
        }
    }
}