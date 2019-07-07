using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//添加引用
using System.Data;
using System.Data.SqlClient;
//数据库拼接引用

namespace Logistics
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        BLL.SysLog SysLogBLL = new BLL.SysLog();
        BLL.User UserBll = new BLL.User();
        Model.SysLog SysLogModel = new Model.SysLog();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //IsPostBack回发 页面第一次加载的时候
            {
                //DataSet dt;
                //string sql = "select * from [user]";
                //dt = DBHelper.getdataset(sql,null);
                if (Request.Cookies["Useraccount"] != null)
                {
                    this.txtAccount.Text = Request.Cookies["Useraccount"].Value;
                }
            }
        }

        protected void ibtnLogin_Click(object sender, ImageClickEventArgs e)
        {
            if (txtAccount.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('账号不能为空');</script>");
            }
            else if(txtPassword.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('密码不能为空');</script>");
            }
            //if (Page.IsValid) {

                string account = this.txtAccount.Text;//获得文本框账号的值
                string Pwd = this.txtPassword.Text;//获取文本框密码的值
                //创建一个查询语句
                //string sql = "select * from [user]  where Account='"+ account + "' and  Password='"+ pwd + "' ";            
                //获得UserID
                object ID = UserBll.islogin(account, Pwd);
                //Session["id"] = txtAccount.Text; --获取账号
               
                   
               

           
              
                 if (ID != null) //只有 object才有Null
                {

                        HttpCookie CookieUser = new HttpCookie("Useraccount", account);
                        //获得Cookie过期时间
                        CookieUser.Expires = DateTime.Now.AddHours(1);
                        //添加Cookie
                        Request.Cookies.Add(CookieUser);
                        //存入id   
                        Session["SessionID"] = ID;
                        //获取RoleID 传入新定义的User中        

                        Model.User.CurrentUser = UserBll.UserInfo(ID.ToString());
                        //获取用户ID
                        //添加操作行为
                        SysLogModel.Behavior = Model.User.CurrentUser.UserName + "：登录系统";
                        //获得行为类型
                        SysLogModel.Fk_TypeID = 1;

                        //SysLogModel.FK_UserID =int.Parse( Session["SessionID"].ToString());
                        //参数
                        SysLogModel.Parameters = ID + "," + account + "," + Pwd;
                        //存储过程名
                        SysLogModel.ProcName = "没有存储过程";

                        //获取客户端的Ip地址
                        SysLogModel.IP = Request.UserHostAddress;
                        //异常时间详情
                        SysLogModel.Exception = "";
                        SysLogModel.FK_UserID = int.Parse(ID.ToString());
                        //0：正常 1：异常
                        SysLogModel.IsException = 0;
                        //向数据库添加系统日志操作
                        SysLogBLL.AddAllSysLog(SysLogModel);

                        Response.Redirect("Index.aspx");
                        //Server.Transfer("Index.aspx?id=" + ID);  只能进行页面跳转传值
                        //Server.Transfer("UserHome.aspx");
                    }                          
                else
                {

                    ////0：正常 1：异常
                    //SysLogModel.IsException = 1;
                    ////向数据库添加系统日志操作
                    //SysLogBLL.AddAllSysLog(SysLogModel);

                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('账号密码不正确');</script>");                   
                }                                                                                        
            //}



        }
        /// <summary>
        /// 第一个方式
        /// </summary>
        //public void one() {

        //    string account = this.txtAccount.Text;//获得文本框账号的值
        //    string Pwd = this.txtPassword.Text;//获取文本框密码的值
        //                                       //创建一个查询语句
        //    string sql = "select * from [user]  where Account='"+ account + "' and  Password='"+ Pwd + "' ";


        //    DataSet ds = new DataSet();
            
        //    ds =  DBHelper.getdataset(sql);
        //    DataTable dt = ds.Tables[0];
        //   查询值是否存在
        //    if (dt.Rows.Count > 0)
        //    {
        //        Response.Write("<script>alert('成功！')</script>");

        //    }
        //    else
        //    {

        //        Response.Write("<script>alert('失败！')</script>");
        //    }

        //}


    }
}