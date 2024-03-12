using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Access
{
    public class BdAccess
    {  //they are inaccesible but I access by methods
        private SqlConnection Connection;
        private SqlCommand Command;
        // reader is private but return with reader
        private SqlDataReader Reader;

        public SqlDataReader reader
        {
            get { return Reader; }
        }


        //constructor with default bd declaration 
        public BdAccess()
        { 
            Connection = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            Command = new SqlCommand();

        }

        //methods of basic things like reading,writing,deleting etc

        public void setConsultation(string consult)
        {
            Command.CommandType = System.Data.CommandType.Text;
            Command.CommandText = consult;
        }

        public void executeRead()
        {
            Command.Connection = Connection;
            try
            {
                Connection.Open();
                Reader = Command.ExecuteReader();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void executeAccion()
        {
            Command.Connection = Connection;
            try
            {
                Connection.Open();
                Command.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public void setParameter(string name, object value)
        {
            Command.Parameters.AddWithValue(name, value);
        }
        public int executeScalar()
        {
            Command.Connection = Connection;
            try
            {
                Connection.Open();
                return int.Parse(Command.ExecuteScalar().ToString());

            }
            catch (Exception ex )
            {

                throw ex;
            }finally
            {
                close();
            }
        }
        public void close()
        {

            if (reader != null)
                Reader.Close();
            Connection.Close();
        }

    }
}
