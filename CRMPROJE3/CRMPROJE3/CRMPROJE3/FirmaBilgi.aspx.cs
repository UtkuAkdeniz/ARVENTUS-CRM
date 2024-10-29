using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRMPROJE3
{
    public partial class FirmaBilgi : System.Web.UI.Page
    {
        string[] FirmaAdresi = { "txtFirmaAdresi", "txtIl", "txtIlce", "txtMahalle", "txtKapino", "txtPostakodu", "txtEposta", "txtTelefon", "txtFax" };
        string[] VeriSutunu = { "Firma_Adresi", "il", "ilce", "mahalle", "kapı_no", "Posta_Kodu", "E_Posta", "Telefon_No", "Fax" };


        protected void Page_Load(object sender, EventArgs e)
        {
            //  if (Session["PersonelNumarasi"] == null)
            //    Response.Redirect("Login.aspx");

            if (!IsPostBack) // Sayfa ilk kez yüklendiğinde
            {
                // Sayfa ilk yüklendiğinde verileri çek
                liste();
            }
        }


        SqlConnection baglanti = new SqlConnection(ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString);
        protected void btnfirma_Click(object sender, EventArgs e)
        {
            // Kullanıcının girdiği verileri al
            string firmaAdresi = txtFirmaAdresi.Text;
            string il = txtIl.Text;
            string ilce = txtIlce.Text;
            string mahalle = txtMahalle.Text;
            string kapiNo = txtKapino.Text;
            string postaKodu = txtPostakodu.Text;
            string eposta = txtEposta.Text;
            string telefonNo = txtTelefon.Text;
            string fax = txtFax.Text;
            string firmaAdi = txtFirmaAdi.Text;
            int depoKod = Convert.ToInt32(DropDownList2.SelectedValue); // DropDownList2'den seçilen değeri int'e çevir
            int mukellefiyetTuru = Convert.ToInt32(DropDownList1.SelectedValue); // DropDownList1'den seçilen değeri int'e çevir
            string vkn = txtVkn.Text;
            string vergiDairesi = txtVergiDairesi.Text;

            // SqlConnection oluştur

            using (baglanti)
            {



                // SqlCommand oluştur
                using (SqlCommand cmd = new SqlCommand("UPDATE Firma_Adres Set Firma_Adresi = @Firma_Adresi ,il = @il, ilce = @ilce ,mahalle=@mahalle, kapı_no = @kapi_no, Posta_Kodu= @Posta_Kodu, E_Posta=@E_Posta, Telefon_No=@Telefon_No, Fax=@Fax WHERE Id = 1", baglanti))
                {
                    baglanti.Open();

                    // SQL sorgusunu belirle (Firma_Adres tablosuna ekle)

                    // Parametreleri ekle
                    cmd.Parameters.AddWithValue("@Firma_Adresi", firmaAdresi);
                    cmd.Parameters.AddWithValue("@il", il);
                    cmd.Parameters.AddWithValue("@ilce", ilce);
                    cmd.Parameters.AddWithValue("@mahalle", mahalle);
                    cmd.Parameters.AddWithValue("@kapi_no", kapiNo);
                    cmd.Parameters.AddWithValue("@Posta_Kodu", postaKodu);
                    cmd.Parameters.AddWithValue("@E_Posta", eposta);
                    cmd.Parameters.AddWithValue("@Telefon_No", telefonNo);
                    cmd.Parameters.AddWithValue("@Fax", fax);

                    // Bağlantıyı aç

                    // Komutu çalıştır ve etkilenen satır sayısını al
                    cmd.ExecuteNonQuery();
                    // Bağlantıyı kapat
                    baglanti.Close();

                }



                using (SqlCommand cmd2 = new SqlCommand("UPDATE Firma_Bilgi set Firma_Adi=@Firma_Adi, VKN = @VKN,Vergi_Dairesi=@Vergi_Dairesi WHERE Id = 1", baglanti))
                {
                    // SqlCommand'a yeni sorgu ata (Firma_Bilgi tablosuna ekle)
                    baglanti.Open();


                    cmd2.Parameters.AddWithValue("@Firma_Adi", firmaAdi);
                    cmd2.Parameters.AddWithValue("@VKN", vkn);
                    cmd2.Parameters.AddWithValue("@Vergi_Dairesi", vergiDairesi);

                    // Yeni komutu çalıştır ve etkilenen satır sayısını al
                    cmd2.ExecuteNonQuery();
                    // Bağlantıyı tekrar kapat

                    baglanti.Close();
                }
                // Bağlantıyı tekrar aç




                liste();



            }
        }

        public void liste() 
        {
        
        
        
            #region firma bilgileri textbox filler 
            baglanti.Open();
            SqlCommand command = new SqlCommand("select Firma_Adresi from Firma_Adres where Id= 1", baglanti);

            SqlDataReader Notreader = command.ExecuteReader();
            using (Notreader)
            {
                if (Notreader.Read())
                {
                   txtFirmaAdresi.Text = Notreader["Firma_Adresi"].ToString();
                }

            }



            SqlCommand command1 = new SqlCommand("select il from Firma_Adres where Id= 1", baglanti);

            SqlDataReader Notreader2 = command1.ExecuteReader();
            using (Notreader2)
            {
                if (Notreader2.Read())
                {
                    txtIl.Text = Notreader2["il"].ToString();
                }

            }

            SqlCommand command2 = new SqlCommand("select ilce from Firma_Adres where Id= 1", baglanti);

            SqlDataReader Notreader3 = command2.ExecuteReader();
            using (Notreader3)
            {
                if (Notreader3.Read())
                {
                    txtIlce.Text = Notreader3["ilce"].ToString();
                }

            }

            SqlCommand command3 = new SqlCommand("select mahalle from Firma_Adres where Id= 1", baglanti);

            SqlDataReader Notreader4 = command3.ExecuteReader();
            using (Notreader4)
            {
                if (Notreader4.Read())
                {
                    txtMahalle.Text = Notreader4["mahalle"].ToString();
                }

            }

            SqlCommand command4 = new SqlCommand("select kapı_no from Firma_Adres where Id= 1", baglanti);

            SqlDataReader Notreader5 = command4.ExecuteReader();
            using (Notreader5)
            {
                if (Notreader5.Read())
                {
                    txtKapino.Text = Notreader5["kapı_no"].ToString();
                }

            }

            SqlCommand command5 = new SqlCommand("select Posta_Kodu from Firma_Adres where Id= 1", baglanti);

            SqlDataReader Notreader6 = command5.ExecuteReader();
            using (Notreader6)
            {
                if (Notreader6.Read())
                {
                    txtPostakodu.Text = Notreader6["Posta_Kodu"].ToString();
                }

            }

            SqlCommand command6 = new SqlCommand("select E_Posta from Firma_Adres where Id= 1", baglanti);

            SqlDataReader Notreader7 = command6.ExecuteReader();
            using (Notreader7)
            {
                if (Notreader7.Read())
                {
                    txtEposta.Text = Notreader7["E_Posta"].ToString();
                }

            }

            SqlCommand command7 = new SqlCommand("select Telefon_No from Firma_Adres where Id= 1", baglanti);

            SqlDataReader Notreader8 = command7.ExecuteReader();
            using (Notreader8)
            {
                if (Notreader8.Read())
                {
                    txtTelefon.Text = Notreader8["Telefon_No"].ToString();
                }

            }

            SqlCommand command8 = new SqlCommand("select Fax from Firma_Adres where Id= 1", baglanti);

            SqlDataReader Notreader9 = command8.ExecuteReader();
            using (Notreader9)
            {
                if (Notreader9.Read())
                {
                    txtFax.Text = Notreader9["Fax"].ToString();
                }

            }

            baglanti.Close();
            #endregion

            #region firma bilgileri textboxfiller
            baglanti.Open();

            SqlCommand command9 = new SqlCommand("select Firma_Adi from Firma_Bilgi where Id= 1", baglanti);

            SqlDataReader Notreader10 = command9.ExecuteReader();
            using (Notreader10)
            {
                if (Notreader10.Read())
                {
                    txtFirmaAdi.Text = Notreader10["Firma_Adi"].ToString();
                }

            }

            SqlCommand command10 = new SqlCommand("select VKN from Firma_Bilgi where Id= 1", baglanti);

            SqlDataReader Notreader11 = command10.ExecuteReader();
            using (Notreader11)
            {
                if (Notreader11.Read())
                {
                    txtVkn.Text = Notreader11["VKN"].ToString();
                }

            }

            SqlCommand command11 = new SqlCommand("select Vergi_Dairesi from Firma_Bilgi where Id= 1", baglanti);

            SqlDataReader Notreader12 = command11.ExecuteReader();
            using (Notreader12)
            {
                if (Notreader12.Read())
                {
                    txtVergiDairesi.Text = Notreader12["Vergi_Dairesi"].ToString();
                }

            }

            baglanti.Close();
            #endregion

        
        }


    }
}
