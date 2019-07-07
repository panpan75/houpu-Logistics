using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.SystemManage
{
    public partial class StaffManage : System.Web.UI.Page
    {
        BLL.User userBLL = new BLL.User();
        BLL.Role roleBll = new BLL.Role();
        BLL.StaffManage sffmangBll = new BLL.StaffManage();
        Model.StaffManage sffmangModel = new Model.StaffManage();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();
        Model.User UserModel = new Model.User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                selectTruckTeam();
                selectRole();
            }
          

        }
        /// <summary>
        ///下拉列表获取角色信息
        /// </summary>
        public void selectRole() {
        
            DataTable dstdropRole = new DataTable();
            dstdropRole = roleBll.GetRole().Tables[0];
            dropRoleID.DataTextField = "RoleName";
            dropRoleID.DataValueField = "RoleID";

            dropRoleID.DataSource = dstdropRole;
            dropRoleID.DataBind();
            dropRoleID.Items.Insert(0, new ListItem("不限", "-1"));

        }
        /// <summary>
        /// 查询用户信息
        /// </summary>
        public void selectTruckTeam()
        {
            //获取用户信息
            DataSet dstUser = new DataSet();
            //string stateGrade = e.Row.Cells[8].Text.Trim();
            dstUser = userBLL.GetUserRole();
            gvUser.DataSource = dstUser;
            gvUser.DataBind();

        }
        /// <summary>
        /// 删除用户信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
         
           string id = gvUser.DataKeys[e.RowIndex].Value.ToString();
           int reslut = userBLL.DelUserRole(id);
            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：删除用户";
            //获得行为类型
            SysLogModel.Fk_TypeID = 3;
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
                selectTruckTeam();
            }

            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);
                

        }
        /// <summary>
        /// 通过检索查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string name = txtUserName.Text;
            string phone = txtPhone.Text;
            string account= txtAccount.Text;
            string E_mail = txtEmail.Text;
          
            int  sex=0;
        
            //获取的性别的Value值 0 1 %
            if (rblSex.SelectedValue=="0")
            {
                sex = 0;

            }
            else if (rblSex.SelectedValue == "1")
            {
                sex = 1;
            }

            else
            {
                sex = 2;
            }
            //获取的删除状态的Value值 0 1 %
            int isdelete =0;
        
            if (rblIsDelete.SelectedValue == "0")
            {
                isdelete = 0;

            }
            else if (rblIsDelete.SelectedValue == "1")
            {
                isdelete = 1;

            }
            else {
                isdelete = 2;
            }
            //获取角色ID 
            string roleid = dropRoleID.SelectedValue;           
            //获取添加时间
            string SInTimm= txtSInTime.Text;
            string EInTime=  txtEInTime.Text;
            //获取修改时间
            string salter=  txtSAlterTime.Text;
            string ealtertime = txtEAlterTime.Text;


            DataSet dt;
            dt = sffmangBll.btnS( name,  phone,  account,  E_mail,  isdelete,  sex, roleid);
            gvUser.DataSource = dt;
            gvUser.DataBind();
           // ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('"+ dropRoleID.SelectedValue+ "');</script>");

        }
       


        /// <summary>
        /// 进入编辑状态
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvUser_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //获取要编辑的索引
            gvUser.EditIndex = e.NewEditIndex;

            selectTruckTeam();

            selectRole();
        }
        /// <summary>
        /// 进行更新状态
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
       
            string UserID = this.gvUser.DataKeys[e.RowIndex].Value.ToString();
            sffmangModel.UserID = UserID;
            //获取用户
            sffmangModel.UserName = ((this.gvUser.Rows[e.RowIndex].Cells[0].Controls[0]) as TextBox).Text;

            //获取性别
            int sex;
            int.TryParse(((this.gvUser.Rows[e.RowIndex].Cells[1].Controls[0]) as TextBox).Text, out sex);
            sffmangModel.Sex = sex;
            //string sex = "0";
            //sex= ((this.gvUser.Rows[e.RowIndex].Cells[0].Controls[1]) as TextBox).Text;

            //获取账号
            sffmangModel.Account = ((this.gvUser.Rows[e.RowIndex].Cells[2].Controls[0]) as TextBox).Text;
            //获取电话
            sffmangModel.Phone = ((this.gvUser.Rows[e.RowIndex].Cells[3].Controls[0]) as TextBox).Text;
            //获取邮件
            sffmangModel.Email = ((this.gvUser.Rows[e.RowIndex].Cells[4].Controls[0]) as TextBox).Text;
            sffmangModel.FK_RoleID = int.Parse(((this.gvUser.Rows[e.RowIndex].Cells[5].Controls[0]) as TextBox).Text);
            sffmangModel.AlterTime = DateTime.Parse(((this.gvUser.Rows[e.RowIndex].Cells[6].Controls[0]) as TextBox).Text);
            //获取删除
            int isdelete;
            int.TryParse(((this.gvUser.Rows[e.RowIndex].Cells[7].Controls[0]) as TextBox).Text, out isdelete);
            sffmangModel.IsDelete = isdelete;
            sffmangModel.CheckInTime = DateTime.Parse(((this.gvUser.Rows[e.RowIndex].Cells[8].Controls[0]) as TextBox).Text);
            //返回修改的查询数量
            int result= sffmangBll.UpdateStaffMang(sffmangModel);


            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
          

            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：修改用户";
            //获得行为类型
            SysLogModel.Fk_TypeID = 3;
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
                this.gvUser.EditIndex = -1;
                selectTruckTeam();
            }
            else
            {
                //0：正常 1：异常
                SysLogModel.IsException = 1;
            }
            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);


        }
        /// <summary>
        /// 取消
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.gvUser.EditIndex = -1 ;
            selectTruckTeam();
        }
    }
}