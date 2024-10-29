using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRMPROJE3
{
    public partial class Login : System.Web.UI.Page
    {
        //Sql Bağlantısı//
        SqlConnection baglanti = new SqlConnection(ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //Butona tıklandığında ne yapılacağını gösterir(giriş yap butonu)//
        protected void btngiris_Click1(object sender, EventArgs e)
        {
            if (ASPxCaptcha1.IsValid)
            {
                string kullaniciAdi = txtkullanici.Text.Trim();
                string sifre = txtsifre.Text;

                // Kullanıcı giriş bilgilerinin doğruluğunu kontrol et
                var adSoyad = IsValidCredentials(kullaniciAdi, sifre);
                if (adSoyad.Item1 != null)
                {
                    // Kullanıcı doğru giriş yaptıysa oturum bilgisi oluştur
                    Session["PersonelNumarasi"] = kullaniciAdi;
                    Session["Ad"] = adSoyad.Item1;
                    Session["Soyad"] = adSoyad.Item2;

                    // Kullanıcı yönlendirme işlemleri
                    if (kullaniciAdi == "506638")
                        Response.Redirect("Admin.aspx");
                    else if (int.TryParse(kullaniciAdi, out int kullaniciNumarasi))
                    {
                        if (kullaniciNumarasi >= 0 && kullaniciNumarasi <= 1000)
                            Response.Redirect("SatisPanel.aspx");

                        if(kullaniciNumarasi > 1000 && kullaniciNumarasi <= 1500)
                            Response.Redirect("MuhasebePanel.aspx");
                    }
                    else
                    {
                        lbluyarı.Text = "Geçersiz kullanıcı tipi.";
                        lbluyarı.Visible = true;
                    }
                }
                else
                {
                    lbluyarı.Text = "Geçersiz kullanıcı adı veya parola.";
                    lbluyarı.Visible = true;
                }
            }
            else
            {

                lbluyarı.Visible = true;
            }
        }

        // Kullanıcı giriş bilgilerini doğrula
        private Tuple<string, string> IsValidCredentials(string kullaniciAdi, string sifre)
        {
            string ad = null;
            string soyad = null;
            string connStr = ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString;

            using (SqlConnection baglanti = new SqlConnection(connStr))
            {
                string query = "SELECT Ad, Soyad FROM Login WHERE Personel_Numarasi=@P1 AND Sifre=@P2";
                using (SqlCommand komut = new SqlCommand(query, baglanti))
                {
                    komut.Parameters.AddWithValue("@P1", kullaniciAdi);
                    komut.Parameters.AddWithValue("@P2", sifre);

                    try
                    {
                        baglanti.Open();
                        using (SqlDataReader reader = komut.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                ad = reader.GetString(0);
                                soyad = reader.GetString(1);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Hata yönetimi burada yapılabilir, örneğin loglama
                    }
                }
            }

            return Tuple.Create(ad, soyad);
        }
    }
}