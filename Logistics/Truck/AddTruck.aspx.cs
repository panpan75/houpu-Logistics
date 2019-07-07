using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.Truck
{
    public partial class AddTruck : System.Web.UI.Page
    {
        BLL.Truck truckBll = new BLL.Truck();
        Model.Truck truckModel = new Model.Truck();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
            
                bindddlTruckTeamID();
            }
        }
   

        /// <summary>
        /// 获取下拉框中车辆信息中的车队名称
        /// </summary>
        /// <returns></returns>
        public DataSet bindddlTruckTeamID()
        {
            DataSet dst = new DataSet();
            dst = truckBll.bindddlTruckTeamID();
            ddlTruckTeamID.DataTextField = "TeamName";
            ddlTruckTeamID.DataValueField = "TeamID";
            ddlTruckTeamID.DataSource = dst;
            ddlTruckTeamID.DataBind();
            return dst;
        }
        /// <summary>
        /// 添加车辆
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
           string number= txtnumber.Text;
           string CheackInTime= texCheackInTime.Text;
           string length=  texlength.Text;
           int onnang=int.Parse(  textonnage.Text);
           string ramrk=  txtramrk.Text;
           string type=  ddlTruckType.SelectedItem.Text;
           int TeamID= int.Parse( ddlTruckTeamID.SelectedValue);
     
            truckModel.Number = number;
            truckModel.Type = type;
            truckModel.CheackInTime = CheackInTime;
            truckModel.Length = length;
            truckModel.Tonnage = onnang;
            truckModel.Remark = ramrk;
         
            truckModel.FK_TeamID = TeamID;

            //获取添加车辆返回的数据
            int result = truckBll.AddTruck(truckModel);

            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：添加车辆";
            //获得行为类型
            SysLogModel.Fk_TypeID = 8;
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
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功');</script>");
            }
            else {
                //0：正常 1：异常
                SysLogModel.IsException = 1;
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加失败');</script>");
            }


            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);



        }
    }
}