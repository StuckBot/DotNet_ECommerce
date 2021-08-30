using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheStore.resources
{
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool val1 = (System.Web.HttpContext.Current.User != null) && (System.Web.HttpContext.Current.User.Identity.IsAuthenticated);
            if (val1)
            {
                auth.Text = "User: " + Convert.ToString(System.Web.HttpContext.Current.User.Identity.Name);
                auth.CssClass = "disable btn btn-outline-light btn-success";
            }
        }
    }
}