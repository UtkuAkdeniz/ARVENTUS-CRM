using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRMPROJE3
{
    public partial class TedarikciSatis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if (Session["PersonelNumarasi"] == null)
            //   Response.Redirect("Login.aspx");
        }

        protected void excelbutontdrk_Click(object sender, ImageClickEventArgs e)
        {
            Gvtedarik.ExportXlsxToResponse();
        }

        protected void pdfbutontdrk_Click(object sender, ImageClickEventArgs e)
        {
            Gvtedarik.ExportXlsxToResponse();
        }
    }
}