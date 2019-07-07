using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Web;//引用
namespace Logistics.BLL
{
   public  class CaCheHelper
    {
        /// <summary>
        /// 添加缓存
        /// </summary>
        /// <param name="key">缓存键</param>
        /// <param name="values">缓存的值</param>
        /// <param name="absolute">缓存时间</param>
        public static void insertCache(string key,object values,DateTime absolute)
        {
            HttpRuntime.Cache.Insert(key, values,null, absolute, System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.NotRemovable,null);
        }
        /// <summary>
        /// 获取
        /// </summary>
        /// <param name="key">缓存键</param>
        public static object GedCache(string key)
        {
           return HttpRuntime.Cache.Get(key);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="key">缓存键</param>
        public static void DelCache(string key)
        {
            HttpRuntime.Cache.Remove(key);
        }
    }
}
