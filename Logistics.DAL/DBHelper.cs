using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//新添加引用
using System.Data;
using System.Data.SqlClient;  //引用sql数据库
using System.Configuration;

namespace Logistics.DAL
{
    
    public class DBHelper 
    {
        // 添加一个指定对象
        // static string strconn = "Data Source =.; Initial Catalog = Logistics; Integrated Security = True";//添加静态static
        public static string strconn = System.Configuration.ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
        /// <summary>
        /// 定义一个存储过程的方法
        /// </summary>
        /// <param name="conn">链接数据库</param>
        /// <param name="Proc">存储过程</param>
        /// <param name="sp"></param>
        /// <returns></returns>
        public static SqlCommand getSqlCommand(SqlConnection conn, string Proc, SqlParameter[] sp = null)
        {

            //判断是否关闭 如果关闭就打开
            if (conn.State.Equals(ConnectionState.Closed))
            {
                conn.Open();
            }
            //执行命令（操作语句）

            SqlCommand comm = new SqlCommand();

            //执行存储过程的名称
            comm.CommandText = Proc;
            //执行存储过程的类型
            comm.CommandType = CommandType.StoredProcedure;
            comm.Connection = conn;
            //链接的东西都在SqlCommand中，用SqlDataAdapter来贮存数据的

            if (sp != null)
            {
                comm.Parameters.AddRange(sp);
            }
            return comm;
        }

        /// <summary>
        /// 获取用户信息 
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static  DataSet getdataset(string sql,SqlParameter [] sp=null)   // public void getdataset()
        {
            //DataSet （相当于一个缓存）

            //链接数据库
            SqlConnection conn =new SqlConnection(strconn);//实例化对象  创建一个实体，                                                           //string sql = "select * from [user]"; 拿出来放最外边调用
           //创建一个方式
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);//数据的适配器  取数据   
              //da.SelectCommand.Parameters.AddRange();
              //声明DataSet接受数据
            if (sp != null)

            {
                da.SelectCommand.Parameters.AddRange(sp);
            }
            DataSet ds = new DataSet();//数据集     --创建一个载体 
            da.Fill(ds);//填充
            
            return ds;//添加返回值    
        }
        /// <summary>
        /// 获取表中信息
        /// </summary>
        /// <param name="Proc">存储过程语句</param>
        /// <param name="sp"></param>
        /// <returns></returns>
        public static DataTable getTableProc(string Proc,SqlParameter[] sp = null)
        {
            SqlConnection conn = new SqlConnection(strconn);
            //判断是否关闭 如果关闭就打开
            //if (conn.State.Equals(ConnectionState.Closed))
            //{
            //    conn.Open();
            //}
            // //执行命令（操作语句）

            // SqlCommand comm = new SqlCommand();

            ////执行存储过程的名称
            // comm.CommandText = Proc;
            // //执行存储过程的类型
            // comm.CommandType = CommandType.StoredProcedure;
            // comm.Connection = conn;
            // //链接的东西都在SqlCommand中，用SqlDataAdapter来贮存数据的

            SqlCommand comm= getSqlCommand(conn,Proc,sp);
            SqlDataAdapter da = new SqlDataAdapter();
           
            da.SelectCommand = comm;

            //定义一个DataTablel来接收
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        /// <summary>
        /// 获取返回结果的第一行第一列
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static object ExecuteScalar( string sql, SqlParameter [] sp =null) {    
            //实现登陆
            SqlConnection conn = new SqlConnection(strconn);//链接数据库
            SqlCommand Com = new SqlCommand(sql, conn);//跟大的车
            //Com.CommandText = sql;
            //Com.Connection=conn

            Com.Parameters.AddRange(sp);
            object result="0";
            try {
                //打开数据库
                conn.Open();
                //获得第一行第一列
                result = Com.ExecuteScalar();
            }
            catch (Exception ex)
            {
                //报错后处理的代码
                throw ex;
            }        
           conn.Close();
            return result;
               
        }

        /// <summary>
        /// 通过存储过程获取返回结果的第一行第一列
        /// </summary>
        /// <param name="Proc"></param>
        /// <param name="sp"></param>
        /// <returns></returns>

        public static object getCommExecuteScalar(string Proc, SqlParameter[] sp = null)
        {
            //实现登陆
            SqlConnection conn = new SqlConnection(strconn);//链接数据库
          // SqlCommand Com = new SqlCommand(sql, conn);//跟大的车
            //Com.CommandText = sql;
            //Com.Connection=conn
             SqlCommand comm =getSqlCommand(conn,Proc,sp);
            //Com.Parameters.AddRange(sp);
            object result = "0";
            try
            {
                //打开数据库
                // conn.Open();
                //获得第一行第一列
                result = comm.ExecuteScalar();
            }
            //SqlException当数据库发生警告的时引发异常
            catch (System.Data.SqlClient.SqlException ex)
            {
                //报错x`后处理的代码
                throw ex;
            }
            finally
            {

                conn.Close();
            }
   
           //conn.Close();
            return result;

        }

        /// <summary>
        /// 返回受影响的行数  
        /// </summary>
        /// <param name="sql">增删改</param>
        /// <returns></returns>
        public static int ExecuteNonQuery(string sql, SqlParameter [] sp=null)
        {

            SqlConnection conn = new SqlConnection(strconn);//链接数据库
            SqlCommand Com = new SqlCommand(sql, conn);//大的车
            //获取返回结果的第一行第一列
            Com.Parameters.AddRange(sp);
            int result;
            try
            {
                //打开数据库
                conn.Open();
                //获得第一行第一列
                result = Com.ExecuteNonQuery();
            }
            catch {
                throw;
            }
                             
            conn.Close();
            return result;

        }
        /// <summary>
        /// 通过存储过程获取受影响的行数
        /// </summary>
        /// <param name="Proc">存储过程执行的方法</param>
        /// <param name="sp"></param>
        /// <returns></returns>
        public static int getCommExecuteNonQuery(string Proc, SqlParameter[] sp = null)
        {

            SqlConnection conn = new SqlConnection(strconn);//链接数据库
            // SqlCommand Com = new SqlCommand(sql, conn);//大的车
            SqlCommand comm = getSqlCommand(conn, Proc, sp);

            //获取返回结果的第一行第一列
            //Com.Parameters.AddRange(sp);
            int result;
            try
            {
                //打开数据库
               // conn.Open();
                //获得第一行第一列
                result = comm.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            
            return result;

        }

    }


}