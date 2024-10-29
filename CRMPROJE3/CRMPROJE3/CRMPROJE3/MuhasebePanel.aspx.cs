using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRMPROJE3
{
    public partial class MuhasebePanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if (Session["PersonelNumarasi"] == null)
            //   Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                ASPxScheduler1.Start = DateTime.Today;
            }
        }

    }
}