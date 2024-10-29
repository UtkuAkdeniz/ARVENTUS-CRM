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
    public partial class Muhasebe1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /// Oturumdan kullanıcı adını al
                string kullaniciAdi = Session["PersonelNumarasi"] as string;

                // Kullanıcı bilgilerini al
                Tuple<string, string, string, string> kullaniciBilgileri = GetUserInfo(kullaniciAdi);

                // Kullanıcı bilgilerini labellara yaz
                lblPersonelNumarasi.Text = "Personel Numarası: " + kullaniciAdi;
                lblAd.Text = "Ad: " + kullaniciBilgileri.Item1;
                lblSoyad.Text = "Soyad: " + kullaniciBilgileri.Item2;
                lblSifre.Text = "Şifre: " + kullaniciBilgileri.Item3;

                if (!IsPostBack)
                {
                    // Kullanıcı girişi doğrulandıysa profil resmini yükle
                    if (Session["PersonelNumarasi"] != null)
                    {
                        string personelNumarasi = Session["PersonelNumarasi"].ToString();
                        string profilResmiUrl = ResolveUrl("~/LoginResim.ashx?PersonelNumarasi=" + personelNumarasi);
                        imgProfile.ImageUrl = profilResmiUrl;
                    }

                    // Oturum varsa, lbluser'a oturumda saklanan Ad ve Soyad değerlerini yazalım
                    if (Session["Ad"] != null && Session["Soyad"] != null)
                    {
                        lbluser.Text = Session["Ad"].ToString() + " " + Session["Soyad"].ToString();
                    }
                }

            }

            string Personelpage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);

            // Butonun görünürlüğünü kontrol et ve sadece personelekle.aspx sayfasında göster
            if (Personelpage == "PersonelEkleMuhasebe.aspx")
            {
                btnDepartman.Visible = true;
            }
            else
            {
                btnDepartman.Visible = false;
            }


            // Butonun görünürlüğünü kontrol et ve sadece personelekle.aspx sayfasında göster
            string Personelpage1 = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            if (Personelpage1 == "Gelir.aspx")
            {
                Button_Gelir_Ekle.Visible = true;
            }
            else
            {
                Button_Gelir_Ekle.Visible = false;
            }

            string Personelpage2 = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
            if (Personelpage1 == "Gider.aspx")
            {
                MDLBtnGider.Visible = true;
            }
            else
            {
                MDLBtnGider.Visible = false;
            }

        }

        private Tuple<string, string, string, string> GetUserInfo(string kullaniciAdi)
        {
            string ad = "";
            string soyad = "";
            string sifre = "";
            string dummy = ""; // Tuple'ın dördüncü elemanı için boş bir dize oluşturuyoruz
            string connStr = ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString;

            using (SqlConnection baglanti = new SqlConnection(connStr))
            {
                string query = "SELECT Ad, Soyad, Sifre FROM Login WHERE Personel_Numarasi=@P1";
                using (SqlCommand komut = new SqlCommand(query, baglanti))
                {
                    komut.Parameters.AddWithValue("@P1", kullaniciAdi);

                    try
                    {
                        baglanti.Open();
                        using (SqlDataReader reader = komut.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                ad = reader.GetString(0);
                                soyad = reader.GetString(1);
                                sifre = reader.GetString(2);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Hata yönetimi burada yapılabilir, örneğin loglama
                    }
                }
            }

            return Tuple.Create(ad, soyad, sifre, dummy);
        }
        public void Logout(object sender, EventArgs e)
        {
            // Oturumu kapat
            Session.Abandon();
            // Kullanıcıyı giriş sayfasına yönlendir
            Response.Redirect("Login.aspx");
        }
        protected void btnProfilResmiGuncelle_Click(object sender, EventArgs e)
        {
            if (fileProfilResmi.HasFile)
            {
                // Dosya yükleme işlemi
                byte[] bytes = fileProfilResmi.FileBytes;

                // Oturumdan kullanıcı adını al
                string kullaniciAdi = Session["PersonelNumarasi"] as string;

                // Veritabanına güncelleme işlemi
                string connStr = ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString;
                string query = "UPDATE Login SET Profil_Resmi=@Profil_Resmi WHERE Personel_Numarasi=@P1";

                using (SqlConnection baglanti = new SqlConnection(connStr))
                {
                    using (SqlCommand komut = new SqlCommand(query, baglanti))
                    {
                        komut.Parameters.AddWithValue("@Profil_Resmi", bytes);
                        komut.Parameters.AddWithValue("@P1", kullaniciAdi);

                        try
                        {
                            baglanti.Open();
                            komut.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            // Hata yönetimi burada yapılabilir, örneğin loglama
                        }
                    }
                }

                // Profil resmini yeniden yükle
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

        protected void btndptekle_Click1(object sender, EventArgs e)
        {
            // Bağlantı dizgisini al
            string connectionString = ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString;

            // Bağlantı oluştur
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL sorgusu
                string query = "INSERT INTO Departman (Departman_Numara, Departman_Adı) VALUES (@Departman_Numara, @Departman_Adı)";

                // Komut oluştur
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Parametreleri ekle
                    command.Parameters.AddWithValue("@Departman_Numara", txtdptno.Text);
                    command.Parameters.AddWithValue("@Departman_Adı", txtdptad.Text);



                    try
                    {
                        // Bağlantıyı aç
                        connection.Open();

                        // Sorguyu çalıştır ve etkilenen satır sayısını al
                        int rowsAffected = command.ExecuteNonQuery();

                        // SweetAlert için JavaScript kodu oluştur
                        string script = "";
                        if (rowsAffected > 0)
                        {
                            // SweetAlert ile başarı mesajını göster

                            ScriptManager.RegisterStartupScript(this, GetType(), "SuccessAlert", "swal('Başarılı!', 'Departman başarıyla eklendi.', 'success');", true);
                        }
                        else
                        {
                            // SweetAlert ile hata mesajını göster
                            ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", "swal('Hata!', 'Departman eklenirken bir hata oluştu.', 'error');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Hata durumunda SweetAlert ile hata mesajını göster
                        ScriptManager.RegisterStartupScript(this, GetType(), "ExceptionAlert", $"swal('Hata!', '{ex.Message}', 'error');", true);
                    }
                    connection.Close();
                }

            }
        }

        protected void BtnGelir_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString;

            // Veritabanı bağlantısını oluştur
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL komutunu oluştur
                string query = "INSERT INTO Gelir_Tipi (Gelir_Kodu, Gelir_Adı) VALUES (@GelirKodu, @GelirAdı)";

                // Parametrelerle birlikte SQL komutunu oluştur
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@GelirKodu", TxtGelirKodu.Text);
                command.Parameters.AddWithValue("@GelirAdı", TxtGelirTürü.Text);

                try
                {
                    // Bağlantıyı aç
                    connection.Open();

                    // Komutu çalıştır ve etkilenen satır sayısını al
                    int rowsAffected = command.ExecuteNonQuery();

                    // Eğer en az bir satır etkilendiyse, işlem başarılıdır
                    if (rowsAffected > 0)
                    {
                        // SweetAlert ile başarı mesajını göster

                        ScriptManager.RegisterStartupScript(this, GetType(), "SuccessAlert", "swal('Başarılı!', 'Kategori başarıyla eklendi.', 'success');", true);
                    }
                    else
                    {
                        // SweetAlert ile hata mesajını göster
                        ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", "swal('Hata!', 'Kategori eklenirken bir hata oluştu.', 'error');", true);
                    }
                }
                catch (Exception ex)
                {
                    // Hata durumunda SweetAlert ile hata mesajını göster
                    ScriptManager.RegisterStartupScript(this, GetType(), "ExceptionAlert", $"swal('Hata!', '{ex.Message}', 'error');", true);
                }
            }
        }

        protected void BtnGider_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString;

            // Veritabanı bağlantısını oluştur
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL komutunu oluştur
                string query = "INSERT INTO Gider_Tipi (Gider_Kodu, Gider_Adi) VALUES (@GiderKodu, @GiderAdı)";

                // Parametrelerle birlikte SQL komutunu oluştur
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@GiderKodu", TxtGiderKodu.Text);
                command.Parameters.AddWithValue("@GiderAdı", TxtGiderTürü.Text);

                try
                {
                    // Bağlantıyı aç
                    connection.Open();

                    // Komutu çalıştır ve etkilenen satır sayısını al
                    int rowsAffected = command.ExecuteNonQuery();

                    // Eğer en az bir satır etkilendiyse, işlem başarılıdır
                    if (rowsAffected > 0)
                    {
                        // SweetAlert ile başarı mesajını göster

                        ScriptManager.RegisterStartupScript(this, GetType(), "SuccessAlert", "swal('Başarılı!', 'Kategori başarıyla eklendi.', 'success');", true);
                    }
                    else
                    {
                        // SweetAlert ile hata mesajını göster
                        ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", "swal('Hata!', 'Kategori eklenirken bir hata oluştu.', 'error');", true);
                    }
                }
                catch (Exception ex)
                {
                    // Hata durumunda SweetAlert ile hata mesajını göster
                    ScriptManager.RegisterStartupScript(this, GetType(), "ExceptionAlert", $"swal('Hata!', '{ex.Message}', 'error');", true);
                }
            }
        }
    }
}