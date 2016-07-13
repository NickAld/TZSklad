using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace DBWork
{
    public partial class DBWorker
    {
        //string connectionString = "Data Source=.\\SQLEXPRESS; User Id=sa; Password=bnm; Initial Catalog=TEST;Integrated Security=SSPI";

        

        public SqlConnection conn;

        public bool Connect(string strConnect)
        {
            conn = new SqlConnection(strConnect);

            try
            {
                conn.Open();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public SqlConnection dbConnect
        {
            get { return conn; }
        }

        public SqlCommand GetSelectCommand(string command, CommandType type)
        {
            SqlCommand adapter = new SqlCommand(command, conn);
            return adapter;
        }
    }
}
