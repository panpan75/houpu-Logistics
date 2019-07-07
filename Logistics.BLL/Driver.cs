using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.BLL
{
    public  class Driver
    {
        DAL.Driver DriverDal = new DAL.Driver();
        /// <summary>
        /// 查询驾驶员信息表
        /// </summary>
        /// <returns></returns>
        public DataSet bindDrverList()
        {

            return DriverDal.bindDrverList();
        }
        /// <summary>
        /// 查询驾驶员信息表根据id
        /// </summary>
        /// <returns></returns>
        public DataSet DrverListDriverID(int id)
        {
            return DriverDal.DrverListDriverID(id);
        }

        /// <summary>
        /// 绑定下拉列表信息
        /// </summary>
        /// <returns></returns>
        public DataSet ddlDrver()
        {
            return DriverDal.ddlDrver();
        }
        /// <summary>
        /// 根据条件查询驾驶员信息
        /// </summary>
        /// <param name="driverModel"></param>
        /// <returns></returns>
        public DataSet CriteriaDrver(Model.Driver driverModel)
        {

            return DriverDal.CriteriaDrver(driverModel);
        }
        /// <summary>
        /// 删除驾驶员信息
        /// </summary>
        /// <param name="DriverModel"></param>
        /// <returns></returns>
        public int DeleteDrver(Model.Driver DriverModel)
        {
            return DriverDal.DeleteDrver(DriverModel);
        }
        /// <summary>
        ///添加驾驶员信息
        /// </summary>
        /// <param name="DriverModel"></param>
        /// <returns></returns>
        public int InsertDrver(Model.Driver DriverModel)
        {
            return DriverDal.InsertDrver(DriverModel);
        }

        public int UpdateDrver(Model.Driver DriverModel)
        {
            return DriverDal.UpdateDrver(DriverModel);
        }

    
        /// <summary>
        /// 接触绑定 删除驾驶员车辆绑定表
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int DeleteContact(int id)
        {
            return DriverDal.DeleteContact(id);
        }
       
    }
}
