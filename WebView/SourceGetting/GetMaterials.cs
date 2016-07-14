using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebView
{
    public class GetMaterials
    {
        

        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataTable GetMaterials_In()
        {
            TEST2DataSet.Materials_InDataTable table = new TEST2DataSet.Materials_InDataTable();
            TEST2DataSetTableAdapters.Materials_InTableAdapter adapter = new TEST2DataSetTableAdapters.Materials_InTableAdapter();
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
            TEST2DataSet2.Materials_OutDataTable table = new TEST2DataSet2.Materials_OutDataTable();
            TEST2DataSet2TableAdapters.Materials_OutTableAdapter adapter = new TEST2DataSet2TableAdapters.Materials_OutTableAdapter();
            try
            {
                adapter.Fill(table);
            }
            catch { }
            return table;
        }
    }
}