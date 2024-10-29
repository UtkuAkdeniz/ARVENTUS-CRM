<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Irsaliye.aspx.cs" Inherits="CRMPROJE3.Irsaliye" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <style>
   /* Scrollbar stili */
    ::-webkit-scrollbar {
        width: 1.50vh;
        height: 2vh;
    }

    ::-webkit-scrollbar-track {
        background: #0094ff;
    }

    ::-webkit-scrollbar-thumb {
        background: #4e73df;
        border-radius: 10px;
    }

    ::-webkit-scrollbar-thumb:vertical {
        border-radius: 10px;
    }

    ::-webkit-scrollbar-track-piece {
        background: #ccc;
    }

    .auto-style1 {
        margin-right: 148px;
    }

    .full-height-grid {
        height: 80vh; /* Grid yüksekliği */
        width: 100%; /* Tam genişlik */
        overflow: auto; /* Scroll barlar için */
    }      </style>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
     
    

           <div  id="gridContainer class="full-height-grid">

           <dx:ASPxGridView ID="gvIrsaliye" runat="server" AutoGenerateColumns="False" DataSourceID="dsIrsaliye" KeyFieldName="id" EnableTheming="True" Theme="iOS" CssClass="auto-style1" Width="100%">
               <SettingsAdaptivity AdaptivityMode="HideDataCells">
               </SettingsAdaptivity>
    <SettingsEditing Mode="Batch" />
    <Settings ShowGroupPanel="True" ShowFooter="True" />
    <SettingsPopup>
        <FilterControl AutoUpdatePosition="False"></FilterControl>
    </SettingsPopup>
               <SettingsSearchPanel Visible="True" />
    <Columns>
    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0"></dx:GridViewCommandColumn>
    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="1" Visible="False"><EditFormSettings Visible="False" /></dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn FieldName="İrsaliye_No" VisibleIndex="2" Caption="İrsaliye Numarası"></dx:GridViewDataTextColumn>
    <dx:GridViewDataDateColumn FieldName="Tarih" VisibleIndex="3"></dx:GridViewDataDateColumn>
    <dx:GridViewDataTextColumn FieldName="birim_fiyat" VisibleIndex="4" Caption="Birim Fiyat"></dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn FieldName="Miktar" VisibleIndex="5"></dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="6"></dx:GridViewDataTextColumn>
    <dx:GridViewDataComboBoxColumn FieldName="Satıcıvkn" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Tedarikçi">
        <PropertiesComboBox DataSourceID="dsSatıcı" TextField="satici_ad" ValueField="satici_vkn"></PropertiesComboBox>
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataTextColumn FieldName="Urun_adi" VisibleIndex="10" Caption="Ürün Adı"></dx:GridViewDataTextColumn>
    <dx:GridViewDataComboBoxColumn FieldName="Depo_Kod" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Depo">
        <PropertiesComboBox DataSourceID="dsDepo" TextField="depo_ad" ValueField="depo_kod"></PropertiesComboBox>
    </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataComboBoxColumn FieldName="Kategori_no" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Kategori">
        <PropertiesComboBox DataSourceID="dsKategori" TextField="kategori_adi" ValueField="kategori_no"></PropertiesComboBox>
    </dx:GridViewDataComboBoxColumn>
</Columns>

               <TotalSummary>
                   <dx:ASPxSummaryItem FieldName="Tutar" ShowInColumn="Tutar" SummaryType="Sum" />
               </TotalSummary>
</dx:ASPxGridView>

<asp:SqlDataSource ID="dsIrsaliye" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" DeleteCommand="DELETE FROM [Irsaliye] WHERE [id] = @id" InsertCommand="INSERT INTO [Irsaliye] ([İrsaliye_No], [Tarih], [birim_fiyat], [Miktar], [Tutar], [Depo_Kod], [Satıcıvkn], [Kategori_no], [Urun_adi]) VALUES (@İrsaliye_No, @Tarih, @birim_fiyat, @Miktar, @Tutar, @Depo_Kod, @Satıcıvkn, @Kategori_no, @Urun_adi)" SelectCommand="SELECT * FROM [Irsaliye]" UpdateCommand="UPDATE [Irsaliye] SET [İrsaliye_No] = @İrsaliye_No, [Tarih] = @Tarih, [birim_fiyat] = @birim_fiyat, [Miktar] = @Miktar, [Tutar] = @Tutar, [Depo_Kod] = @Depo_Kod, [Satıcıvkn] = @Satıcıvkn, [Kategori_no] = @Kategori_no, [Urun_adi] = @Urun_adi WHERE [id] = @id">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="İrsaliye_No" Type="Int32" />
        <asp:Parameter DbType="Date" Name="Tarih" />
        <asp:Parameter Name="birim_fiyat" Type="Int64" />
        <asp:Parameter Name="Miktar" Type="Int32" />
        <asp:Parameter Name="Tutar" Type="Int64" />
        <asp:Parameter Name="Depo_Kod" Type="Int32" />
        <asp:Parameter Name="Satıcıvkn" Type="String" />
        <asp:Parameter Name="Kategori_no" Type="Int32" />
        <asp:Parameter Name="Urun_adi" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="İrsaliye_No" Type="Int32" />
        <asp:Parameter DbType="Date" Name="Tarih" />
        <asp:Parameter Name="birim_fiyat" Type="Int64" />
        <asp:Parameter Name="Miktar" Type="Int32" />
        <asp:Parameter Name="Tutar" Type="Int64" />
        <asp:Parameter Name="Depo_Kod" Type="Int32" />
        <asp:Parameter Name="Satıcıvkn" Type="String" />
        <asp:Parameter Name="Kategori_no" Type="Int32" />
        <asp:Parameter Name="Urun_adi" Type="String" />
        <asp:Parameter Name="id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="dsKategori" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT * FROM [Stok_Kategori]"></asp:SqlDataSource>

