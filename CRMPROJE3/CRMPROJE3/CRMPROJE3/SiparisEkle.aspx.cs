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
    public partial class SiparisEkle : System.Web.UI.Page
    {
        SqlConnection Baglantı = new SqlConnection(ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region DropDown İkizler
        protected void FirmaVKNDropDownGuncelleme(object sender, EventArgs e)
        {

            Baglantı.Open();
            SqlCommand VKN_VeriAlma = new SqlCommand("SELECT firma_ID FROM FirmaMusteri WHERE firma_ID = @firma_ID ", Baglantı);

            VKN_VeriAlma.Parameters.AddWithValue("@firma_ID", FirmaAdiDropDown.SelectedValue);



            //  SqlCommand VKN_VeriYükleme = new SqlCommand($"UPDATE firma_ID Set FirmaMusteri WHERE firma_ID ={VKN_VeriAlma}", Baglantı);
            SqlDataReader VKN_VeriYükleme = VKN_VeriAlma.ExecuteReader();
            using (VKN_VeriYükleme)
            {

                if (VKN_VeriYükleme.Read())
                {
                    FirmaVKNDropDown.SelectedValue = VKN_VeriYükleme["firma_ID"].ToString();
                }
            }
            Baglantı.Close();
        }

        protected void FirmaAdiDropDownGuncelleme(object sender, EventArgs e)
        {

            Baglantı.Open();
            SqlCommand AD_VeriAlma = new SqlCommand("SELECT firma_ID FROM FirmaMusteri WHERE firma_ID = @firma_ID ", Baglantı);

            AD_VeriAlma.Parameters.AddWithValue("@firma_ID", FirmaVKNDropDown.SelectedValue);



            //  SqlCommand VKN_VeriYükleme = new SqlCommand($"UPDATE firma_ID Set FirmaMusteri WHERE firma_ID ={VKN_VeriAlma}", Baglantı);
            SqlDataReader AD_VeriYükleme = AD_VeriAlma.ExecuteReader();
            using (AD_VeriYükleme)
            {

                if (AD_VeriYükleme.Read())
                {
                    FirmaAdiDropDown.SelectedValue = AD_VeriYükleme["firma_ID"].ToString();
                }
            }
            Baglantı.Close();
        }
        #endregion

        #region Birim Fiyat Guncelleme
        protected void SatısUcretiGuncelleme(object sender, EventArgs e)
        {

            Baglantı.Open();
            SqlCommand Tane_Ucret_VeriAlma = new SqlCommand("SELECT tane_ucreti FROM Stok WHERE Id = @stok_kodu ", Baglantı);

            Tane_Ucret_VeriAlma.Parameters.AddWithValue("@stok_kodu", StokDDL.SelectedValue);


            SqlDataReader Tane_Ucret_VeriYükleme = Tane_Ucret_VeriAlma.ExecuteReader();
            using (Tane_Ucret_VeriYükleme)
            {

                if (Tane_Ucret_VeriYükleme.Read())
                {
                    TxtSatisUcreti.Text = Tane_Ucret_VeriYükleme["tane_ucreti"].ToString();
                }
            }
            Baglantı.Close();
        }
        #endregion

        protected void KAYIT_Ekle_Click(object sender, EventArgs e)
        {
            int Sozlesme;
            if (!int.TryParse(TxtSozlesmeId.Text, out Sozlesme))
            {
                ShowAlert("Sözleşme ID alanına sadece sayısal değer girmelisiniz.");
                return;
            }

            DateTime tarih;
            if (!DateTime.TryParse(TxtTarih.Text, out tarih))
            {
                ShowAlert("Geçerli bir tarih giriniz.");
                return;
            }

            DateTime BitisTarih;
            if (!DateTime.TryParse(TxtTeslimTarihi.Text, out BitisTarih))
            {
                ShowAlert("Geçerli bir tarih giriniz.");
                return;
            }

            int UrunAdeti;
            if (!int.TryParse(TxtUrunAdet.Text, out UrunAdeti))
            {
                ShowAlert("Ürün Adeti alanına sadece sayısal değer girmelisiniz.");
                return;
            }

           

            // SqlConnection oluştur
            using (SqlConnection Baglantı = new SqlConnection(ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString))
            {
                Baglantı.Open();
                // SqlCommand oluştur ve SQL komutunu hazırla
                string query = "INSERT INTO Siparis (Tarih, Teslim_Tarihi, Firma_Id, Firma_VKN, Sozlesme_Id, Oncelik, Stok_Kodu, Satis_Ucreti, Urun_Adet, Adres) " +
                               "VALUES (@Tarih, @TeslimTarihi, @FirmaID,@FirmaVKN, @SozlesmeID, @Oncelik, @StokKodu, @SatisUcreti, @UrunAdet, @Adres)";
                SqlCommand command = new SqlCommand(query, Baglantı);

                // Parametreleri ekleyin
                command.Parameters.AddWithValue("@Tarih", Convert.ToDateTime(TxtTarih.Text));
                command.Parameters.AddWithValue("@TeslimTarihi", Convert.ToDateTime(TxtTeslimTarihi.Text));
                command.Parameters.AddWithValue("@FirmaID", FirmaAdiDropDown.SelectedValue);
                command.Parameters.AddWithValue("@FirmaVKN", FirmaVKNDropDown.SelectedValue);
                command.Parameters.AddWithValue("@SozlesmeID", TxtSozlesmeId.Text);
                command.Parameters.AddWithValue("@Oncelik", OncelikDDL.SelectedValue);
                command.Parameters.AddWithValue("@StokKodu", StokDDL.SelectedValue);
                command.Parameters.AddWithValue("@SatisUcreti", Convert.ToDecimal(TxtSatisUcreti.Text));
                command.Parameters.AddWithValue("@UrunAdet", Convert.ToInt32(TxtUrunAdet.Text));
                command.Parameters.AddWithValue("@Adres", TxtAdres.Text);
               

                // Bağlantıyı aç ve komutu çalıştır
                command.ExecuteNonQuery();

                Baglantı.Close();
            }

            success("Kaydınız başarıyla oluşturulmuştur.");
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