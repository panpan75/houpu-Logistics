using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Logistics.Cost
{
    public partial class AlterCost : System.Web.UI.Page
    {
        public Model.Scheduling SchedulingModel = new Model.Scheduling();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.Scheduling SchedulingBll = new BLL.Scheduling();
      
        BLL.SysLog SysLogBLL = new BLL.SysLog();
        int Schedulingid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["SchedulingID"] != null)
            {
                btnUpdeCost.Text = "修改成本";
                Schedulingid = int.Parse(Request.QueryString["SchedulingID"]);

            
                if (!IsPostBack) {
                    SchedulingModel = SchedulingBll.selectScheduling(Schedulingid);

                    this.txtOilCost.Text = SchedulingModel.OilCost.ToString();
                    this.txtToll.Text = SchedulingModel.Toll.ToString();
                    this.txtFine.Text = SchedulingModel.Fine.ToString();
                    this.txtOtherCost.Text = SchedulingModel.OtherCost.ToString();
                  

                }
              
            }
            else
            {
                btnUpdeCost.Text = "添加成本";
            }
        }
        /// <summary>
        /// 修改成本
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUpdeCost_Click(object sender, EventArgs e)
        {
            SchedulingModel.SchedulingID = Schedulingid;
            SchedulingModel.OilCost = float.Parse( this.txtOilCost.Text);
            SchedulingModel.Toll=float.Parse( txtToll.Text);
            SchedulingModel.Fine= float.Parse( txtFine.Text);
            SchedulingModel.OtherCost= float.Parse(this.txtOtherCost.Text);
            //获得结果
            int result = SchedulingBll.updateScheduling(SchedulingModel);

            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：修改成本";
            //获得行为类型
            SysLogModel.Fk_TypeID = 19;
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
                this.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('修改成功')", true);
               

            }
            else
            {
                //0：正常 1：异常
                SysLogModel.IsException = 1;
                this.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('修改失败')", true);
            }

            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);

        }
    }
}