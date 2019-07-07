using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logistics.Model
{
   public class Scheduling
    {
        /// <summary>
        /// 调度编号
        /// </summary>
        public int SchedulingID
        {
            get;
            set;
        }
        /// <summary>
        /// 油费
        /// </summary>
        public float OilCost
        {
            get;
            set;
        }
        /// <summary>
        /// 过桥费
        /// </summary>
        public float Toll
        {
            get;
            set;
        }
        /// <summary>
        /// 罚款
        /// </summary>
        public float Fine
        {
            get;
            set;
        }
        /// <summary>
        /// 其他费用
        /// </summary>
        public float OtherCost
        {
            get;    
            set;
        }

    }
}
