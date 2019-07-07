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
    public partial class DriverManage : System.Web.UI.Page
    {
        BLL.Driver DriverBll = new BLL.Driver();
        BLL.TruckTeam TruckTeamBll = new BLL.TruckTeam();
        Model.Driver DriverModel = new Model.Driver();
        BLL.Contact Contactbll = new BLL.Contact();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindDrverList();
                DriverTeamID();
                DriverState();
            }
        }
        /// <summary>
        /// 获取驾驶员信息表
        /// </summary>
        public void bindDrverList()
        {
            DataSet dst;
            dst = DriverBll.bindDrverList();
            rpDrverList.DataSource = dst;
            rpDrverList.DataBind();
        }
        /// <summary>
        ///绑定车队
        /// </summary>
        public void DriverTeamID()
        {
            DataSet dst;
            dst = DriverBll.ddlDrver();
            ddlDriverTeamID.DataSource = dst;
            ddlDriverTeamID.DataTextField = "FK_TeamID";
            ddlDriverTeamID.DataValueField = "DriverID";
            ddlDriverTeamID.DataBind();
            ddlDriverTeamID.Items.Insert(0, new ListItem("全部", "-1"));
        }
        /// <summary>
        /// 绑定下拉列表驾驶员状态
        /// </summary>
        public void DriverState()
        {

            DataSet dst;
            dst = DriverBll.ddlDrver();
            ddlDriverState.DataSource = dst;
            ddlDriverState.DataTextField = "State";
            ddlDriverState.DataValueField = "DriverID";
            ddlDriverState.DataBind();
            ddlDriverState.Items.Insert(0, new ListItem("全部", "-1"));

        }
        /// <summary>
        /// 条件查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet dst;
            string name=txtname.Text;
            string phone = txtphone.Text;
            int teamid =int.Parse( ddlDriverTeamID.SelectedValue);
            if(ddlDriverState.SelectedValue == "1")
            {
                DriverModel.State = 1;
            }
            else if (ddlDriverState.SelectedValue == "2")
            {
                DriverModel.State = 2;
            }
            else {

                DriverModel.State = 0;
            }
              DriverModel.Name = name;
              DriverModel.Phone = phone;
              DriverModel.FK_TeamID = teamid;
       
          dst = DriverBll.CriteriaDrver(DriverModel);
        }
        /// <summary>
        /// 删除驾驶员信息
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void rpDrverList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                DriverModel.DriverID = id;
                //返回删除驾驶员的结果数
                int result = DriverBll.DeleteDrver(DriverModel);

                //获得用户id
                int Userid = Model.User.CurrentUser.UserID;
                //添加操作行为
                SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：删除驾驶员";
                //获得行为类型
                SysLogModel.Fk_TypeID = 12;
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
                    
                }
                else
                {
                    //0：正常 1：异常
                    SysLogModel.IsException = 1;
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除失败');</script>");
                }

                //向数据库添加系统日志操作
                int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);
                //更新查询表
                bindDrverList();

            }
        }
        /// <summary>
        /// 判断车辆是否绑定 如果绑定就解绑 如果没绑定就绑定
        /// </summary>
        /// <param name="Driver"></param>
        public bool bindstats(object Driverid,object state,string type)
        {
        
            bool reslut = false;
            //判断车辆是否是绑定的状态
           
            object Contactmgm = Contactbll.ContactDriverID(int.Parse(Driverid.ToString()));
            //判断是绑定的状态 第几个按钮   
            if (type == "binding")//第1个按钮 绑定
            {
                //查询是否是绑定状态
                //1、state.ToString() == "2" 未空闲 state.ToString() == "1" 承运中 
                //2、Contactmgm 查询有绑定的车辆   Contactmgm == null没绑定的车辆 Contactmgm != null有绑定的车辆
                // 如果空闲并且未绑定（去绑定） 
                if (state.ToString() == "2" && Contactmgm == null)
                {
                    reslut = true;
                }

                //if ( Contactmgm == null)
                //{
                //    reslut = true;
                //}
                //否则就不能去绑定

                else {
                    reslut = false;
                }


            }

            else
            {   //第2个按钮 解绑
                // 如果空闲并且未绑定（去绑定）
                if (state.ToString() == "2" && Contactmgm != null)
                {
                    reslut = true;
                }
              
                else
                {
                    reslut = false;
                }
                
            }
            return reslut;

        }
        /// <summary>
        /// 绑定车辆 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbbindTruck_Click(object sender, EventArgs e)
        {
            //获取id传入去绑定的页面
            string DriverId = ((LinkButton)sender).CommandArgument;
            Response.Redirect("DriverBindTruck.aspx?id=" + DriverId);
        }
        /// <summary>
        /// 解除车辆的绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbbundTruck_Click(object sender, EventArgs e)
        {
            string DriverId = ((LinkButton)sender).CommandArgument;
            //删除Contact表根据司机id
            int result = DriverBll.DeleteContact(int.Parse(DriverId));


            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：添加承运单";
            //获得行为类型
            SysLogModel.Fk_TypeID = 22;
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
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('解绑成功');</script>");
                bindDrverList();

            }
            else {
                //0：正常 1：异常
                SysLogModel.IsException = 1;
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('解绑失败');</script>");
            }

            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);

        }
    }
}