using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
namespace Logistics.BLL
{
    public  class SearchLog
    {

        DAL.SearchLog SearchLogDal =new DAL.SearchLog();
        /// <summary>
        /// 查询日志用户
        /// </summary>
        /// <returns></returns>
        public DataTable bingSearchLog()
        {

            return SearchLogDal.bingSearchLog(); ;
        }
        /// <summary>
        /// 利用真分页进行查询日志
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="tableName"></param>
        /// <param name="keyID"></param>
        /// <param name="strWhere"></param>
        /// <param name="RecordCount"></param>
        /// <returns></returns>
        public DataTable getLog(int pageIndex, int pageSize, string tableName, string keyID, string strWhere, out int RecordCount)
        {

            return SearchLogDal.getLog(pageIndex, pageSize, tableName, keyID, strWhere, out RecordCount);

        }
    }
}
