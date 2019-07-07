using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logistics.Model
{
    /// <summary>
    /// 承运单
    /// </summary>
    public class Carriers
    {
        /// <summary>
        /// 承运单编号
        /// </summary>
        public int CarriersID
        {
            get;
            set;
        }
        /// <summary>
        /// 发货单位
        /// </summary>
        public string SendCompany
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public string SendAddress
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public string SendLinkman
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public string SendPhone
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public string ReceiveCompany
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public string FK_ReceiveAddress
        {
            get;
            set;
        }

        /// <summary>
        /// 
        /// </summary>
        public string ReceiveLinkman
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public string ReceivePhone
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime LeaverDate
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime ReceiveDate
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public byte FinishedState
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public float InsuranceCost
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public float TransportCost
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public float OtherCost
        {
            get;
            set;
        }
        /// <summary>
        /// 
        /// </summary>
        public float TotalCOst
        {
            get;
            set;
        }
        public string Remark
        {
            get;
            set;
        }
        public int FK_UserID
        {
            get;
            set;
        }
        public DateTime CheckInTime
        {
            get;
            set;
        }
        public byte IsDelete
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
