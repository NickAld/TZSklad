using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebView
{
    public partial class Sklads : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dsSklads.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings[1].ConnectionString;
        }
    }
}