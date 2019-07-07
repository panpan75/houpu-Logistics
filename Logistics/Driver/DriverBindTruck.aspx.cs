using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Logistics.Driver
{
    public partial class DriverBindTruck1 : System.Web.UI.Page
    {
        BLL.Driver DriverBll = new BLL.Driver();
        BLL.Truck TruckBll = new BLL.Truck();
        Model.Driver DriverModel = new Model.Driver();
        BLL.DriverInfo DriverInfoBll = new BLL.DriverInfo();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();

        int Driverid;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {
                //获取司机id

                Driverid = int.Parse(Request.QueryString["id"].ToString());
                //通过实体层 得到车队信息 获取司机id
                DriverModel = DriverInfoBll.getDriver(Driverid);
                if (!IsPostBack)
                {

                    TruckList(Driverid);

                }
            }


            //通过司机id获取驾驶员表 显示到页面中是该司机的所有车辆
            //DataSet dsDriver;
            //dsDriver = DriverBll.DrverListDriverID(Driverid);
            //rpDrverList.DataSource = dsDriver;
            //rpDrverList.DataBind();

        }
        public void TruckList(int TeamID)
        {
            //获取车队id
            TeamID = DriverModel.FK_TeamID; //获取FK_TeamID
            DataSet dsContact;
            //查询没有被绑定的车辆，显示到页面上
            dsContact = TruckBll.getContactDriverID(TeamID);

            rptTruckList.DataSource = dsContact;
            rptTruckList.DataBind();

        }
        /// <summary>
        /// 判断车辆是否绑定 如果绑定就解绑 如果没绑定就绑定
        /// </summary>
        /// <param name="Driver"></param>
        public bool bindstats(object TruckID, object state)
        {
            //TruckID车辆信息
            bool reslut = false;
            BLL.Contact Contactbll = new BLL.Contact();
            //获取车辆id
            object Contactmgm = Contactbll.ContactTruckID(int.Parse(TruckID.ToString()));
            //判断是绑定的状态 第几个按钮   
            //if (type == "binding")//第1个按钮 绑定
            //{
            //查询是否是绑定状态
            //1、state.ToString() == "2" 未空闲 state.ToString() == "1" 承运中 
            //2、Contactmgm 查询有绑定的车辆
            //Contactmgm == null没绑定的车辆 Contactmgm != null有绑定的车辆

            // 如果空闲并且未绑定（去绑定） 
            if (state.ToString() == "2" && Contactmgm == null)
            {
                reslut = true;

            }
            //否则就不能去绑定
            else
            {
                reslut = false;
            }


            //}

            //else
            //{   //第2个按钮 解绑
            //    // 如果空闲并且未绑定（去绑定）
            //    if (state.ToString() == "2" && Contactmgm != null)
            //    {
            //        reslut = true;
            //    }
            //    else
            //    {
            //        reslut = false;
            //    }

            //}
            return reslut;

        }

        /// <summary>
        /// 绑定车辆
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        protected void lbbindTruck_Click(object sender, EventArgs e)
        {


            //DriverModel = DriverInfoBll.getDriver(Driverid);
            //从Model中 获取车队id
            // int TeamID = DriverModel.FK_TeamID; //获取FK_TeamID

            int TruckID = int.Parse(((LinkButton)sender).CommandArgument);
            int result;
            //返回绑定车辆的数据
            result = TruckBll.InsertContact(TruckID, Driverid);

            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：绑定车辆";
            //获得行为类型
            SysLogModel.Fk_TypeID = 21;
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
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('绑定成功');</script>");

                Response.Redirect("DriverManage.aspx");
            }
            else
            {
                //0：正常 1：异常
                SysLogModel.IsException = 1;

                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('绑定失败');</script>");
            }
            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);

        }
    }
}