using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Logistics.Carriers
{
    public partial class AddCarriers : System.Web.UI.Page
    {
        BLL.SysLog SysLogBLL = new BLL.SysLog();
        BLL.Carriers CarriersBll = new BLL.Carriers();
        BLL.Goods GoodsBLL = new BLL.Goods();
        Model.Carriers CarriersModel = new Model.Carriers();
        Model.SysLog SysLogModel = new Model.SysLog();
        Model.Goods goodsModel = new Model.Goods();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //判断传过来值没  
            if (Request.QueryString["Carriersid"] != null)
            {
                lbCarriers.Text = "修改承运单";
               
              
                if (!IsPostBack)
                {
                    int id = int.Parse(Request.QueryString["Carriersid"].ToString());
                    //通过id获取承运单显示到页面中
                    getCarriersList(id);
                    //显示修改按钮
                    btnupdeCarriers.Visible = true;
                    //隐藏货物按钮
                    goods.Visible = false;
                    
                }
            }
            //修改
            else
            {
                lbCarriers.Text = "添加承运单";    
                       
                btnAddCarriers.Visible = true;
                goods.Visible = false;
            }
        }
        /// <summary>
        /// 显示到页面中的值
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public DataTable getCarriersList(int id)
        {

            DataTable dt = CarriersBll.getCarriersCarriersID(id);
            if (dt.Rows.Count > 0)
            {
                DataRow rows = dt.Rows[0];
                //发货单位
                txtSendCompany.Text = rows["SendCompany"].ToString();
                //发货地址
                txtSendAddress.Text = rows["SendAddress"].ToString();
                //收货单位
                txtReceiveCompany.Text = rows["ReceiveCompany"].ToString();
                txtFK_ReceiveAddress.Text = rows["FK_ReceiveAddress"].ToString();
                txtSendLinkman.Text = rows["SendLinkman"].ToString();
                txtReceiveLinkman.Text = rows["ReceiveLinkman"].ToString();
                txtSendPhone.Text = rows["SendPhone"].ToString();
                txtReceivePhone.Text = rows["ReceivePhone"].ToString();
                txtInsuranceCost.Text = rows["InsuranceCost"].ToString();
                txtTransportCost.Text = rows["TransportCost"].ToString();
                txtOtherCost.Text = rows["OtherCost"].ToString();
               



            }
            return dt;
        }


        //修改承运单
        protected void btnupdeCarriers_Click(object sender, EventArgs e)
        {
            int Userid = int.Parse(Session["SessionID"].ToString());
            BLL.User UserBll = new BLL.User();           
            //获取页面的值          
            CarriersModel.SendCompany = txtSendCompany.Text;
            CarriersModel.SendAddress = txtSendAddress.Text;
            CarriersModel.ReceiveCompany = txtReceiveCompany.Text;
            CarriersModel.FK_ReceiveAddress = txtFK_ReceiveAddress.Text;
            CarriersModel.SendLinkman = txtSendLinkman.Text;
            CarriersModel.ReceiveLinkman = txtReceiveLinkman.Text;
            CarriersModel.SendPhone = txtSendPhone.Text;
            CarriersModel.ReceivePhone = txtReceivePhone.Text;
            CarriersModel.InsuranceCost = float.Parse(txtInsuranceCost.Text);
            CarriersModel.TransportCost = float.Parse(txtTransportCost.Text);
            CarriersModel.OtherCost = float.Parse(txtOtherCost.Text);
            CarriersModel.CarriersID = int.Parse(Request.QueryString["Carriersid"].ToString());

            //添加操作行为
            SysLogModel.Behavior =Model.User.CurrentUser.UserName+ ":修改承运单：" + txtSendCompany.Text;
            //获得行为类型
            SysLogModel.Fk_TypeID = 16;
            //获取用户ID
            SysLogModel.FK_UserID = Userid;
            //SysLogModel.FK_UserID =int.Parse( Session["SessionID"].ToString());
            //存储过程名
            SysLogModel.Parameters = Userid + ",";
            //存储过程名
            SysLogModel.ProcName = "P_Carriers_updateCarriers";
            //获取客户端的Ip地址
            SysLogModel.IP = Request.UserHostAddress;
            //
            SysLogModel.Exception = "";
            int result = CarriersBll.updateCarriers(CarriersModel);
            if (result > 0)
            {     
                //0：正常 1：异常
               
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功');</script>");
                SysLogModel.IsException = 0;
                //向数据库添加系统日志操作
               
            }
            else
            {
                //0：正常 1：异常
               
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改失败');</script>");
                SysLogModel.IsException = 1;
             
            }

            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);

        }
       
        //添加承运单
        protected void btnAddCarriers_Click(object sender, EventArgs e)
        {
            //获得用户id   
           
            int Userid = int.Parse(Session["SessionID"].ToString());          
            CarriersModel.FK_UserID = Userid;
            CarriersModel.SendCompany = txtSendCompany.Text;
            CarriersModel.SendAddress = txtSendAddress.Text;
            CarriersModel.ReceiveCompany = txtReceiveCompany.Text;
            CarriersModel.FK_ReceiveAddress = txtFK_ReceiveAddress.Text;
            CarriersModel.SendLinkman = txtSendLinkman.Text;
            CarriersModel.ReceiveLinkman = txtReceiveLinkman.Text;
            CarriersModel.SendPhone = txtSendPhone.Text;
            CarriersModel.ReceivePhone = txtReceivePhone.Text;
            CarriersModel.InsuranceCost = float.Parse(txtInsuranceCost.Text);
            CarriersModel.TransportCost = float.Parse(txtTransportCost.Text);
            CarriersModel.OtherCost = float.Parse(txtOtherCost.Text);

            //添加操作行为
            SysLogModel.Behavior = Model.User.CurrentUser.UserName + ":添加承运单：" + txtSendCompany.Text;
            //获得行为类型
            SysLogModel.Fk_TypeID = 14;
            //获取用户ID
            SysLogModel.FK_UserID = Userid;      
            //存储过程名
            SysLogModel.Parameters = Userid + ",";
            //存储过程名
            SysLogModel.ProcName = " P_Carriers_AddtCarriers_CarriersID";
            //获取客户端的Ip地址
            SysLogModel.IP = HttpContext.Current.Request.UserHostAddress; 
            //
            SysLogModel.Exception = "";


            int result = CarriersBll.AddCarriers(CarriersModel);
            if (result > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加承运单成功');</script>");
                //0：正常 1：异常
                SysLogModel.IsException = 0;
                goods.Visible = true;
                Carriers.Visible = false;
                //获取承运单id
                carrnum.Text = CarriersModel.CarriersID.ToString();
                lbCarriers.Text = "添加货物";
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加承运单失败');</script>");               
                //0：正常 1：异常
                SysLogModel.IsException = 1;
              
            }

            //向数据库添加系统日志操作
            int addSysLog = SysLogBLL.AddAllSysLog(SysLogModel);           
        }

        //添加货物   
        protected void ADDgoods_Click(object sender, EventArgs e)
        {
            goodsModel.FK_CarriersID = int.Parse(this.carrnum.Text);

            goodsModel.GoodsName = this.goodsname.Text;
            goodsModel.Amount = int.Parse(this.goodscount.Text);
            goodsModel.Weight = float.Parse(this.goodsweight.Text);
            goodsModel.Volume = float.Parse(this.goodsti.Text);
            goodsModel.IsDelete = byte.Parse(this.del.Text);
            int result = GoodsBLL.addGoods(goodsModel);
            if (result > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功');</script>");
                Carriers.Visible = true;
                //carrnum.Text = this.carrnum.Text;
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功');</script>");

            }
        }
    }
  }