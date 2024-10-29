using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRMPROJE3
{
    public partial class MusteriEkleSatis : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
          //  if (Session["PersonelNumarasi"] == null)
            //    Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {
                // Sayfa ilk yüklendiğinde, Oluşturulma Tarihi sütununa bugünkü tarihi ekleyin
                GridViewDataDateColumn olusturulmaTarihiColumn = (GridViewDataDateColumn)MusteriGridView.Columns["Oluşturulma_Tarihi"];
                olusturulmaTarihiColumn.PropertiesEdit.DisplayFormatString = "dd.MM.yyyy"; // Tarih formatını ayarlayın
                olusturulmaTarihiColumn.PropertiesEdit.NullDisplayText = DateTime.Now.ToString("dd.MM.yyyy");
            }
        }

        protected void excelbutonstok_Click(object sender, ImageClickEventArgs e)
        {
            MusteriGridView.ExportXlsxToResponse();
        }

        protected void pdfbutonstok_Click(object sender, ImageClickEventArgs e)
        {
            MusteriGridView.ExportPdfToResponse();
        }
    }
}