using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

namespace Transforman
{
    public class connection
    {
        //variable list
        private static SqlConnection conn;
        private static string strCon = "";

        private static bool trusted_connection;
        public bool TrustedConnection
        {
            get { return trusted_connection; }
            set { trusted_connection = value; }
        }

        private static string database_server;
        public string DatabaseServer
        {
            get { return database_server; }
            set { database_server = value; }
        }

        private static string database_catalog;
        public string DatabaseCatalog
        {
            get { return database_catalog; }
            set { database_catalog = value; }
        }

        private static string database_user;
        public string DatabaseUser
        {
            get { return database_user; }
            set { database_user = value; }
        }

        private static string database_password;
        public string DatabasePassword
        {
            get { return database_password; }
            set { database_password = value; }
        }

        private static int database_timeout;
        public int DatabaseTimeout
        {
            get { return database_timeout; }
            set { database_timeout = value; }
        }
        

        public connection()
        {
            trusted_connection = bool.Parse(ConfigurationSettings.AppSettings["trusted_connection"]);
            database_server = ConfigurationSettings.AppSettings["database_server"];
            database_catalog = ConfigurationSettings.AppSettings["database_catalog"];
            database_user = ConfigurationSettings.AppSettings["database_user"];
            database_password = ConfigurationSettings.AppSettings["database_password"];
            database_timeout = Int16.Parse(ConfigurationSettings.AppSettings["database_timeout"]);
        }

        public string GetConnectionString()
        {
            string strTimeOut = "; Connection Timeout=" + database_timeout.ToString();

            if (trusted_connection)
                strCon = "Data Source=" + database_server + ";Initial Catalog=" + database_catalog + ";Integrated Security=SSPI;";
            else
                strCon = "User ID=" + database_user + ";Password=" + database_password + ";Initial Catalog=" + database_catalog + ";Data Source=" + database_server; //+strTimeOut;

            return strCon;
        }

        public SqlConnection OpenConnection()
        {
            GetConnectionString();

            conn = new SqlConnection(strCon);

            if (conn.State == System.Data.ConnectionState.Closed) conn.Open();

            return conn;
        }

        //IDisposable Members
        public void Dispose()
        {
            conn.Close();
            conn.Dispose();
        }
        
    }
}
