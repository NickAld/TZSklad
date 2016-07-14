using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel;

namespace WebView.SourceGetting
{
    public class getSklad
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataTable GetMaterials_In()
        {
            dsSklad.Materials_InDataTable table = new dsSklad.Materials_InDataTable();
            dsSkladTableAdapters.Materials_InTableAdapter adapter = new dsSkladTableAdapters.Materials_InTableAdapter();
            try
            {
                adapter.Fill(table);
            }
            catch { }
            return table;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataTable GetMaterials_Out()
        {
            dsSklad.Materials_OutDataTable table = new dsSklad.Materials_OutDataTable();
            dsSkladTableAdapters.Materials_OutTableAdapter adapter = new dsSkladTableAdapters.Materials_OutTableAdapter();
            try
            {
                adapter.Fill(table);
            }
            catch { }
            return table;
        }
        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataTable GetSklad()
        {
            dsSklad.SkladDataTable table = new dsSklad.SkladDataTable();
            dsSkladTableAdapters.SkladTableAdapter adapter = new dsSkladTableAdapters.SkladTableAdapter();
            try
            {
                adapter.Fill(table);
            }
            catch { }
            return table;
        }
    }
}