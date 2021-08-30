using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security; //classes related to forms authentication are here
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TheStore.resources
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) //if client side validation has failed
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spRegisterUser", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter username = new SqlParameter("@UserName", txtUserName_reg.Text);
                    string encryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword_reg.Text, "SHA1");
                    //encrypting the way password is stored
                    SqlParameter password = new SqlParameter("@Password", encryptedPassword);
                    SqlParameter email = new SqlParameter("@Email", txtEmail_reg.Text);

                    cmd.Parameters.Add(username);
                    cmd.Parameters.Add(password);
                    cmd.Parameters.Add(email);

                    con.Open();
                    int ReturnCode = (int)cmd.ExecuteScalar(); //as the strored procedure returns a scalar value
                    if (ReturnCode == -1)
                    {
                        lblMessage.Text = "User Name already in use, please choose another user name";
                    }
                    else
                    {
                        Response.Redirect("~/Login.aspx");
                    }
                }
            }
        }
    }
}