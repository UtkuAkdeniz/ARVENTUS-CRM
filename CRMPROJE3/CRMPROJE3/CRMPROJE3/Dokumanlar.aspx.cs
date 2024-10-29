using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRMPROJE3
{
    public partial class Dokumanlar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(FileUploadControl.FileName);
                    byte[] fileData = FileUploadControl.FileBytes;
                    DateTime uploadDate = DateTime.Now;

                    string connectionString = ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString;
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO Dokumanlar (Ad, Icerik, YüklemeTarihi) VALUES (@Ad, @Icerik, @YuklemeTarihi)";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.Add("@Ad", SqlDbType.NVarChar, 100).Value = fileName;
                            command.Parameters.Add("@Icerik", SqlDbType.VarBinary).Value = fileData;
                            command.Parameters.Add("@YuklemeTarihi", SqlDbType.DateTime).Value = uploadDate;

                            connection.Open();
                            command.ExecuteNonQuery();
                        }
                    }

                    Label1.Text = "Dosya başarıyla yüklendi!";
                    BindGrid();
                }
                catch (Exception ex)
                {
                    Label1.Text = "Dosya yüklenirken hata oluştu: " + ex.Message;
                }
            }
            else
            {
                Label1.Text = "Lütfen bir dosya seçin.";
            }
        }

        private void BindGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString;
            string query = "SELECT Id, Ad, YüklemeTarihi FROM Dokumanlar"; // YüklemeTarihi sütununu sorguya ekledik

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int dosyaId = Convert.ToInt32(GridView1.DataKeys[index].Value);

                GosterPdf(dosyaId);
            }
        }

        private void GosterPdf(int dosyaId)
        {
            byte[] fileData;
            string dosyaAdi;

            string connectionString = ConfigurationManager.ConnectionStrings["ARVENTUSConnectionString"].ConnectionString;
            string query = "SELECT Ad, Icerik FROM Dokumanlar WHERE Id = @Id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", dosyaId);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        dosyaAdi = reader["Ad"].ToString();
                        fileData = (byte[])reader["Icerik"];

                        Response.Clear();
                        Response.Buffer = true;
                        Response.ContentType = "application/pdf";
                        Response.AddHeader("content-disposition", $"attachment;filename={dosyaAdi}");
                        Response.BinaryWrite(fileData);
                        Response.End();
                    }
                }
            }
        }
    }
}


