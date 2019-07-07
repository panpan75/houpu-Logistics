using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
namespace Logistics.BLL
{
   public  class Goods
    {
        DAL.Goods GoodsDAL = new DAL.Goods();

        /// <summary>
        /// 添加货物
        /// </summary>
        /// <param name="g"></param>
        /// <returns></returns>
        public int addGoods(Model.Goods GoodsModel)
        {
            return GoodsDAL.addGoods(GoodsModel);
        }
        /// <summary>
        /// 绑定货物
        /// </summary>
        /// <returns></returns>
        public DataTable bindGoods()
        {
           
            return GoodsDAL.bindGoods();

        }
    }
}
