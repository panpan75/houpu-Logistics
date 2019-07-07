using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.BLL
{
     public  class Carriers
    {
        DAL.Carriers CarriersDal = new DAL.Carriers();
        Model.Carriers CarriersModel = new Model.Carriers();
        /// <summary>
        /// 查询承运单
        /// </summary>
        /// <returns></returns>
        public DataTable bindCarriers()
        {
            DataTable dt =new DataTable();
            //定义一个缓存键
            string keyName = "Carriers";
            //获取缓存
            dt = (DataTable)CaCheHelper.GedCache(keyName);
            //如果缓存没值就调用查询方法
            if (dt == null)
            {
                dt = CarriersDal.bindCarriers();

                //如果能读取到表中数据 就加入缓存
                if (dt.Rows.Count > 0)
                {
                    CaCheHelper.insertCache(keyName, dt, DateTime.Now.AddMinutes(5));
                }
            }         
            return dt;     
        }
        /// <summary>
        /// 添加真分页
        /// </summary>
        /// <param name="PageIndex">多少页</param>
        /// <param name="PageSize">每行显示多少页数</param>
        /// <param name="RecordCount">获得数据总量</param>
        /// <returns></returns>
        public DataTable getPageCarriers(int PageIndex, int PageSize, out int RecordCount)
        {
            return CarriersDal.getPageCarriers(PageIndex, PageSize,out  RecordCount);
        }
        /// <summary>
        ///使用实体层通过id查询承运单
        /// </summary>
        /// <returns></returns>
        public Model.Carriers bingCapacityInfo(int id)
        {
            DataTable dt;
            dt = CarriersDal.getCarriers(id).Tables[0];
            if (dt.Rows.Count > 0)
            {
                DataRow rows = dt.Rows[0];
                CarriersModel.CarriersID = int.Parse(rows["CarriersID"].ToString());
                CarriersModel.SendCompany = rows["SendCompany"].ToString();
                CarriersModel.SendAddress = rows["SendAddress"].ToString();
                CarriersModel.SendLinkman = rows["SendLinkman"].ToString();
                CarriersModel.SendPhone = rows["SendPhone"].ToString();
                CarriersModel.ReceiveCompany = rows["ReceiveCompany"].ToString();
                CarriersModel.FK_ReceiveAddress = rows["FK_ReceiveAddress"].ToString();
                CarriersModel.ReceiveLinkman = rows["ReceiveLinkman"].ToString();
                CarriersModel.ReceivePhone = rows["ReceivePhone"].ToString();
                CarriersModel.LeaverDate = DateTime.Parse(rows["LeaverDate"].ToString());
                CarriersModel.FinishedState = byte.Parse(rows["FinishedState"].ToString());
                CarriersModel.InsuranceCost = float.Parse(rows["InsuranceCost"].ToString());
                CarriersModel.TransportCost = float.Parse(rows["TransportCost"].ToString());
                CarriersModel.OtherCost = float.Parse(rows["OtherCost"].ToString());
                CarriersModel.TotalCOst = float.Parse(rows["TotalCOst"].ToString());
                CarriersModel.FK_UserID = int.Parse(rows["FK_UserID"].ToString());
                CarriersModel.Remark = rows["Remark"].ToString();
                CarriersModel.CheckInTime = DateTime.Parse(rows["CheckInTime"].ToString());
                CarriersModel.IsDelete = byte.Parse(rows["IsDelete"].ToString());
                CarriersModel.AlterTime = DateTime.Parse(rows["AlterTime"].ToString());

            }
            return CarriersModel;
        }
        /// <summary>
        /// 通过id调用存储过程删除承运单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int delectCarriers(int id)
        {
            return CarriersDal.delectCarriers(id);

        }
        /// <summary>
        /// 通过id 调用存储过程 查询承运单
        /// </summary>
        /// <returns></returns>
        public DataTable getCarriersCarriersID(int CarriersID)
        {
          
            return CarriersDal.getCarriersCarriersID(CarriersID);
        }
        /// <summary>
        /// 通过id 调用存储过程 修改承运单
        /// </summary>
        /// <returns></returns>
        public int updateCarriers(Model.Carriers CarriersModel)
        {

            return CarriersDal.updateCarriers(CarriersModel);
        }
        /// <summary>
        /// 调用存储过程进行添加承运单
        /// </summary>
        /// <param name="CarriersModel"></param>
        /// <returns></returns>
        public int AddCarriers(Model.Carriers CarriersModel)
        {

            return CarriersDal.AddCarriers(CarriersModel);
        }

        //进行条件查询
        public DataTable ConditionQueryCarriers(Model.Carriers CarriersModel,string leaverDateBegin,  string leaverDateEnd)
        {
            return CarriersDal.ConditionQueryCarriers(CarriersModel, leaverDateBegin, leaverDateEnd);
        }

        /// <summary>
        /// 车队车辆驾驶员连表查询
        /// </summary>
        /// <returns></returns>
        public DataTable FreeTruck_selectAll()
        {
            return CarriersDal.FreeTruck_selectAll();
        }

        /// <summary>
        /// 对调度表进行添加操作 并改变类型
        /// </summary>
        public int CommandTaskInsertScheduling(int Userid, int CarriersID, int TruckID)
        {
            
            return CarriersDal.CommandTaskInsertScheduling(Userid, CarriersID, TruckID);
        }

    }
}
