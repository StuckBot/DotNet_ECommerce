using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections;

namespace TheStore.resources
{
    /// <summary>
    /// Summary description for ReadOnlyService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ReadOnlyService : System.Web.Services.WebService
    {

        [WebMethod]
        public OUT OutOfStock()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Select Product_Id from tblProducts where Product_Qty = 0", con);
                OUT O = new OUT();
                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        O.result = O.result+"$"+(Convert.ToString(rdr["Product_Id"]));
                    }
                }
                return O;
            }
        }
        [WebMethod(EnableSession = true)]
        public OUT SessionCart(int id)
        {
            OUT O = new OUT();
            //Initial Case
            if (Session["Cart_Items"] == null)
            {
                int[] temp = { 0, 0, 0, 0, 0, 0, 0, 0 };
                if (temp[id-1] == 0)
                {
                    temp[id-1] = 1;
                }
                Session["Cart_Items"] = temp;
                O.result = "1";
                return O;
            }
            else
            {
                int[] temp = (int[])Session["Cart_Items"];
                if (temp[id - 1] == 0)
                {
                    temp[id - 1] = 1;
                    Session["Cart_Items"] = temp;
                    O.result = "1";
                    return O;
                }
                else
                {
                    O.result = "0";
                    return O;
                }
            }
        }
        [WebMethod(EnableSession = true)]
        public OUT SessionCart_Ret()
        {
            OUT O = new OUT();
            O.result = "";
            int[] temp = (int[])Session["Cart_Items"];
            if (temp == null)
            {
                return O;
            }
            for(int i=0;i<temp.Length;i++)
            {
                O.result = O.result + temp[i] + "$";
            }
            return O;
        }
        [WebMethod]
        public OUT_CART PopulateCart(int id)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Select Product_Name, Product_Price from tblProducts where Product_Id =" + Convert.ToString(id), con);
                OUT_CART O = new OUT_CART();
                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        O.name = Convert.ToString(rdr["Product_Name"]);
                        O.price = Convert.ToInt32(rdr["Product_Price"]);
                    }
                }
                return O;
            }
        }
    }
}
