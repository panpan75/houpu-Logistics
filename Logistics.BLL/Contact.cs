using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Logistics.BLL
{
     public class Contact
    {
        DAL.Contact ContactBll = new DAL.Contact();
        /// <summary>
        /// 通过司机ID查询驾驶员车辆绑定表
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public object ContactDriverID(int id)
        {
            return ContactBll.ContactDriverID(id);
        }
        /// <summary>
        /// 通过车辆id查询驾驶员车辆绑定表
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public object ContactTruckID(int id)
        {
            return ContactBll.ContactTruckID(id);
        }
    }
}
