using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
namespace Logistics.BLL
{
     public class Cost
    {
        DAL.Cost CostDal= new DAL.Cost();
        /// <summary>
        /// 查询成本
        /// </summary>
        /// <returns></returns>
        public DataTable CostMaintenance()
        {
            return CostDal.CostMaintenance();
        }
        /// <summary>
        /// 条件查询
        /// </summary>
        /// <param name="rbFinishedState"></param>
        /// <param name="ReceiveDateBegin"></param>
        /// <param name="ReceiveDateEnd"></param>
        /// <returns></returns>
        public DataTable selectCost(int rbFinishedState, string ReceiveDateBegin, string ReceiveDateEnd)
        {
          
            return CostDal.selectCost(rbFinishedState, ReceiveDateBegin, ReceiveDateEnd);
        }
    }
}
