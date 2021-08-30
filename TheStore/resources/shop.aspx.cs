﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace TheStore.resources
{
    public partial class shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool val1 = (System.Web.HttpContext.Current.User != null) && (System.Web.HttpContext.Current.User.Identity.IsAuthenticated);
            if(val1)
            {
                auth.Text = "User: " + Convert.ToString(System.Web.HttpContext.Current.User.Identity.Name);
                auth.CssClass = "disable btn btn-outline-light btn-success";
            }
        }
    }
}