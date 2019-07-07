using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logistics.Model
{
     public  class TruckTeam
    {
        /// <summary>
        /// 车队编号
        /// </summary>
        public int TeamID
        {
            get;
            set;

        }
        /// <summary>
        /// 车队名称
        /// </summary>
        public string TeamName
        {
            get;
            set;

        }
        /// <summary>
        /// 车队负责人
        /// </summary>
        public string Leader
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
        /// 创队时间
        /// </summary>
        public string CheckInTime
        {
            get;
            set;

        }
        /// <summary>
        /// 数据记录状态
        /// </summary>
        public Byte isDelete
        {
            get;
            set;

        }
        /// <summary>
        /// 修改时间
        /// </summary>
        public string AlterTime
        {
            get;
            set;

        }

      
    }
}
