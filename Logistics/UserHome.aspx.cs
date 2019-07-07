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
    public partial class UserHome : System.Web.UI.Page
    {
        BLL.User user = new BLL.User();
        protected void Page_Load(object sender, EventArgs e)
        {
            //QueryString获取页面的传值
            //string ID = Request.QueryString["id"];

            //通过Session 获取跳转前页面的传值
            string id = Session["SessionID"].ToString();

            DataSet ds = user.UserHome(id);
            //把DataSet转换成dataTable类型 读取第一表个的数据
            Username.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
            UserSex.Text = ds.Tables[0].Rows[0]["Sex"].ToString();
            string sex = ds.Tables[0].Rows[0]["FK_RoleID"].ToString();
         
            if (sex == "0")
            {
                UserSex.Text = "男";

            }
            else
            {
                UserSex.Text = "女";
            }

            string RoleID = ds.Tables[0].Rows[0]["FK_RoleID"].ToString();
            if (RoleID == "1")
            {
                FK_RoleID.Text = "系统管理员";
            }
            else if (RoleID == "2")
            {

                FK_RoleID.Text = "财务管理员";
            }
            else if (RoleID == "3")
            {

                FK_RoleID.Text = "运输管理员";
            }
            else if (RoleID == "4")
            {

                FK_RoleID.Text = "调度员";
            }
            else if (RoleID == "5")
            {

                FK_RoleID.Text = "承运业务员";
            }
            else
            {

                FK_RoleID.Text = "管理";
            }

            UserPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
            UserEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();

         

            //foreach (DataRowView drv in dt.Tables[0])
            //{

            //    name = Convert.ToString(drv["UserName"]);
            //    Response.Write(drv["UserName"] + "|" + drv["UserID"]);
            //}
        }

        //public void UHome() {

        //    string ID = Request.QueryString["id"];

        //    DataSet ds = user.UserHome(ID); 
        //    //Session["Name"] = TxtName.Text;

        //    UserName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
        //    UserSex.Text = ds.Tables[0].Rows[0]["Sex"].ToString();
        //    FK_RoleID.Text = ds.Tables[0].Rows[0]["FK_RoleID"].ToString();
        //    UserPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
        //    UserEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
        //}
    }
}