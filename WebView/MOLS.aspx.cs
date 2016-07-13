using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace WebView
{
    public partial class MOLS : System.Web.UI.Page
    {
        const string queryMOL = "exec GetAllMOL {0}";
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings[1].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dsSklad.ConnectionString = connectionString;
                dsUserList.ConnectionString = connectionString;

                string newQuery = String.Format(queryMOL, 0);
                dsMOL.SelectCommand = newQuery;

                DropDownList1.DataTextField = "Name";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataBound += new EventHandler(DropDownList1_DataBound);

                if (DropDownList1 != null)
                    if (ViewState["DropList"] != null)
                        DropDownList1 = (DropDownList)ViewState["DropList"];
            }
                dsMOL.ConnectionString = connectionString;
                dsUserList.ConnectionString = connectionString;
                dsSklad.ConnectionString = connectionString;

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string newQuery = String.Format(queryMOL, DropDownList1.Items[DropDownList1.SelectedIndex].Value);
            dsMOL.SelectCommand = newQuery;
        }
 
        void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem("--   Все   --", "0", true));
            //ViewState["DropList"] = DropDownList1;
        }

        protected void bAddMOL_Click(object sender, EventArgs e)
        {
            ItemsVisible(true);

            //ListSklad.DataSource = dsSklad;
            //ListSklad.DataTextField = "Name";
            //ListSklad.DataValueField = "id";
        }

        protected void bSaveNewMOL_Click(object sender, EventArgs e)
        {
            ItemsVisible(false);
            if (calStart.SelectedDate>calEnd.SelectedDate)
            {
                
            }
            else
            {

            }
            int idUser = Convert.ToInt32(ListUsers.Items[ListUsers.SelectedIndex].Value);
            int idSklad = Convert.ToInt32(ListSklad.Items[ListSklad.SelectedIndex].Value);
            string dStart = calStart.SelectedDate.ToString("dd-MM-yyyy");
            string dEnd = calEnd.SelectedDate.ToString("dd-MM-yyyy");

            string queryTemplate = "insert into MOL (idUser, idSklad, dateStart, dateEnd) values ({0},{1},'{2}','{3}')";
            string queryInsert = String.Format(queryTemplate, idUser,idSklad,dStart,dEnd);

            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();
                SqlCommand comm = new SqlCommand(queryInsert, conn);
                comm.CommandType = CommandType.Text;
                comm.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }


        }

        void ItemsVisible(bool state)
        {
            labelSelectUser.Visible = state;
            ListUsers.Visible = state;
            labelSelectSklad.Visible = state;
            ListSklad.Visible = state;
            labelCalStart.Visible = state;
            calStart.Visible = state;
            labelCalEnd.Visible = state;
            calEnd.Visible = state;
            bSaveNewMOL.Visible = state;
        }

        protected void ListSklad_SelectedIndexChanged(object sender, EventArgs e)
        {
            string scriptTemplate = "select u.id 'uUserID', CONCAT(u.FirstName, u.LastName, u.MiddleName) 'UserFIO' ";
            scriptTemplate += "from users u left outer join MOL m ";
            scriptTemplate += "on(u.id = m.idUser) where(m.idSklad is null or m.idSklad != {0})";

            string sql = String.Format(scriptTemplate, (ListSklad.Items[ListSklad.SelectedIndex].Value));
            ListUsers.Items.Clear();
            dsUserList.ConnectionString = connectionString;
            dsUserList.SelectCommand = sql;
            ListUsers.DataSourceID = dsUserList.ID;

        }
    }
    
}