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
                odsIn.TypeName = typeof(GetMaterials).FullName;
                odsIn.DataObjectTypeName = typeof(DataTable).FullName;
                odsIn.SelectMethod = "GetMaterials_In";
                

                //dtMetIn = dsTEST2DataSet.Tables["Materials_In"];
                //var repDS = new ReportDataSource("MyDataSet", ds.Tables["Materials_In"]);
                //ReportViewer1.LocalReport.DataSources.Add(repDS);
                //ReportViewer1.LocalReport.Refresh();


                //ReportViewer1.LocalReport.DataSources.Where(x=>x.)

            }
        }
    }
}