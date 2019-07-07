using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Logistics.Carriers
{
    public partial class CarriersReceive : System.Web.UI.Page
    {
        BLL.Carriers CarriersBll = new BLL.Carriers();
        Model.Carriers CarriersModel = new Model.Carriers();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();

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
        /// 删除
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void rpCarriers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                int result = CarriersBll.delectCarriers(id);

                int Userid = Model.User.CurrentUser.UserID;
                //添加操作行为
                SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：删除承运单";
                //获得行为类型
                SysLogModel.Fk_TypeID = 15;
                //获取用户ID
                SysLogModel.FK_UserID = Userid;
                //SysLogModel.FK_UserID =int.Parse( Session["SessionID"].ToString());
                //存储过程名
                SysLogModel.Parameters = id + "," + e.CommandName;
                //存储过程名
                SysLogModel.ProcName = "没有存储过程";
                //获取客户端的Ip地址
                SysLogModel.IP = Request.UserHostAddress;


                if (result > 0)
                {
                    SysLogModel.Exception = "0";
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除成功');</script>");

                }
                else
                {
                    SysLogModel.Exception = "1";
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除失败');</script>");

                }
                //向数据库添加系统日志操作
                int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);

            }
        }
        /// <summary>
        /// 条件查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btinquiry_Click(object sender, EventArgs e)
        {

            CarriersModel.CarriersID = int.Parse( txtCarriersID.Text);
            string leaverDateBegin = txtLeaverDateBegin.Text;
            string leaverDateEnd = txtLeaverDateEnd.Text;
            CarriersModel.ReceiveLinkman= txtReceiveLinkman.Text;
            CarriersModel.SendLinkman= txtSendLinkman.Text;
            DataTable dt = CarriersBll.ConditionQueryCarriers(CarriersModel, leaverDateBegin, leaverDateEnd);
            rpCarriers.DataSource = dt;
            rpCarriers.DataBind();

        }
    }
}