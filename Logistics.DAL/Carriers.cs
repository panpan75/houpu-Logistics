using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.DAL
{
    public class Carriers 
    {
        /// <summary>
        /// 通过存储过程 来查询承运单信息
        /// </summary>
        /// <returns></returns>
        public DataTable bindCarriers()
        {
            string sql = "P_Carriers_selectCarriers";
            DataTable ds;
            ds = DBHelper.getTableProc(sql) ;
            return ds;
        }
        /// <summary>
        /// 添加真分页
        /// </summary>
        /// <param name="PageIndex">多少页</param>
        /// <param name="PageSize">每行显示多少页数</param>
        /// <param name="RecordCount">获得数据总量</param>
        /// <returns></returns>
        public DataTable getPageCarriers(int PageIndex,int PageSize,out int RecordCount)
        {
            string ProName = "P_GetPage";
            SqlParameter[] para = {
                new SqlParameter("@PageIndex",SqlDbType.Int),
                new SqlParameter("@PageSize",SqlDbType.Int),
                new SqlParameter("@RecordCount",SqlDbType.Int)
            };
            para[0].Value = PageIndex;
            para[1].Value = PageSize;
            // 设置参数类型  
            para[2].Direction = ParameterDirection.Output;//存储过程output值
            DataTable dt= DBHelper.getTableProc(ProName, para);
            RecordCount = (int)para[2].Value;
            return dt;
        }
        /// <summary>
        /// 通过id 查询承运单
        /// </summary>
        /// <returns></returns>
        public DataSet getCarriers(int CarriersID)
        {
            string sql = "select * from  Carriers where CarriersID=@id";
            SqlParameter[] sp = {
               new  SqlParameter  ("@id",CarriersID)
            };
            DataSet ds;
            ds = DBHelper.getdataset(sql,sp);
            return ds;
        }
        /// <summary>
        /// 通过id 调用存储过程 查询承运单
        /// </summary>
        /// <returns></returns>
        public DataTable getCarriersCarriersID(int CarriersID)
        {
            string sql = "P_Carriers_selectALLCarriersCarriersID";
            SqlParameter[] para = {
                new SqlParameter ("@Carriersid",SqlDbType.Int)
            };
            para[0].Value = CarriersID;
            DataTable dt;
            dt = DBHelper.getTableProc(sql, para);
            return dt;
        }
        /// <summary>
        /// 通过id调用存储过程删除承运单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int delectCarriers(int id)
        {
            string Proc = "P_Carriers_deleteCarriers_CarriersID";
            SqlParameter[] para = {
                new SqlParameter ("@Carriersid",SqlDbType.Int)
            };
            para[0].Value = id;
            int result = DBHelper.getCommExecuteNonQuery(Proc,para);
            return result;

        }
        /// <summary>
        /// 通过id调用存储过程进行添加承运单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int AddCarriers(Model.Carriers CarriersModel)
        {
            string Proc = "P_Carriers_AddtCarriers_CarriersID";
            SqlParameter[] para = {             
                new SqlParameter ("@SendCompany",SqlDbType.VarChar),
                new SqlParameter ("@SendAddress",SqlDbType.VarChar),
                new SqlParameter ("@SendLinkman",SqlDbType.VarChar),
                new SqlParameter ("@SendPhone",SqlDbType.VarChar),
                new SqlParameter ("@ReceiveCompany",SqlDbType.VarChar),
                new SqlParameter ("@FK_ReceiveAddress",SqlDbType.VarChar),
                new SqlParameter ("@ReceiveLinkman",SqlDbType.VarChar),
                new SqlParameter ("@ReceivePhone",SqlDbType.VarChar),
                new SqlParameter ("@InsuranceCost",SqlDbType.Float),
                new SqlParameter ("@TransportCost",SqlDbType.Float),
                new SqlParameter ("@OtherCost",SqlDbType.Float),
                new SqlParameter ("@FK_UserID",SqlDbType.Int),
                new SqlParameter("@Carriersid",SqlDbType.Int)
            };
            para[0].Value = CarriersModel.SendCompany;
            para[1].Value = CarriersModel.SendAddress;
            para[2].Value = CarriersModel.SendLinkman;
            para[3].Value = CarriersModel.ReceiveCompany;
            para[4].Value = CarriersModel.FK_ReceiveAddress;
            para[5].Value = CarriersModel.ReceiveLinkman;
            para[6].Value = CarriersModel.ReceiveLinkman;
            para[7].Value = CarriersModel.ReceivePhone;
            para[8].Value = CarriersModel.InsuranceCost;
            para[9].Value = CarriersModel.TransportCost;
            para[10].Value = CarriersModel.OtherCost;
            para[11].Value = CarriersModel.FK_UserID;//通过登录传递过来的
            para[12].Direction = ParameterDirection.Output;
            int result = DBHelper.getCommExecuteNonQuery(Proc, para);
            CarriersModel.CarriersID = (int)para[12].Value;
            return result;
        }

        /// <summary>
        /// 通过id调用存储过程进行修改承运单
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int updateCarriers(Model.Carriers CarriersModel)
        {
            string Proc = "P_Carriers_updateCarrier";
            SqlParameter[] para = {
                new SqlParameter ("@CarriersID",SqlDbType.Int),
                new SqlParameter ("@SendCompany",SqlDbType.VarChar),
                new SqlParameter ("@SendAddress",SqlDbType.VarChar),
                new SqlParameter ("@SendLinkman",SqlDbType.VarChar),
                new SqlParameter ("@SendPhone",SqlDbType.VarChar),
                new SqlParameter ("@ReceiveCompany",SqlDbType.VarChar),
                new SqlParameter ("@FK_ReceiveAddress",SqlDbType.VarChar),
                new SqlParameter ("@ReceiveLinkman",SqlDbType.VarChar),
                new SqlParameter ("@ReceivePhone",SqlDbType.VarChar),        
                new SqlParameter ("@InsuranceCost",SqlDbType.Float),
                new SqlParameter ("@TransportCost",SqlDbType.Float),
                new SqlParameter ("@OtherCost",SqlDbType.Float),  
            };
            para[0].Value =  CarriersModel.CarriersID;
            para[1].Value =  CarriersModel.SendCompany;
            para[2].Value =  CarriersModel.SendAddress;
            para[3].Value =  CarriersModel.SendLinkman;
            para[4].Value =  CarriersModel.SendPhone;
            para[5].Value =  CarriersModel.ReceiveCompany;
            para[6].Value =  CarriersModel.FK_ReceiveAddress;
            para[7].Value =  CarriersModel.ReceiveLinkman;
            para[8].Value =  CarriersModel.ReceivePhone;
            para[9].Value =  CarriersModel.InsuranceCost;
            para[10].Value = CarriersModel.TransportCost;
            para[11].Value = CarriersModel.OtherCost;
            int result = DBHelper.getCommExecuteNonQuery(Proc, para);
            return result;

        }
        //进行条件查询
        public DataTable ConditionQueryCarriers(Model.Carriers CarriersModel,string leaverDateBegin, string leaverDateEnd)
        {
            string Proc = "P_Carriers_ConditionQueryCarriers";
            SqlParameter[] para = {
                new SqlParameter ("@CarriersID",SqlDbType.Int),
                new SqlParameter ("@ReceiveLinkman",SqlDbType.VarChar),
                new SqlParameter ("@SendLinkman",SqlDbType.VarChar),
                new SqlParameter ("@leaverDateBegin",SqlDbType.VarChar),
                new SqlParameter ("@leaverDateEnd",SqlDbType.VarChar),
            };
            para[0].Value = CarriersModel.CarriersID;
            para[1].Value = CarriersModel.ReceiveLinkman;
            para[2].Value = CarriersModel.SendLinkman;
            para[3].Value = leaverDateBegin;
            para[4].Value = leaverDateEnd;
    
            DataTable dt = DBHelper.getTableProc(Proc, para);
            return dt;
        }
        /// <summary>
        /// 车队车辆驾驶员关系表进行连表查询
        /// </summary>
        /// <returns></returns>
        public DataTable FreeTruck_selectAll()
        {
            string Proc = "P_CommandTask_selectAll";
            DataTable dt = DBHelper.getTableProc(Proc);
            return dt;

        }
        /// <summary>
        /// 对调度表进行添加操作 并改变类型
        /// </summary>
        public int CommandTaskInsertScheduling(int Userid,int CarriersID,int TruckID)
        {
            string Proc = "P_CommandTask_InsertScheduling";
            SqlParameter[] sp = {
                new SqlParameter("@Userid",SqlDbType.Int),
                new SqlParameter("@CarriersID",SqlDbType.Int),
                new SqlParameter("@TruckID",SqlDbType.Int),

            };
            sp[0].Value = Userid;
            sp[1].Value = CarriersID;
            sp[2].Value = TruckID;
            int result = DBHelper.getCommExecuteNonQuery(Proc,sp);
            return result;
        }

    }
}
