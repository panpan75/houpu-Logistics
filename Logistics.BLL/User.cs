using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.BLL
{
    public class User
    {
        //调用 DAL中的User
        DAL.User userdal = new DAL.User();
        Model.User UserModel = new Model.User();

        /// <summary>
        /// 登录页面 跳转获取用户的UserID
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="Pwd">密码</param>
        /// <returns></returns>

        public object islogin(string account, string Pwd)
        {
            return userdal.isLogin(account, Pwd);

        }
        /// <summary>
        /// 通过id获取用户信息
        /// </summary>
        /// <param name="ID">获取UserID</param>
        /// <returns></returns>
        public DataSet UserHome(string ID)
        {
            DataSet ds;
            return ds = userdal.UserHome(ID);


        }
        /// <summary>
        /// 获取用户信息
        /// </summary>
        /// <returns></returns>
        public DataSet GetUserRole()
        {
            DataSet ds;
            return ds = userdal.GetUserRole();
        }
        /// <summary>
        /// 删除用户信息
        /// </summary>
        /// <returns></returns>
        public int DelUserRole(string id)
        {
          
            int reslut = userdal.DelUserRole(id);
            return reslut;
        }
        /// <summary>
        /// 向user插入数据
        /// </summary>
        public int insertUser(Model.User UserModer)
        {


            int reslut = userdal.insertUser(UserModer);
            return reslut;

        }

        /// <summary>
        /// 根据用户id 查询用户和角色表
        /// </summary>
        /// <param name="UserID">用户id</param>
        /// <returns></returns>
        public Model.User UserInfo(string id)
        {
            DataTable result = userdal.getUserRoleID( id).Tables[0];
            if(result.Rows.Count>0)
            {
                DataRow rows = result.Rows[0];
                UserModel.UserID = int.Parse(rows["UserID"].ToString());
                UserModel.RoleName = rows["RoleName"].ToString();
                UserModel.FK_RoleID =int.Parse( rows["FK_RoleID"].ToString());
                UserModel.UserName = rows["UserName"].ToString();
            }
            return UserModel;
        }

    }
}