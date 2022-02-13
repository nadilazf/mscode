using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace Transforman
{
    public class database
    {
        //Variable list
        private static string spname;
        public string SPName
        {
            get { return spname; }
            set { spname = value; }
        }
        private static SqlConnection con;
        private static connection clscon;

        private static List<SqlParameter> parameters = new List<SqlParameter>();

        public database() { new database("", "", "", ""); }

        public database(string DatabaseServer) { new database(DatabaseServer, "", "", ""); }

        public database(string DatabaseServer, string DatabaseCatalog) { new database(DatabaseServer, DatabaseCatalog, "", ""); }

        public database(string DatabaseServer, string DatabaseCatalog, string DatabaseUsername) { new database(DatabaseServer, DatabaseCatalog, DatabaseUsername, ""); }

        public database(string DatabaseServer, string DatabaseCatalog, string DatabaseUsername, string DatabasePassword)
        {
            ClearParameters();

            clscon = new connection();

            if (DatabaseServer != "") clscon.DatabaseServer = DatabaseServer;
            if (DatabaseCatalog != "") clscon.DatabaseCatalog = DatabaseCatalog;
            if (DatabaseUsername != "") clscon.DatabaseUser = DatabaseUsername;
            if (DatabasePassword != "") clscon.DatabasePassword = DatabasePassword;

            con = clscon.OpenConnection();
        }

        public void AddParameters(string ParameterName, SqlDbType ParameterType, object ParameterValue)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = ParameterName;
            param.SqlDbType = ParameterType;
            param.Value = ParameterValue;
            param.Direction = ParameterDirection.Input;

            parameters.Add(param);
        }

        public void ClearParameters()
        {
            parameters.Clear();
            spname = "";
        }

        public DataSet ExecuteSP()
        {
            return ExecuteSP(spname);
        }

        public DataSet ExecuteSP(string SPName)
        {
            DataSet dsData = new DataSet();

            try
            {
                SqlDataAdapter da;
                SqlCommand cmd = con.CreateCommand();

                cmd.CommandText = SPName;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = clscon.DatabaseTimeout;

                foreach (SqlParameter parameter in parameters)
                {
                    SqlParameter parm = new SqlParameter(parameter.ParameterName, parameter.SqlDbType);
                    parm.Value = parameter.Value;
                    parm.Direction = parameter.Direction;
                    cmd.Parameters.Add(parm);

                    //cmd.Parameters.Add(parameter.ParameterName, parameter.SqlDbType).Value = parameter.Value;
                }

                da = new SqlDataAdapter(cmd);
                da.Fill(dsData);
                da.Dispose();
            }
            catch (Exception ex)
            {
                this.Dispose();
               throw new Exception("SP Name: " + SPName + "\n\n" + ex.ToString());
            }

            return dsData;
        }

        public int ExecuteSPtoString()
        {
            int strValue = 0;
            try
            {
                SqlDataAdapter da;
                SqlCommand cmd = con.CreateCommand();

                cmd.CommandText = SPName;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = clscon.DatabaseTimeout;

                foreach (SqlParameter parameter in parameters)
                {
                    SqlParameter parm = new SqlParameter(parameter.ParameterName, parameter.SqlDbType);
                    parm.Value = parameter.Value;
                    parm.Direction = parameter.Direction;
                    cmd.Parameters.Add(parm);
                }
                strValue = (int)cmd.ExecuteScalar();
                con.Close();
            }
            catch(Exception)
            {}
            return strValue;
        }

        public string ExecutetoString()
        {
            string strValue = "";
            try
            {
                SqlDataAdapter da;
                SqlCommand cmd = con.CreateCommand();

                cmd.CommandText = SPName;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = clscon.DatabaseTimeout;

                foreach (SqlParameter parameter in parameters)
                {
                    SqlParameter parm = new SqlParameter(parameter.ParameterName, parameter.SqlDbType);
                    parm.Value = parameter.Value;
                    parm.Direction = parameter.Direction;
                    cmd.Parameters.Add(parm);
                }
                strValue = (string)cmd.ExecuteScalar();
                con.Close();
            }
            catch (Exception)
            { }
            return strValue;
        }



        public DataSet ExecuteQuery(string query)
        {
            DataSet ds = new DataSet();
            clscon = new connection();

            if (con.State == ConnectionState.Closed)
                con = clscon.OpenConnection();

            try
            {
                SqlDataAdapter da;
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;
                cmd.CommandTimeout = clscon.DatabaseTimeout;

                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                da.Dispose();
            }
            catch (Exception ex)
            {
                this.Dispose();
                throw new Exception(ex.ToString());
            }


            return ds;
        }

        //IDisposable Members
        public void Dispose()
        {
            clscon.Dispose();
            con.Close();
            con.Dispose();
        }
        

    }
}
