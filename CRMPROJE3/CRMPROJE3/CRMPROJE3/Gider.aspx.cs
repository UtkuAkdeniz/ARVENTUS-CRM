using DevExpress.XtraCharts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRMPROJE3
{
    public partial class Gider : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // if (Session["PersonelNumarasi"] == null)
             //   Response.Redirect("Login.aspx");
        }
        protected void btnGiderChart_Click(object sender, EventArgs e)
        {
            try
            {
                // Kontrollerin null olup olmadığını kontrol et
                if (txtGider != null && txtgidertrh != null)
                {
                    string startDate = txtGider.Text;
                    string endDate = txtgidertrh.Text;

                    if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
                    {
                        dsExpenseChart.SelectCommand = @"
                    SELECT Tarih, SUM(Tutar) AS Tutar 
                    FROM Giderler 
                    WHERE Tarih >= @StartDate AND Tarih <= @EndDate
                    GROUP BY Tarih
                    ORDER BY Tarih";

                        dsExpenseChart.SelectParameters.Clear();
                        dsExpenseChart.SelectParameters.Add("StartDate", TypeCode.DateTime, startDate);
                        dsExpenseChart.SelectParameters.Add("EndDate", TypeCode.DateTime, endDate);

                        ExpenseChart.DataSourceID = "dsExpenseChart";
                        ExpenseChart.DataBind();

                        // Diagram ve Axis başlıklarını görünür yap
                        XYDiagram diagram = ExpenseChart.Diagram as XYDiagram;
                        if (diagram != null)
                        {
                            diagram.AxisX.Title.Visible = true;
                            diagram.AxisY.Title.Visible = true;
                        }
                    }
                }
                else
                {
                    // Kontroller null ise bir hata fırlat
                    throw new NullReferenceException("Tarih kontrolleri bulunamadı.");
                }
            }
            catch (Exception ex)
            {
                // Hataları yakala ve gerekirse logla veya kullanıcıya göster
                Response.Write("Bir hata oluştu: " + ex.Message);
            }
        }
    }
}