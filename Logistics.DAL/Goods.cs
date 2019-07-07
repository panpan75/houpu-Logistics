using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
    public class Goods
    {
        /// <summary>
        /// 添加货物
        /// </summary>
        /// <param name="g"></param>
        /// <returns></returns>
        public int addGoods(Model.Goods GoodsModel)
        {
            string sql = "insert into Goods (FK_CarriersID,GoodsName,Amount,Weight,Volume,IsDelete) values(@FK_CarriersID,@GoodsName,@Amount,@Weight,@Volume,@IsDelete)";

            SqlParameter[] ps ={

                              new SqlParameter("@FK_CarriersID",GoodsModel.FK_CarriersID),
                              new SqlParameter("@GoodsName",GoodsModel.GoodsName),
                              new SqlParameter("@Amount",GoodsModel.Amount),
                              new SqlParameter("@Weight",GoodsModel.Weight),
                              new SqlParameter("@Volume",GoodsModel.Volume),
                              new SqlParameter("@IsDelete",GoodsModel.IsDelete)

                             };

            return DBHelper.ExecuteNonQuery(sql, ps);


        }
        /// <summary>
        /// 绑定货物
        /// </summary>
        /// <returns></returns>
        public DataTable bindGoods()
        {
            string proName = "P_Goods_select";
            return DBHelper.getTableProc(proName);

        }

    }
}
