using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;


namespace WebView
{
    public partial class ProductsOut : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings[1].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void bAddNomOut_Click(object sender, EventArgs e)
        {
            SqlCommand comm = new SqlCommand("proc_MaterialsOut");
            comm.Connection = new SqlConnection(connectionString);

            comm.Connection.Open();

            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@idSkald", SqlDbType.Int);
            comm.Parameters["@idSkald"].Value = ddlListSklad.SelectedValue;
            comm.Parameters.Add("@idNomenklatura", SqlDbType.Int);
            comm.Parameters["@idNomenklatura"].Value = ddlListNom.SelectedValue;
            comm.Parameters.Add("@idMOL", SqlDbType.Int);
            comm.Parameters["@idMOL"].Value = ddlMOL.SelectedValue;
            comm.Parameters.Add("@DateIn", SqlDbType.NVarChar);
            comm.Parameters["@DateIn"].Value = calendar.SelectedDate.ToString("dd-MM-yyyy");
            comm.Parameters.Add("@CountIn", SqlDbType.Int);
            comm.Parameters["@CountIn"].Value = tbCount.Text;

            if (comm.ExecuteNonQuery()>0)
            {
                tbResultAdd.Text="Выдача оформлена успешно!";
            }
            else
                tbResultAdd.Text = "Выдача товара не формлена!";



        }
    }
}