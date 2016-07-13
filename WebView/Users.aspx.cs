using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebView.Models;

namespace WebView
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dsUsers.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings[1].ConnectionString;
            //dsUsers.UpdateCommand = "update users where id=@";
        }

        
    }
}