using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logistics.Model
{
   public class User
    {

        /// <summary>
        /// 用户表静态实例(新声明的类)
        /// </summary>
        public static User CurrentUser = null;
        /// <summary>
        /// 新赠的角色名称
        /// </summary>
        public string RoleName
        {
            get;
            set;
        }
        public int UserID
        {
            get;
            set;
            
        }
        public string UserName
        {
            get;
            set;

        }
        public Byte Sex
        {
            get;
            set;

        }
        public string Account
        {
            get;
            set;

        }
        public string Password
        {
            get;
            set;

        }
        public string Phone
        {
            get;
            set;

        }
        public string Email
        {
            get;
            set;

        }
        public int  FK_RoleID
        {
            get;
            set;

        }
        public DateTime CheckInTime
        {
            get;
            set;

        }
        public int  IsDelete
        {
            get;
            set;

        }
        public DateTime AlterTime
        {
            get;
            set;

        }
    }
}
