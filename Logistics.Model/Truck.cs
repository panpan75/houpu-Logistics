using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logistics.Model
{
    public class Truck
    {
        /// <summary>
        /// 车辆编号
        /// </summary>
        public int  TruckID
        {
            get;
            set;

        }

        /// <summary>
        /// 车牌号码
        /// </summary>
        public string Number
        {
            get;
            set;

        }
        /// <summary>
        /// 购车日期
        /// </summary>
        public DateTime BuyDate
        {
            get;
            set;

        }
        /// <summary>
        /// 车辆类型    
        /// </summary>
        public string Type  
        {
            get;
            set;

        }
        /// <summary>
        /// 创队时间
        /// </summary>
        public string Length
        {
            get;
            set;

        }
        /// <summary>
        /// 吨位
        /// </summary>
        public int  Tonnage
        {
            get;
            set;

        }
        /// <summary>
        /// 所属车队编号
        /// </summary>
        public int  FK_TeamID
        {
            get;
            set;

        }
        /// <summary>
        /// 工作状态
        /// </summary>
        public Byte State
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
        public string CheackInTime
        {
            get;
            set;

        }



    }
}
