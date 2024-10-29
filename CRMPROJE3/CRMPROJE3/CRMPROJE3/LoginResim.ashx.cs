using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace CRMPROJE3
{
    public class LoginResim : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string personelNumarasi = context.Request.QueryString["PersonelNumarasi"];
            if (personelNumarasi != null)
            {
                byte[] profilResmi = GetProfilResmi(personelNumarasi);
                if (profilResmi != null)
                {
                    context.Response.ContentType = "image/jpeg"; // Resminizin türüne göre bu değeri değiştirebilirsiniz
                    context.Response.BinaryWrite(profilResmi);
                }
            }
        }

        private byte[] GetProfilResmi(string personelNumarasi)
        {
            byte[] profilResmi = null;
            string connStr = ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString;

            using (SqlConnection baglanti = new SqlConnection(connStr))
            {
                string query = "SELECT Profil_Resmi FROM Login WHERE Personel_Numarasi=@P1";
                using (SqlCommand komut = new SqlCommand(query, baglanti))
                {
                    komut.Parameters.AddWithValue("@P1", personelNumarasi);

                    try
                    {
                        baglanti.Open();
                        using (SqlDataReader reader = komut.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                profilResmi = (byte[])reader["Profil_Resmi"];
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Hata yönetimi burada yapılabilir, örneğin loglama
                    }
                }
            }

            return profilResmi;
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}
