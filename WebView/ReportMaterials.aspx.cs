using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;

using Microsoft.Reporting.WebForms;
using Microsoft.Reporting;

namespace WebView
{
    public partial class ReportMeterials : System.Web.UI.Page
    {
        //TEST2DataSet dsTEST2DataSet = new TEST2DataSet();
        //DataTable dtMetIn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //odsIn.TypeName = typeof(GetMaterials).FullName;
                //odsIn.DataObjectTypeName = typeof(DataTable).FullName;
                //odsIn.SelectMethod = "GetMaterials_In";
                //odsIn.DataBind();

                //odsOut.TypeName = typeof(GetMaterials).FullName;
                //odsOut.DataObjectTypeName = typeof(DataTable).FullName;
                //odsOut.SelectMethod = "GetMaterials_Out";
                //odsOut.DataBind();

                odsIn.TypeName = typeof(SourceGetting.getSklad).FullName;
                odsIn.DataObjectTypeName = typeof(DataTable).FullName;
                odsIn.SelectMethod = "GetMaterials_In";
                odsIn.DataBind();

                odsOut.TypeName = typeof(SourceGetting.getSklad).FullName;
                odsOut.DataObjectTypeName = typeof(DataTable).FullName;
                odsOut.SelectMethod = "GetMaterials_Out";
                odsOut.DataBind();

                odsSklad.TypeName = typeof(SourceGetting.getSklad).FullName;
                odsSklad.DataObjectTypeName = typeof(DataTable).FullName;
                odsSklad.SelectMethod = "GetSklad";
                odsSklad.DataBind();
            }
        }
    }
}