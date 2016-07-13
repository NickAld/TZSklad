using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

using DBWork;

namespace WebView
{
    public partial class Products : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings[1].ConnectionString;

        string queryAll = "exec GetAllProductsOstatok";

        string queryOnIDSklad = "exec ProductsOstatokOnSklads {0}";

        //DataBinding dbBind = new System.Web.UI.DataBinding()

        static DataTable products;
        
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dsSklad.ConnectionString = connectionString;
                products = GetProducts(false, null);
                ListSklad.DataBound += ListSklad_DataBound;
                
                gvViewProducts.DataSource = products;
                gvViewProducts.DataBind();
            }
            else
            {
                
            }

            
        }

        private void ListSklad_DataBound(object sender, EventArgs e)
        {
            ListSklad.Items.Insert(0, new ListItem("--   Все   --", "0", true));
        }

        protected void rblGroup_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        DataTable GetProducts(bool param, int? index)
        {
            DBWork.DBWorker dbWorker = new DBWorker();

            if (dbWorker.Connect(connectionString))
            {
                try
                {
                    DataTable table = new DataTable();
                    SqlDataAdapter adapter;
                    if (param)
                        adapter = new SqlDataAdapter(dbWorker.GetSelectCommand(String.Format(queryOnIDSklad, index), CommandType.Text));
                    else
                        adapter = new SqlDataAdapter(dbWorker.GetSelectCommand(queryAll, CommandType.Text));
                    adapter.Fill(table);
                    table = Ostatok(table);

                    return table;
                }
                catch (Exception ex)
                {
                    return new DataTable();
                }
            }
            else
                return new DataTable();

        }
        

        protected void ListSklad_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(ListSklad.Items[ListSklad.SelectedIndex].Value);
            if (index == 0)
            {
                products = GetProducts(false, null);
                gvViewProducts.DataSource = products;
                gvViewProducts.DataBind();
            }
            else
            {
                products = GetProducts(true, index);
                if (products != null)
                {
                    gvViewProducts.DataSource = products;
                    gvViewProducts.DataBind();
                }
            }
        }

        DataTable Ostatok(DataTable table)
        {
            table.Columns.Add("Result");
            foreach (DataRow r in table.Rows)
                r["Result"] = Convert.ToInt32(r["sum_in"]) - Convert.ToInt32(r["sum_out"]);

            return table;
        }
    }
}