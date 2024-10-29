using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Policy;
using System.Configuration;

namespace CRMPROJE3
{
    public partial class PersonelEkleMuhasebe : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
         //   if (Session["PersonelNumarasi"] == null)
           //     Response.Redirect("Login.aspx");
        }

        protected void excelbuton_Click1(object sender, EventArgs e)
        {
            ASPxGridView1.ExportXlsxToResponse();
        }

        protected void pdfbuton_Click1(object sender, EventArgs e)
        {
            ASPxGridView1.ExportPdfToResponse();
        }
    }
}
