using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logistics.Model
{
   public class Driver
    {
        /// <summary>
        /// 司机编号
        /// </summary>
        public int DriverID
        {
            get;
            set;
        }
        /// <summary>
        /// 司机姓名
        /// </summary>
        public string Name
        {
            get;
            set;
        }
        /// <summary>
        /// 性别
        /// </summary>
        public Byte Sex
        {
            get;
            set;
        }
        /// <summary>
        /// 出生日期
        /// </summary>
        public DateTime Birth
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
        /// 身份证号码
        /// </summary>
        public string IDCard
        {
            get;
            set;
        }
        /// <summary>
        /// 车队编号
        /// </summary>
        public int FK_TeamID
        {
            get;
            set;
        }
        /// <summary>
        /// 工作状态
        /// </summary>
        public byte State
        {
            get;
            set;
        }
        /// <summary>
        /// 备注
        /// </summary>
        public string Remark
        {
            get;
            set;
        }
        /// <summary>
        /// 加入时间
        /// </summary>
        public DateTime CheckInTime
        {
            get;
            set;
        }
        /// <summary>
        /// 数据记录状态
        /// </summary>
        public byte IsDelete
        {
            get;
            set;
        }
        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime AlterTime
        {
            get;
            set;
        }
     
    }
}
