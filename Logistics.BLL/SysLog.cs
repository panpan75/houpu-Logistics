using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.BLL
{
    public class SysLog
    {
        DAL.SysLog SysLogDal = new DAL.SysLog();
        Model.SysLog SysLogModel = new Model.SysLog();
        /// <summary>
        /// 添加系统日志表表
        /// </summary>
        /// <param name="SysLogModel"></param>
        /// <returns></returns>
        public int AddAllSysLog(Model.SysLog SysLogModel)
        {
            return SysLogDal.AddAllSysLog(SysLogModel);
        }
        /// <summary>
        /// 查询行为类型
        /// </summary>
        public DataTable bingType()
        {
            return SysLogDal.bingType();
        }



    }
}
