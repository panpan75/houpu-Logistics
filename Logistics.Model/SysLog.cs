using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
namespace Logistics.Model
{
    public class SysLog
    {
        /// <summary>
        ///日志编号
        /// </summary>
        public int LogID  {
            get;
            set;
        }
        /// <summary>
        ///操作行为
        /// </summary>
        public string Behavior
        {
            get; set;
        }
        /// <summary>
        ///行为类型 
        /// </summary>
        public int Fk_TypeID
        {
            get; set;
        }
        /// <summary>
        ///用户ID
        /// </summary>
        public int FK_UserID
        {
            get; set;
        }
        /// <summary>
        ///参数
        /// </summary>
        public string Parameters
        {
            get; set;
        }
        /// <summary>
        ///存储过程名
        /// </summary>
        public String ProcName
        {
            get; set;
        }
        /// <summary>
        ///登录IP
        /// </summary>
        public string IP
        {
            get; set;
        }
        /// <summary>
        ///写入时间
        /// </summary>
        public DateTime CheckInTime
        {
            get; set;
        }


        /// <summary>
        ///异常时间详情
        /// </summary>
        public string Exception
        {
            get; set;
        }
        /// <summary>
        ///0：正常 1：异常
        /// </summary>
        public byte IsException
        {
            get; set;
        }


}
}
