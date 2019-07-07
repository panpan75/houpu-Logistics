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
    public partial class AddStaff : System.Web.UI.Page
    {

        BLL.Role role = new BLL.Role();
        BLL.User userbll = new BLL.User();
        Model.User userModer = new Model.User();
        Model.SysLog SysLogModel = new Model.SysLog();
        BLL.SysLog SysLogBLL = new BLL.SysLog();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { bingddlRoleList(); }


        }
        public void bingddlRoleList()
        {
            DataSet dst;
            dst = role.GetRole();
            ddlRoleList.DataSource = dst;

            ddlRoleList.DataTextField = "RoleName";
            ddlRoleList.DataValueField = "RoleID";

            ddlRoleList.DataBind();
            ddlRoleList.Items.Insert(0, new ListItem("请选择", "-1"));

        }

        protected void addStaff_Click(object sender, EventArgs e)
        {
            string name = txtUserName.Text;
            string sex = rblSex.SelectedValue;
            string account = txtAccount.Text;
            string pwd = txtPwd.Text;
            string tel = txtTel.Text;
            string email = TextBox1.Text;
            string role = ddlRoleList.SelectedValue;
            userModer.UserName = name;
            userModer.Sex = byte.Parse(sex);
            userModer.Password = pwd;
            userModer.Phone = tel;
            userModer.Email = email;
            userModer.FK_RoleID = int.Parse(role);
            userModer.Account = account;
            //添加成员
            int result = userbll.insertUser(userModer);
            //获得用户id
            int Userid = Model.User.CurrentUser.UserID;
            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：添加用户";
            //获得行为类型
            SysLogModel.Fk_TypeID = 2;
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
                this.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('添加成功')", true);

            }
            else
            {
                //0：正常 1：异常
                SysLogModel.IsException = 0;

                this.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('添加失败')", true);
            }

            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);

        }
   
    }
}