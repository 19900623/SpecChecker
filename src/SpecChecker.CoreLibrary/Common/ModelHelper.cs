using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClownFish.Base;
using ClownFish.Log.Model;
using SpecChecker.CoreLibrary.Config;
using SpecChecker.CoreLibrary.Models;

namespace SpecChecker.CoreLibrary.Common
{
	public static class ModelHelper
	{
		public static string GetUrl(this ExceptionInfo exceptionInfo)
		{
			if( exceptionInfo.HttpInfo != null )
				return exceptionInfo.HttpInfo.Url;

			return string.Empty;
		}

		public static string GetUrl(this PerformanceInfo performanceInfo)
		{
			if( performanceInfo.HttpInfo != null )
				return performanceInfo.HttpInfo.Url;

			return string.Empty;
		}


		public static List<T> ExecExcludeIgnoreRules<T>(this List<T> list, BranchSettings branch) where T : BaseScanResult
        {
            if( string.IsNullOrEmpty(branch.IgnoreRules) == false ) {
                // 存在排除规则
                string[] rules = branch.IgnoreRules.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                return (from x in list
                        where rules.FirstOrDefault(r => r == x.RuleCode) == null
                        select x
                            ).ToList();
            }

            return list;
        }


        public static string GetSqlScript(this SqlInfo sqlinfo)
        {
            if( sqlinfo == null || string.IsNullOrEmpty(sqlinfo.SqlText) )
                return string.Empty;

            StringBuilder sb = new StringBuilder();

            if( sqlinfo.Parameters != null ) {
                foreach( NameValue nv in sqlinfo.Parameters ) {
                    // 由于日志中没有记录参数的类型，所以这里只能申明为字符串类型，让SQLSERVER自动转换
                    sb.Append($"declare {nv.Name} as nvarchar(max);\r\n");
                    sb.Append($"set {nv.Name} = '{nv.Value}';\r\n\r\n");
                }
                sb.AppendLine("\r\n");
            }
            sb.Append(sqlinfo.SqlText);
            return sb.ToString();
        }
    }
}