<asp:SqlDataSource ID="dsDepo" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT * FROM [Depo]"></asp:SqlDataSource>

<asp:SqlDataSource ID="dsSatıcı" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT [satici_vkn], [satici_ad] FROM [Satici]"></asp:SqlDataSource>

 <div class="container mt-3" style="display:flex; align-items:flex-end;">
           <asp:ImageButton ID="btnxlsirsl" runat="server" ImageUrl="İmage/excelicon.png" Width="30" Height="30" OnClick="btnxlsirsl_Click"/>
            
    <asp:ImageButton ID="pdfbtnirs" Class="ml-3" runat="server" ImageUrl="İmage/pdf.png" Width="30" Height="30" OnClick="pdfbtnirs_Click"/>
          
        <div class="col-auto" style="margin-right: 130vh;">
            <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="ASPxGridView1" />
        </div>
      
        </div>
     

        </div>
      

      <!--Irsaliye Modal -->
 <div class="modal fade" id="irsModal" tabindex="-1" role="dialog" aria-labelledby="irsModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="irsLabel">Irsaliye Ekle</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
           <div class="modal-body">
    <div class="form-group">
        <div class="form-row">
            <div class="col">
                <label for="txtIrsNo">İrsaliye Numarası</label>
                <asp:TextBox ID="txtIrsNo" class="form-control" style="width:100%;" runat="server"></asp:TextBox>
            </div>
            <div class="col">
                <label for="txtTarih">Tarih</label>
                <asp:TextBox ID="txtTarih" class="form-control" style="width:100%;" runat="server" TextMode="Date"></asp:TextBox>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <label for="txtBirimFiyat">Birim Fiyat</label>
                <asp:TextBox ID="txtBirimFiyat" class="form-control" style="width:100%;" runat="server"></asp:TextBox>
            </div>
            <div class="col">
                <label for="txtMiktar">Miktar</label>
                <asp:TextBox ID="txtMiktar" class="form-control" style="width:100%;" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <label for="ddlDepo" style="display: block;">Depo</label>
                <asp:DropDownList ID="ddlDepo" runat="server" style="width:100%;" DataSourceID="SqlDataSource2" DataTextField="depo_ad" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server"  ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT * FROM [Depo]"></asp:SqlDataSource>
            </div>
            <div class="col">
                <label for="ddlTedarikci" style="display: block;">Tedarikçi</label>
                <asp:DropDownList ID="ddlTedarikci" runat="server" style="width:100%;" DataSourceID="dsSatici" DataTextField="satici_ad" DataValueField="satici_vkn"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT [satici_vkn], [satici_ad] FROM [Satici]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="form-row">
            <div class="col">
                <label for="ddlKategori" style="display: block;">Kategori</label>
                <asp:DropDownList ID="ddlKategori" runat="server" style="width:100%;" DataSourceID="SqlDataSource1" DataTextField="kategori_adi" DataValueField="id"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT * FROM [Stok_Kategori]"></asp:SqlDataSource>
            </div>
            <div class="col">
                <label for="txtUrunAdi" style="display: block;">Ürün Adı</label>
                <asp:TextBox ID="txtUrunAdi" class="form-control" style="width:100%;" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>
</div>


         
            <div class="modal-body d-flex flex-column align-items-center">

              

            <div class="modal-footer d-flex justify-content-center">
                <asp:Button ID="btnirs" class="btn btn-success"  runat="server" Text="Kaydet" OnClick="btnirs_Click" />
                <button class="btn btn-primary" type="button" data-dismiss="modal">Kapat</button>
            </div>
        </div>
    </div>
</div>                     

 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT * FROM [Stok_Kategori]"></asp:SqlDataSource>
   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT * FROM [Depo]"></asp:SqlDataSource>
   <asp:SqlDataSource ID="dsSatici" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT [satici_vkn], [satici_ad] FROM [Satici]"></asp:SqlDataSource>



</asp:Content>
