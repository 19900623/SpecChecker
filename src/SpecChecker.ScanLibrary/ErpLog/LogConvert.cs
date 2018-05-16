using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClownFish.Base;
using ClownFish.Log.Model;

namespace SpecChecker.ScanLibrary.ErpLog
{
	internal static class LogConvert
	{
		public static string GetString(this DataRow row, string name)
		{
			object value = row[name];
			if( value == null || value == DBNull.Value )
				return null;

			return value.ToString();
		}
		public static void LoadBaseInfo(DataRow row, BaseInfo info)
		{
			info.InfoGuid = (Guid)row["InfoGuid"];
			info.Time = (DateTime)row["Time"];
			info.Message = row.GetString("MessageInfo");
			info.HostName = row.GetString("HostName");
		}

		public static HttpInfo LoadHttpInfo(DataRow row)
		{
            string url = row.GetString("Url");
            if( string.IsNullOrEmpty(url) )
                return null;

            HttpInfo httpInfo = new HttpInfo();
			httpInfo.UserName = row.GetString("UserName");
			httpInfo.RequestText = row.GetString("RequestText");
			httpInfo.Url = url;
			httpInfo.RawUrl = row.GetString("RawUrl");
			httpInfo.Browser = row.GetString("Browser");
			httpInfo.Session = row.GetString("Session");
			return httpInfo;
		}


		public static SqlInfo LoadSqlInfo(DataRow row)
		{
			string sql = row.GetString("SqlText");
			if( string.IsNullOrEmpty(sql) )
				return null;

			SqlInfo info = new SqlInfo();
			info.SqlText = sql;
			info.InTranscation = (row.GetString("InTranscation") ?? "0") == "1";

			string args = row.GetString("Parameters");
			if( string.IsNullOrEmpty(args) == false ) {
				info.Parameters = args.FromJson<List<NameValue>>();
			}

			return info;
		}

		public static BusinessInfo LoadBusinessInfo(DataRow row)
		{
			BusinessInfo info = new BusinessInfo();
			info.Key1 = row.GetString("BusinessInfoKey1");
			info.Key2 = row.GetString("BusinessInfoKey2");
			info.Key3 = row.GetString("BusinessInfoKey3");
			info.Key4 = row.GetString("BusinessInfoKey4");
			info.Key5 = row.GetString("BusinessInfoKey5");

			if( info.Key1 == null
				&& info.Key2 == null
				&& info.Key3 == null
				&& info.Key4 == null
				&& info.Key5 == null )
				return null;

			return info;
		}
	}
}
