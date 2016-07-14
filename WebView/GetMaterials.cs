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
        TEST2DataSet ds = new TEST2DataSet();

        //[DataObjectMethod(DataObjectMethodType.Select)]
        //public DataTable GetMaterials_In(int maximumRows, int startRowIndex, string sort)
        //{
        //    return ds.Tables["Materials_In"];
        //}

        //[DataObjectMethod(DataObjectMethodType.Select)]
        public DataTable GetMaterials_In()
        {
            //ds.GetChanges();
            //var reader = ds.Materials_In.CreateDataReader();
            //ds.Materials_In.Load(reader);
            
            TEST2DataSet.Materials_InDataTable table = new TEST2DataSet.Materials_InDataTable();
            var reader = new DataTableReader(ds.Materials_In);
            table.Load(reader);
            table.CopyToDataTable();
            return table.CopyToDataTable();


        }

    }
}