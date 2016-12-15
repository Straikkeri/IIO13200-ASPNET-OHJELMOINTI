using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace JAMK.IT
{
    public static class DBDemoxOy
    {
        public static DataTable HaeEsiluodustaDatatablesta()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("astunnus", typeof(string));
            dt.Columns.Add("asnimi", typeof(string));
            dt.Rows.Add("VV1", "Ville Vallaton");
            dt.Rows.Add("JJ1", "Jaska Jokunen");

            return dt;
        }
        public static DataTable HaeKannasta()
        {
            try
            {
                string sql = "";
                sql = "SELECT astunnus, asnimi, yhteyshlo, postitmp FROM asiakas"; // WHERE asioid='salesa'";
                string connStr = @"Data source=twelve.labranet.jamk.fi;initial catalog=DemoxOy;user=koodari;password=koodari16";

                using (SqlConnection conn = new SqlConnection(connStr)){
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        da.Fill(ds, "asiakas");
                        return ds.Tables["asiakas"];
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}