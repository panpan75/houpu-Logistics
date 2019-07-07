using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
    public class User
    {
        /// <summary>
        /// 登录页面 跳转获取用户的UserID
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="Pwd">密码</param>
        /// <returns></returns>
        public object isLogin(string account, string Pwd) {
            string sql = "select UserID from [user]  where Account=@account and  Password=@pwd";
            //string sql = "select UserID  from [User]  join[Role] on[User].UserID =[Role].RoleID  where Account=@account and  Password=@pwd";
            //验证账号和密码是否正确
            // string sql = "select 1 from [user]  where Account=@account and  Password=@pwd";
            SqlParameter[] ps = {

                    new SqlParameter("@account",account),//参数名称 新的值(页面传递过来的值)
                    new SqlParameter("@pwd",Pwd)
            };
            object result = DBHelper.ExecuteScalar(sql, ps);
            return result;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="ID">获取UserID</param>
        /// <returns></returns>
        public DataSet UserHome(string ID)
        {
            DataSet ds;

            //SqlParameter [] ps = {

            //        new SqlParameter
            //}
            string sql = "select * from  [User] where UserID='" + ID + "'";
            return ds = DBHelper.getdataset(sql);
        }
        /// <summary>
        /// 获取用户信息
        /// </summary>
        /// <returns></returns>
        public DataSet GetUser()
        {
            DataSet ds = new DataSet();
            string sql = "select  * from  [User]  ";
            return ds = DBHelper.getdataset(sql);
        }
        /// <summary>
        /// 删除用户与角色信息
        /// </summary>
        /// <returns></returns>
        //public int DelUserRole2(string ID)
        //{
        //    string sql = " delete from   [User] where UserID=@id ";
        //    SqlParameter[] ps =
        //    {

        //        new SqlParameter ("@id",ID)
        //    };
        //    int reslut = DBHelper.ExecuteNonQuery(sql, ps);
        //    return reslut;

        //}

        public int DelUserRole(string ID)
        {
            string sql = " delete from   [User] where UserID=@id ";
            SqlParameter[] ps =
            {

                new SqlParameter ("@id",ID)
            };
            int reslut = DBHelper.ExecuteNonQuery(sql, ps);
            return reslut;

        }

        /// <summary>
        /// 获取用户信息
        /// </summary>
        /// <returns></returns>
        public DataSet GetUserRole()
        {
            DataSet ds = new DataSet();
            string sql = "select  * from  [User] ";
            return ds = DBHelper.getdataset(sql);
        }

        /// <summary>
        /// 向user插入数据
        /// </summary>
        public int insertUser(Model.User UserModer)
        {


            string sql = "insert into [User](UserName,Sex,Account,Password,Phone,Email,FK_RoleID,CheckInTime,IsDelete,AlterTime) values(@username, @sex, @acc, @pwd, @pho, @emai, @role, getdate(),0,getdate());";
            SqlParameter[] sp = {
                new SqlParameter("@username",UserModer.UserName),
                new SqlParameter("@sex",UserModer.Sex),
                new SqlParameter("@acc",UserModer.Account),
                new SqlParameter("@pwd",UserModer.Password),
                new SqlParameter("@pho",UserModer.Phone),
                new SqlParameter("@emai",UserModer.Email),
                new SqlParameter("@role",UserModer.FK_RoleID),
             
            // new SqlParameter("@delete",UserModer.IsDelete),
       
            };
            int  result = DBHelper.ExecuteNonQuery(sql,sp);
            return result;

        }
        /// <summary>
        /// 根据用户id 查询用户和角色表
        /// </summary>
        /// <param name="UserID">用户id</param>
        /// <returns></returns>
        public DataSet getUserRoleID(string UserID)
        {
            string sql = "select [User].*,[Role].RoleName from [User]  join [Role] on [User].UserID=[Role].RoleID where  UserID=@id";
            SqlParameter[] sp = {

                new SqlParameter("@id",UserID)
            };
            DataSet ds = DBHelper.getdataset(sql,sp);
            return ds;

        }


    }
}
