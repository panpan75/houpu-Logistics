using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Logistics.Command
{
    public partial class FreeTruck : System.Web.UI.Page
    {
        BLL.Carriers CarriersBll = new BLL.Carriers();
        Model.Carriers CarriersModel = new Model.Carriers();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                P_FreeTruck_selectALl();
            }
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <returns></returns>
        public DataTable P_FreeTruck_selectALl()
        {
            DataTable dt;
            dt = CarriersBll.FreeTruck_selectAll();
                  
            rpschedulable.DataSource = dt;
            rpschedulable.DataBind();
          
            return dt;
            
        }
        /// <summary>
        /// 调度
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           
            DataTable dt=new DataTable();
            dt = CarriersBll.FreeTruck_selectAll();
            DataRow rows = dt.Rows[0];
         
            //获得用户id    
            string id = Session["SessionID"].ToString();
            int  UserID = int.Parse(id);                
            //获取承运单id
            int CarriersID =int.Parse( Request.QueryString["CarriersID"].ToString());
            //获得车辆id
            int TruckID =int.Parse( rows["TruckID"].ToString());
            //获取结果
            int result = CarriersBll.CommandTaskInsertScheduling(UserID, CarriersID, TruckID);

            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：添加调度任务";
            //获得行为类型
            SysLogModel.Fk_TypeID = 20;
            //获取用户ID
            SysLogModel.FK_UserID = Userid;
            //SysLogModel.FK_UserID =int.Parse( Session["SessionID"].ToString());
            //存储过程名
            SysLogModel.Parameters = Userid + ",";
            //存储过程名
            SysLogModel.ProcName = "P_CommandTask_InsertScheduling";
            //获取客户端的Ip地址
            SysLogModel.IP = Request.UserHostAddress;
            SysLogModel.Exception = "0";

            if (result > 0)
            {    //0：正常 1：异常
                SysLogModel.IsException = 0;
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('调度成功');</script>");
                P_FreeTruck_selectALl();
            }
            else
            {
                //0：正常 1：异常
                SysLogModel.IsException =1;
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('调度失败');</script>");
            }

            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);


        }
    }
}