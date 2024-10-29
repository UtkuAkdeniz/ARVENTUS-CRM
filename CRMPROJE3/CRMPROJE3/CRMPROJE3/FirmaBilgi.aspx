<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="FirmaBilgi.aspx.cs" Inherits="CRMPROJE3.FirmaBilgi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
            /* width */
::-webkit-scrollbar {
   width: 1.50vh; /* Yatay scrollbar genişliği */
  height: 2vh; /* Dikey scrollbar genişliği */
}

/* Track */
::-webkit-scrollbar-track {
  background: #0094ff; /* Arka plan rengi */
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #4e73df; /* Scrollbar rengi */
  border-radius: 10px; /* Oval şeklini sağlamak için */
}

/* Sağ taraftaki scrollbar'ı oval yapmak için */

::-webkit-scrollbar-thumb:vertical {
  border-radius: 10px;
}

/* İçindeki scrollbar track'ı dikdörtgen şeklinde bırakmak için */
::-webkit-scrollbar-track-piece {
  background: #ccc; /* Track arka plan rengi */
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="bg-primary text-white rounded p-4">
                <div class="form-group">
                    <label for="firmaAdresi">Firma Adresi</label>
                    <asp:TextBox ID="txtFirmaAdresi" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="il">İl</label>
                        <asp:TextBox ID="txtIl" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="ilce">İlçe</label>
                        <asp:TextBox ID="txtIlce" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="mahalle">Mahalle</label>
                        <asp:TextBox ID="txtMahalle" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="kapino">Kapı No</label>
                        <asp:TextBox ID="txtKapino" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="postakodu">Posta Kodu</label>
                        <asp:TextBox ID="txtPostakodu" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="eposta">E-Posta</label>
                    <asp:TextBox ID="txtEposta" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="telefon">Telefon No</label>
                        <asp:TextBox ID="txtTelefon" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fax">Fax</label>
                        <asp:TextBox ID="txtFax" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                 
            </div>
        </div>
        <div class="col-md-6">
            <div class="bg-primary text-white rounded p-4">
                <div class="form-group">
                    <label for="firmaAdi">Firma Adı</label>
                    <asp:TextBox ID="txtFirmaAdi" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="depoKod">Depolar</label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="depo_ad" DataValueField="depo_kod"></asp:DropDownList>

                </div>
                <div class="form-group">
                    <label for="mukellefiyetTuru">Mükellefiyet Türü</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="Mukellefiyet_Adi" DataValueField="Mukellefiyet_Turu"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="vkn">VKN</label>
                    <asp:TextBox ID="txtVkn" runat="server" CssClass="form-control" Font-Underline="False"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="vergiDairesi">Vergi Dairesi</label>
                    <asp:TextBox ID="txtVergiDairesi" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
      <asp:Button ID="btnfirma" class="btn btn-success btn-lg d-inline mt-4" style="width: 100%;" runat="server" Text="Firma Bilgileri Güncelle" OnClick="btnfirma_Click" />
</div>



<!-- 
    <div class="container mt-5 mb-5">
    <div class="row">
        <div class="col-md-6">
            <div class="bg-primary text-white rounded p-4">
                <div class="form-group">
                    <label for="depoAdi">Depo Adı</label>
                    <asp:TextBox ID="txtDepoAdi" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="depoKodu">Depo Kodu</label>
                    <asp:TextBox ID="txtDepoKodu" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="depoAdres">Depo Adresi</label>
                    <asp:TextBox ID="txtDepoAdres" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
        <asp:Button ID="btndepoekle" class="btn btn-success btn-lg d-inline mt-4" style="width:49%;" runat="server" Text="Depo Ekle" />
</div>

    -->
      
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT Mukellefiyet_Turu, Mukellefiyet_Adi FROM Mukellefiyet_Turu"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT depo_kod, depo_ad FROM Depo"></asp:SqlDataSource>


</asp:Content>
