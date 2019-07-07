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
    public partial class TruckTeamManage1 : System.Web.UI.Page
    {
     
        Model.TruckTeam TruckTeamModel = new Model.TruckTeam();
        BLL.TruckTeam TruckTeamBLL = new BLL.TruckTeam();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                selectTruckTeam();
                selectdrop();
            }
        }
        /// <summary>
        /// 下拉列表获得数据
        /// </summary>
        public void selectdrop()
        {
            DataTable dt;
        
            dt = TruckTeamBLL.getTruckTeam();
            dropTeamName.DataSource = dt;
            dropTeamName.DataTextField = "TeamName";//给用户看的
            dropTeamName.DataValueField = "TeamID";//给开发员看的
            dropTeamName.DataBind();
            dropTeamName.Items.Insert(0, new ListItem("请选择", "-1"));
        }

        /// <summary>
        /// 获取车队信息
        /// </summary>
        public void selectTruckTeam()
        {
            DataTable dt = TruckTeamBLL.getTruckTeam();
            gvTruckMange.DataSource = dt;
            gvTruckMange.DataBind();
        }
        /// <summary>
        /// 根据文本框进行条件查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet dt;
            //获取文本框的信息
            string leader = tetLeader.Text;
            //获取下拉列表的ID  取得"TeamID"
            string ID = dropTeamName.SelectedValue;
            dt = TruckTeamBLL.TetLeader(ID, leader);
            gvTruckMange.DataSource = dt;
            gvTruckMange.DataBind();

        }
        /// <summary>
        /// 进入编辑状态
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Unnamed1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTruckMange.EditIndex = e.NewEditIndex;
            selectTruckTeam();
        }
        /// <summary>
        /// 根据下拉列表和文本框删除车队信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Unnamed1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //获取下拉列表的ID 
            string id = gvTruckMange.DataKeys[e.RowIndex].Value.ToString();
            //修改车队信息返回的结果
            int reslut = TruckTeamBLL.DeleterTruckTeam(id);
            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：删除车队";
            //获得行为类型
            SysLogModel.Fk_TypeID = 6;
            //获取用户ID
            SysLogModel.FK_UserID = Userid;
            //存储过程名
            SysLogModel.Parameters = Userid + ",";
            //存储过程名
            SysLogModel.ProcName = "没有存储过程";
            //获取客户端的Ip地址
            SysLogModel.IP = Request.UserHostAddress;
            SysLogModel.Exception = "0";

            if (reslut == 1)
            {
                //0：正常 1：异常
                SysLogModel.IsException = 0;
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除成功');</script>");
                selectTruckTeam();
            }
            else
            {
                //0：正常 1：异常
                SysLogModel.IsException = 1;
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除失败');</script>");

            }
            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);



        }
        /// <summary>
        /// 进行更新操作
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvTruckMange_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //获取车队ID
           string ModerId=   (gvTruckMange.Rows[e.RowIndex].Cells[0].Controls[0] as TextBox).Text;
            int id = TruckTeamModel.TeamID;
            id = int.Parse(ModerId);
            TruckTeamModel.TeamID = int.Parse(ModerId);
            //获取车队名称
            string name = (gvTruckMange.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            TruckTeamModel.TeamName=name ; 
            //获取车队负责人
            string leader= (gvTruckMange.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text  ;
            TruckTeamModel.Leader= leader  ;
            //备注
            string remark= (gvTruckMange.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text ;
            TruckTeamModel.Remark= remark ;
            //创队时间
            // DateTime checkInTime = ;
            TruckTeamModel.CheckInTime = (gvTruckMange.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;
            //修改时间
            //DateTime altertime=;
            TruckTeamModel.AlterTime = (gvTruckMange.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
          
            //返回编辑车队的结果数
            int result = TruckTeamBLL.UpdateTruckTeam(TruckTeamModel);


            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：修改车队";
            //获得行为类型
            SysLogModel.Fk_TypeID = 7;
            //获取用户ID
            SysLogModel.FK_UserID = Userid;

            //存储过程名
            SysLogModel.Parameters = Userid + ",";
            //存储过程名
            SysLogModel.ProcName = "没有存储过程";
            //获取客户端的Ip地址
            SysLogModel.IP = Request.UserHostAddress;
            SysLogModel.Exception = "";
            if (result > 0)
            {
                //0：正常 1：异常
                SysLogModel.IsException = 0;     
                //退出编辑
                this.gvTruckMange.EditIndex = -1;
                //更新数据
                selectTruckTeam();
                this.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('更新成功')", true);
            }
            else
            {
                //0：正常 1：异常
                SysLogModel.IsException = 1;
                this.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('更新失败')", true);
            }
            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);

        }
       /// <summary>
       /// 退出编辑
       /// </summary>
       /// <param name="sender"></param>
       /// <param name="e"></param>
        protected void gvTruckMange_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.gvTruckMange.EditIndex = -1;
            selectTruckTeam();
        }
    }
}