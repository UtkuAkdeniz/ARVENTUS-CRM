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
    public partial class IrsaliyeSatis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if (Session["PersonelNumarasi"] == null)
            //       Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                // Sayfa ilk kez yüklendiğinde yapılacak işlemler
            }
        }

        protected void btnxlsirsl_Click(object sender, ImageClickEventArgs e)
        {
            gvIrsaliye.ExportXlsxToResponse();
        }

        protected void pdfbtnirs_Click(object sender, ImageClickEventArgs e)
        {
            gvIrsaliye.ExportPdfToResponse();
        }
        protected void btnirs_Click(object sender, EventArgs e)
        {
            // TextBox ve DropDownList'lardan değerleri al
            int irsaliyeNo;
            if (!int.TryParse(txtIrsNo.Text, out irsaliyeNo))
            {
                ShowAlert("İrsaliye Numarası alanına sadece sayısal değer girmelisiniz.");
                return;
            }

            DateTime tarih;
            if (!DateTime.TryParse(txtTarih.Text, out tarih))
            {
                ShowAlert("Geçerli bir tarih giriniz.");
                return;
            }

            decimal birimFiyat;
            if (!decimal.TryParse(txtBirimFiyat.Text, out birimFiyat))
            {
                ShowAlert("Birim Fiyat alanına sadece sayısal değer girmelisiniz.");
                return;
            }

            int miktar;
            if (!int.TryParse(txtMiktar.Text, out miktar))
            {
                ShowAlert("Miktar alanına sadece sayısal değer girmelisiniz.");
                return;
            }

            string depoKod = ddlDepo.SelectedValue;
            string saticiVkn = ddlTedarikci.SelectedValue;
            int kategoriNo = Convert.ToInt32(ddlKategori.SelectedValue);
            string urunAdi = txtUrunAdi.Text;

            // Tutarı hesapla
            decimal tutar = birimFiyat * miktar;

            // Connection String'i al
            string connectionString = ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString;

            // Yeni bir SqlConnection ve SqlCommand oluştur
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Irsaliye (İrsaliye_No, Tarih, birim_fiyat, Miktar, Tutar, Depo_Kod, Satıcıvkn, Kategori_no, Urun_adi) VALUES (@Irsaliye_No, @Tarih, @birim_fiyat, @Miktar, @Tutar, @Depo_Kod, @Satıcıvkn, @Kategori_no, @Urun_adi)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Parametreleri ekle
                    command.Parameters.AddWithValue("@Irsaliye_No", irsaliyeNo);
                    command.Parameters.AddWithValue("@Tarih", tarih);
                    command.Parameters.AddWithValue("@birim_fiyat", birimFiyat);
                    command.Parameters.AddWithValue("@Miktar", miktar);
                    command.Parameters.AddWithValue("@Tutar", tutar);
                    command.Parameters.AddWithValue("@Depo_Kod", depoKod);
                    command.Parameters.AddWithValue("@Satıcıvkn", saticiVkn);
                    command.Parameters.AddWithValue("@Kategori_no", kategoriNo);
                    command.Parameters.AddWithValue("@Urun_adi", urunAdi);

                    // Bağlantıyı aç
                    connection.Open();

                    // Komutu çalıştır
                    command.ExecuteNonQuery();

                    // Bağlantıyı kapat
                    connection.Close();
                }
            }

            // Kayıt eklendikten sonra mesaj göster
            success("Kaydınız başarıyla oluşturulmuştur.");

            // Yönlendirme işlemi
            //Response.Redirect(Request.Url.AbsoluteUri);
        }

        private void success(string message)
        {
            string script = $@"<script type='text/javascript'>
                                swal('{message}', '', 'success');
                              </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, false);
        }


        #region Showalert warning
        private void ShowAlert(string message)
        {
            string script = $@"<script type='text/javascript'>
                                swal('{message}', '', 'warning');
                              </script>";

            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, false);
        }
        #endregion
    }
}
