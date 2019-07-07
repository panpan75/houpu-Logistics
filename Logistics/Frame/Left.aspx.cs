using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Logistics.Frame
{
    public partial class Left : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Model.User.CurrentUser != null)
            {
                int roleId = Model.User.CurrentUser.FK_RoleID;
                //系统管理员
                if (roleId == 1)
                {
                    //系统维护
                    liSystemManage.Visible = true;
                }
                //财务管理员
                else if (roleId == 2)
                {
                    //成本核算
                    liCost.Visible = true;
                }
                //运输管理员
                else if (roleId == 3)
                {
                    //车辆管理
                    liTransportManage.Visible = true;
                    //驾驶员管理
                    liDriver.Visible = true;
                }
                //调度员
                else if (roleId == 4)
                {
                   
                    //车辆调度
                    liCommand.Visible = true;
                    //运力查询
                    liCapacity.Visible = true;
                }
                //承运业务员
                else if (roleId == 5)
                {
                    //承运单管理
                    liCarriers.Visible = true;
            
                }
                else if (roleId == 6)
                {
                    //系统维护
                    liSystemManage.Visible = true;
                    //成本核算
                    liCost.Visible = true; 
                    //车辆管理
                    liTransportManage.Visible = true;
                    //驾驶员管理
                    liDriver.Visible = true;
                    //运力查询
                    liCapacity.Visible = true;
                    //承运单管理
                    liCarriers.Visible = true;                 
                    //车辆调度
                    liCommand.Visible = true;
                  
                }
            }


        }
    }
}