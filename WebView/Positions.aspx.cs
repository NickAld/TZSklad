using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebView
{
    public partial class Positions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dsPosition.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings[1].ConnectionString;
        }
    }
}