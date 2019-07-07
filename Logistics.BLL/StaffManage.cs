using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Logistics.BLL
{
   public  class StaffManage
    {
        DAL.StaffManage staMange = new DAL.StaffManage();      
        public DataSet btnS(string name, string phone, string account, string E_mail, int isdelete, int sex, string roleid)
        {
            DataSet dt;
            dt= staMange.btnS( name,  phone,  account,  E_mail,  isdelete,  sex, roleid);
            return dt;
        }
        public int UpdateStaffMang(Model.StaffManage staMangeModel)
        {
      
            int result= staMange.UpdateStaffMang(staMangeModel);
            return result;

        }
    }
}
