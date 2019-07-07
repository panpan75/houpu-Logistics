using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace Logistics.Model
{
    public class StaffManage
    {
        /// <summary>
        /// 角色编号
        /// </summary>
        public string UserID
        {
            get;
            set;
        }
        /// <summary>
        /// 用户姓名
        /// </summary>
        public string UserName
        {
            get;
            set;
        }
        /// <summary>
        ///性别 
        /// </summary>
        public int Sex
        {
            get;
            set;
        }
        /// <summary>
        /// 用户账号
        /// </summary>
        public string Account
        {
            get;
            set;
        }
        /// <summary>
        /// 用户密码
        /// </summary>
        public string Password
        {
            get;
            set;
        }
        /// <summary>
        /// 联系电话    
        /// </summary>
        public string Phone
        {
            get;
            set;
        }
        /// <summary>
          /// 电子邮箱
          /// </summary>
        public string Email
        {
            get;
            set;
        }
        /// <summary>
          /// 用户角色编号
          /// </summary>
        public int FK_RoleID
        {
            get;
            set;
        }
        /// <summary>
          /// 修改时间
          /// </summary>
        public int 加入时间
        {
            get;
            set;
        } /// <summary>
          /// 修改时间  
          /// </summary>
        public DateTime AlterTime
        {
            get;
            set;
        }
        /// <summary>
        /// 数据记录状态
        /// </summary>
        public int IsDelete
        {
            get;
            set;
        } /// <summary>
          /// 修改时间  
          /// </summary>
        public DateTime CheckInTime
        {
            get;
            set;
        }

    }
}
