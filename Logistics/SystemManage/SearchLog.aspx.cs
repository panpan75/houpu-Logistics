using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Logistics.SystemManage
{
    public partial class SearchLog : System.Web.UI.Page
    {
        BLL.SearchLog SearchLogBll = new BLL.SearchLog();
        BLL.SysLog SysLogBll = new BLL.SysLog();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bingSysLog();
                bingFk_TypeID();
            }
        }
        /// <summary>
        /// 查询日志
        /// </summary>
        /// <returns></returns>
        public DataTable bingSysLog()
        {
            //DataTable dt;
            //dt = SearchLogBll.bingSearchLog();
            //rpSysLog.DataSource = dt;
            //rpSysLog.DataBind();
            //return dt;

            int RecordCount;
            DataTable ds = new DataTable();
            ds = SearchLogBll.getLog(AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, "SysLog", "LogID", "", out RecordCount);
            AspNetPager1.RecordCount = RecordCount;
            rpSysLog.DataSource = ds;
            rpSysLog.DataBind();
            return ds;
        }
        /// <summary>
        /// 检测
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Pager(GridView dl, Wuqi.Webdiyer.AspNetPager anp, System.Data.DataTable dst)
        {
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dst.DefaultView;
            pds.AllowPaging = true;
            anp.RecordCount = dst.DefaultView.Count;
            pds.CurrentPageIndex = anp.CurrentPageIndex - 1;
            pds.PageSize = anp.PageSize;
            dl.DataSource = pds;
            dl.DataBind();
        }

        //当选择页数变化时重新绑定数据
        protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
        {
            AspNetPager1.CurrentPageIndex = e.NewPageIndex;
            bingSysLog();
        }

        /// <summary>
        ///绑定行为类型
        /// </summary>
        public void bingFk_TypeID()
        {
            DataTable dt;
            dt = SysLogBll.bingType();
            ddlFk_TypeID.DataSource = dt;
            ddlFk_TypeID.DataTextField = "TypeName";
            ddlFk_TypeID.DataValueField = "TypeID";
            ddlFk_TypeID.DataBind();
            ddlFk_TypeID.Items.Insert(0, new ListItem("不限", "-1"));
        }

    }
}