using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
   public class StaffManage
    {
        /// <summary>
        /// 条件查询
        /// </summary>
        /// <param name="name"></param>
        /// <param name="phone"></param>
        /// <param name="account"></param>
        /// <param name="E_mail"></param>
        /// <param name="isdelete"></param>
        /// <param name="sex"></param>
        /// <returns></returns>
        public DataSet btnS(string name, string phone, string account, string E_mail, int isdelete, int sex, string roleid) {
            string sql = "select  * from  [User] left join [Role] on  [User].FK_RoleID=[Role].RoleID  where 1=1 ";
           // string sql = "select * from [User]  where  UserName like '%@name%'";
           
         
            if (!string.IsNullOrEmpty(name))
            {
                sql += "  and UserName=@name";
            }
            if (!string.IsNullOrEmpty(phone))
            {
                sql += "  and Phone=@phone";
            }
            if (!string.IsNullOrEmpty(account))
            {
                sql += "  and Account=@acc";
            }
            if (!string.IsNullOrEmpty(E_mail))
            {
                sql += "  and Email=@e_eil";
            }
            if (isdelete != 2)
            {
                sql += " and IsDelete=@del";
            }
            if (sex!= 2)
            {
                sql += " and Sex=@sex";
            }
            if (roleid == "1" ||roleid=="2")
            {
                sql += " and FK_RoleID=@role";
            }   


            SqlParameter[] ps =
            {

                new SqlParameter ("@name",name),
                new SqlParameter ("@phone",phone),
                new SqlParameter ("@acc",account),
                new SqlParameter ("@e_eil",E_mail),
                new SqlParameter ("@del",isdelete),
                new SqlParameter ("@sex",sex),
                new SqlParameter ("@role",roleid)

            };

            DataSet dt = new DataSet();
            dt = DBHelper.getdataset(sql,ps);
            return dt;
        }
     
        public int UpdateStaffMang(Model.StaffManage stffMange)
        {

            string sql = "update [User] set UserName=@UserName,Sex=@Sex,Account=@Account, Phone=@Phone, Email=@Email,FK_RoleID=@FK_RoleID,CheckInTime=@CheckInTime,IsDelete=@IsDelete,AlterTime=@AlterTime where UserID=@UserID";
             SqlParameter[] ps = { 
                              new SqlParameter("@UserName",stffMange.UserName),
                              new SqlParameter("@Sex",stffMange.Sex),
                              new SqlParameter("@Account",stffMange.Account),
                              new SqlParameter("@Phone",stffMange.Phone),
                              new SqlParameter("@Email",stffMange.Email),
                              new SqlParameter("@FK_RoleID",stffMange.FK_RoleID),
                              new SqlParameter("@CheckInTime",stffMange.CheckInTime),
                              new SqlParameter("@IsDelete",stffMange.IsDelete),
                              new SqlParameter("@AlterTime",stffMange.AlterTime),
                              new SqlParameter("@UserID",stffMange.UserID)
                        };

            int result = DBHelper.ExecuteNonQuery(sql,ps);
            return result;
        }

    }
}
