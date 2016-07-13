using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebView
{
    public partial class Nomenklatura : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings[1].ConnectionString;
        string insertComm = "insert into Nomenklatura (Name) values ('{0}')";
        protected void Page_Load(object sender, EventArgs e)
        {
            dsNomenklatura.ConnectionString = connectionString;
        }

        protected void bAddNom_Click(object sender, EventArgs e)
        {
            dsNomenklatura.InsertCommand = String.Format(insertComm, tbNewName.Text);
            dsNomenklatura.Insert();
        }
    }
}