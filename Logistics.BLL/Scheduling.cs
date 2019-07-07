using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
namespace Logistics.BLL
{
    public class Scheduling
    {
        DAL.Scheduling SchedulingDal = new DAL.Scheduling();
        Model.Scheduling SchedulingModel = new Model.Scheduling();
        /// <summary>
        /// 通过id对调度任务信息表进行查询
        /// </summary>
        /// <param name="Schedulingid"></param>
        /// <returns></returns>
        public Model.Scheduling selectScheduling(int Schedulingid)
        {
            DataTable dt;
            dt = SchedulingDal.selectScheduling(Schedulingid);
            if (dt.Rows.Count > 0)
            {
                DataRow rows = dt.Rows[0];
                SchedulingModel.Toll =float.Parse( rows["Toll"].ToString());
                SchedulingModel.OilCost = float.Parse(rows["OilCost"].ToString());
                SchedulingModel.Fine= float.Parse(rows["Fine"].ToString());
                SchedulingModel.OtherCost= float.Parse(rows["OtherCost"].ToString());
            }
            return SchedulingModel;
        }
        /// <summary>
        /// 通过id调用存储过程对调度表进行更新
        /// </summary>
        /// <param name="SchedulingModel"></param>
        /// <returns></returns>
        public int updateScheduling(Model.Scheduling SchedulingModel)
        {
            return SchedulingDal.updateScheduling(SchedulingModel); ;
        }

    }
}
