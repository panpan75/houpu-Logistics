using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logistics.Model
{
   public  class Goods
    {
        /// <summary>
        /// 编号
        /// </summary>
        public int GoodsID { get; set; }
        /// <summary>
        /// 名称
        /// </summary>
        public string GoodsName { get; set; }
        /// <summary>
        /// 数量
        /// </summary>
        public int Amount { get; set; }
        /// <summary>
        /// 重量
        /// </summary>
        public float Weight { get; set; }
        /// <summary>
        /// 体积
        /// </summary>
        public float Volume { get; set; }
        /// <summary>
        /// 承运单编号
        /// </summary>
        public int FK_CarriersID { get; set; }
        /// <summary>
        /// 数据记录状态
        /// </summary>
        public byte IsDelete { get; set; }
}
}
