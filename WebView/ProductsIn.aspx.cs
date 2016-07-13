using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebView
{
    public partial class ProductsIn : System.Web.UI.Page
    {
        string connectionString;
        string insertCommMatIn = "insert into Materials_In (idNomenklatura,idSklad, DateIn, CountIn) values ({0},{1},'{2}',{3})";
        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings[1].ConnectionString;
            dsNom.ConnectionString = connectionString;
            dsSklad.ConnectionString = connectionString;
            dsMatIn.ConnectionString = connectionString;
        }

        protected void bAddNom_Click(object sender, EventArgs e)
        {
            int idNom = Convert.ToInt32(ddlListNom.Items[ddlListNom.SelectedIndex].Value);
            int idSklad = Convert.ToInt32(ddlListSklad.Items[ddlListSklad.SelectedIndex].Value);
            string dateIn = calendar.SelectedDate.ToString("dd-MM-yyyy");
            int countIn = Convert.ToInt32(tbCount.Text);

            dsNom.InsertCommand = String.Format(insertCommMatIn, idNom, idSklad, dateIn, countIn);
            dsNom.Insert();

        }
    }
}