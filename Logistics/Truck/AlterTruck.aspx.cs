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
    public partial class AlterTruck : System.Web.UI.Page
    {
        //1.获取URL传入 的id
        //2.根据id获取车辆信息
        //3.textbox 填值
        //4.用户更新数据
        BLL.Truck truckBll = new BLL.Truck();
        Model.Truck truckModer = new Model.Truck();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();

        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
             id = int.Parse(Request.QueryString["truckid"]);
            if (!IsPostBack)
            {
                bingTruck();
            }
          
        
        }
        /// <summary>
        /// 绑定车辆信息
        /// </summary>
        public void bingTruck()
        {
            DataTable dt = truckBll.getTrucklistTruckid(id);

            //得到的表通过Data传到文本框中
            if (dt.Rows.Count > 0)
            {
                txtnumber.Text = dt.Rows[0]["Number"].ToString();
                txttype.Text = dt.Rows[0]["Type"].ToString();
                texlength.Text = dt.Rows[0]["Length"].ToString();
                txtTeamID.Text = dt.Rows[0]["FK_TeamID"].ToString();
                texCheackInTime.Text = dt.Rows[0]["CheackInTime"].ToString();
                txtramrk.Text = dt.Rows[0]["Remark"].ToString();
                textonnage.Text = dt.Rows[0]["Tonnage"].ToString();
                rblStae.SelectedValue=dt.Rows[0]["State"].ToString();
            }

        }

        protected void updeTruck_Click(object sender, EventArgs e)
        {
            truckModer.TruckID = id;
            truckModer.Number = txtnumber.Text;
            truckModer.Type = txttype.Text;
            truckModer.Length = texlength.Text;
            truckModer.FK_TeamID =int.Parse( txtTeamID.Text);
            truckModer.CheackInTime = texCheackInTime.Text;
            truckModer.Remark = txtramrk.Text;
            truckModer.Tonnage =int.Parse( textonnage.Text);
            truckModer.State =Byte.Parse( rblStae.SelectedValue);
            //修改车辆返回结果数量
            int result = truckBll.updeTruck(truckModer);
            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：修改车辆";
            //获得行为类型
            SysLogModel.Fk_TypeID = 10;
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
                //向数据库添加系统日志操作
                int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功');</script>");
                Response.Redirect("TruckManage.aspx");
            }
            else
            {
                //0：正常 1：异常
                SysLogModel.IsException = 1;
                //向数据库添加系统日志操作
                int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);


                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加失败');</script>");
            }

                
        }
    }
}