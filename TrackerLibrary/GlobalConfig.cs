using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrackerLibrary.DataAccess;

namespace TrackerLibrary {
    public static class GlobalConfig {

        public static IDataConnection Connection { get; private set; }

        public static void InitializeConnections(DatabaseType db) {

            switch(db) {
                case DatabaseType.Sql:
                    SqlConnection sql = new SqlConnection();
                    Connection = sql;
                    break;
                case DatabaseType.TextFile:
                    TextConnection text = new TextConnection();
                    Connection = text;
                    break;
                default:
                    break;
            }
        }

        public static string CnnString(string name) {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }
    }
}
