using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace CRMPROJE3
{
    public partial class StokSatis : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // if (Session["PersonelNumarasi"] == null)
            //   Response.Redirect("Login.aspx");
        }

        protected void excelbutonstok_Click(object sender, EventArgs e)
        {
            gvStok.ExportXlsxToResponse();
        }

        protected void pdfbutonstok_Click(object sender, EventArgs e)
        {
            gvStok.ExportPdfToResponse();
        }

    }
}