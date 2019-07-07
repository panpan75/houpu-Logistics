using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.Carriers
{
    public partial class CarriersManage : System.Web.UI.Page
    {
        BLL.Carriers CarriersBll = new BLL.Carriers();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindCarriers();
            }
        }
        /// <summary>
        /// 绑定车辆信息
        /// </summary>
        public void bindCarriers()
        {
            int RecordCount;
            DataTable ds;
            ds = CarriersBll.getPageCarriers(AspNetPager1.CurrentPageIndex,AspNetPager1.PageSize,out RecordCount);
            AspNetPager1.RecordCount = RecordCount;
            rpCarriers.DataSource = ds;
            rpCarriers.DataBind();
      
        }
        /// <summary>
        /// 进行条件查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btinquiry_Click(object sender, EventArgs e)
        {
            //承运编号
            string CarriersID = txtCarriersID.Text;
            //收货人
            string ReceiveLinkman = txtReceiveLinkman.Text;
            //发货人：
            string Account = txtAccount.Text;
            //承运日期：
            string leaverBegin = txtLeaverDateBegin.Text;
            string LeaverDateEnd = txtLeaverDateEnd.Text;    

        }

        protected void rpCarriers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                int result = CarriersBll.delectCarriers(id);

                int  Userid = Model.User.CurrentUser.UserID;
                //添加操作行为
                SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：删除承运单";
                //获得行为类型
                SysLogModel.Fk_TypeID = 15;
                //获取用户ID
                SysLogModel.FK_UserID = Userid;
                //SysLogModel.FK_UserID =int.Parse( Session["SessionID"].ToString());
                //存储过程名
                SysLogModel.Parameters = id + ","+ e.CommandName;
                //存储过程名
                SysLogModel.ProcName = "P_Carriers_deleteCarriers_CarriersID";
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
                bindCarriers();
            }
        }
        ///// <summary>
        ///// 分页具体方法
        ///// </summary>
        ///// <param name="dl"></param>
        ///// <param name="anp"></param>
        ///// <param name="dst"></param>
        //protected void Pager(Repeater dl, Wuqi.Webdiyer.AspNetPager anp, System.Data.DataSet dst)
        //{
        //    PagedDataSource pds = new PagedDataSource();
        //    pds.DataSource = dst.Tables[0].DefaultView;
        //    pds.AllowPaging = true;
        //    anp.RecordCount = dst.Tables[0].DefaultView.Count;
        //    pds.CurrentPageIndex = anp.CurrentPageIndex - 1;
        //    pds.PageSize = anp.PageSize;
        //    dl.DataSource = pds;
        //    dl.DataBind();
        //}

        /// <summary>
        /// 当选择页数变化时重新绑定数据
        /// </summary>
        protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            AspNetPager1.CurrentPageIndex = e.NewPageIndex;
            bindCarriers();
        }
    }
}