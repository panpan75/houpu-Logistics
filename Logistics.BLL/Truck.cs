using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.BLL
{
   public class Truck
    {
        DAL.Truck tuckDal = new DAL.Truck();
        Model.Truck TruckModel = new Model.Truck();
        /// <summary>
        /// 获取车队信息
        /// </summary>
        /// <returns></returns>
        public DataTable bindddlTruck()
        {
            DataTable dt =null;
            //定义一个缓存键
            string keyName = "TruckTeam";
            //获取缓存
            dt = (DataTable)CaCheHelper.GedCache(keyName);
            //如果缓存没值就调用查询方法
            if (dt == null)
            {
                dt = tuckDal.bindddlTruck().Tables[0];
                //如果能读取到表中数据 就加入缓存
                if (dt.Rows.Count > 0)
                {
                    CaCheHelper.insertCache(keyName, dt, DateTime.Now.AddMinutes(5));

                }
            }
            return dt;
      
        }
        /// <summary>
        /// 获取下拉框中车辆信息中的车队编号
        /// </summary>
        /// <returns></returns>
        public DataSet bindddlTruckTeamID()
        {
         
            DataSet dt = tuckDal.bindddlTruckTeamID();
            return dt;
        }
        /// <summary>
        /// 获取下拉框中车辆信息中的车辆类型
        /// </summary>
        /// <returns></returns>
        public DataSet bindddlTruckType()
        {

            DataSet dt = tuckDal.bindddlTruckType();
            return dt;
        }
        /// <summary>
        /// 根据条件查询
        /// </summary>
        /// <returns></returns>
        public DataSet rptTruckList(int fk_TeamID, string numer, string type)
        {
            DataSet dt = tuckDal.rptTruckList(fk_TeamID, numer, type);
            return dt;
        }
        /// <summary>
        /// 向Truck中添加数据
        /// </summary>
        /// <param name="truckModel"></param>
        /// <returns></returns>
        public int AddTruck(Model.Truck truckModel)
        {
            int result = tuckDal.AddTruck(truckModel);
            return result;
        }
        /// <summary>
        /// 通过 TruckID 获取truck信息
        /// </summary>
        /// <param name="truckid"></param>
        /// <returns></returns>
        public DataTable getTrucklistTruckid(int truckid)
        {
            return tuckDal.getTrucklistTruckid(truckid);
        }

        /// <summary>
        /// 更新truck信息
        /// </summary>
        /// <returns></returns>
        public int updeTruck(Model.Truck truckModer)
        {
            return tuckDal.updeTruck(truckModer);

        }
        /// <summary>
        /// 删除车辆
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int deleteTruck(int id)
        {
            return tuckDal.deleteTruck(id);
        }

        /// <summary>
        /// 查询没有被绑定的车辆
        /// </summary>
        /// <param name="TeamID">该传值过来的 车队的车</param>
        /// <returns></returns>
        public DataSet getContactDriverID(int TeamID)
        {

            return tuckDal.getContactDriverID(TeamID);

        }
        /// <summary>
        /// 绑定车辆 向添加驾驶员车辆绑定表
        /// </summary>
        /// <param name="TruckID">车辆编号</param>
        /// <param name="DriverID">司机编号</param>
        /// <returns></returns>
        public int InsertContact(int TruckID, int DriverID)
        {
            return tuckDal.InsertContact(TruckID, DriverID);

        }
        /// <summary>
        /// 获取车辆详情
        /// </summary>
        /// <param name="id">车辆编号</param>
        /// <returns></returns>
        public Model.Truck TruckInfoTruckid(int id)
        {
            DataTable dt;
            dt = tuckDal.getTrucklistTruckid(id);
            if (dt.Rows.Count > 0)
            {
                DataRow rows = dt.Rows[0];
                TruckModel.TruckID = int.Parse(rows["TruckID"].ToString());
                TruckModel.Number = rows["Number"].ToString();
                TruckModel.BuyDate = DateTime.Parse(rows["BuyDate"].ToString());
                TruckModel.Type = rows["Type"].ToString();
                TruckModel.Length = rows["Length"].ToString();
                TruckModel.FK_TeamID = int.Parse(rows["FK_TeamID"].ToString());
                TruckModel.Remark = rows["Remark"].ToString();
                TruckModel.CheackInTime = rows["CheackInTime"].ToString();
                TruckModel.Tonnage = int.Parse(rows["Tonnage"].ToString());
                TruckModel.State = byte.Parse(rows["State"].ToString());
          
            }
            return TruckModel;
        }
    }
}
