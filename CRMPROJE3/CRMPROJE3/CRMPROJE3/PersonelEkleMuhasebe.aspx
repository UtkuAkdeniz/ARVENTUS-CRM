<%@ Page Title="" Language="C#" MasterPageFile="~/Muhasebe.Master" AutoEventWireup="true" CodeBehind="PersonelEkleMuhasebe.aspx.cs" Inherits="CRMPROJE3.PersonelEkleMuhasebe" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" type="text/css" href="/CSS/style.css">
    <style>
        #gridContainer {
            overflow-y: hidden;
            white-space: nowrap;
            width: 100%;
            max-width: 100%;
        }

        #gridContainer .dxgvHeaderPanel_Office365 {
            overflow-x: hidden;
        }

        #gridContainer .dxgvTable_Office365 {
            display: inline-block;
            white-space: nowrap;
        }

        .convertText {
            color: green;
        }
             
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
         </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <div>
        <div id="gridContainer">
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsPersonel" KeyFieldName="id" Theme="IOS" EnableTheming="True" Width="100%">
                <SettingsEditing Mode="Batch"></SettingsEditing>
                <Settings ShowGroupPanel="True" ShowHeaderFilterButton="True" />
                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
                <SettingsSearchPanel Visible="True" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Personel_Numarası" VisibleIndex="1" ShowInCustomizationForm="True" Caption="Personel Numarası"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Ad" VisibleIndex="2" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Soyad" VisibleIndex="3" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="Cinsiyet" VisibleIndex="4" ShowInCustomizationForm="True" Caption="Cinsiyet">
                        <PropertiesComboBox>
                            <Items>
                                <dx:ListEditItem Text="Erkek" Value="Erkek" />
                                <dx:ListEditItem Text="Kadın" Value="Kadın" />
                            </Items>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn FieldName="Dogum_tarihi" VisibleIndex="5" ShowInCustomizationForm="True" Caption="Doğum Tarihi"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="Baslama_Tarihi" VisibleIndex="6" ShowInCustomizationForm="True" Caption="Başlama Tarihi"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="Departman_Numara" VisibleIndex="7" ShowInCustomizationForm="True" Caption="Departman">
                        <PropertiesComboBox DataSourceID="dsDepartman" TextField="Departman_Adı" ValueField="Departman_Numara" ValueType="System.Int32" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="Telefon_Numarası" VisibleIndex="8" ShowInCustomizationForm="True" Caption="Telefon Numarası"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="9" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Maasi" VisibleIndex="10" ShowInCustomizationForm="True" Caption="Maaş"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="11" ShowInCustomizationForm="True" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0"></dx:GridViewCommandColumn>
                </Columns>
                <Settings ShowGroupPanel="True" ShowHeaderFilterButton="True" />
                <SettingsExport EnableClientSideExportAPI="true" />
            </dx:ASPxGridView>
        </div>
        <asp:SqlDataSource ID="dsPersonel" runat="server"
            ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>"
            SelectCommand="SELECT [id], [Personel_Numarası], [Ad], [Soyad], [Cinsiyet], [Dogum_tarihi], [Baslama_Tarihi], [Departman_Numara], [Telefon_Numarası], [Email], [Maasi] FROM [Personel]"
            InsertCommand="INSERT INTO [Personel] ([Personel_Numarası], [Ad], [Soyad], [Cinsiyet], [Dogum_tarihi], [Baslama_Tarihi], [Departman_Numara], [Telefon_Numarası], [Email], [Maasi]) VALUES (@Personel_Numarası, @Ad, @Soyad, @Cinsiyet, @Dogum_tarihi, @Baslama_Tarihi, @Departman_Numara, @Telefon_Numarası, @Email, @Maasi)"
            UpdateCommand="UPDATE [Personel] SET [Personel_Numarası] = @Personel_Numarası, [Ad] = @Ad, [Soyad] = @Soyad, [Cinsiyet] = @Cinsiyet, [Dogum_tarihi] = @Dogum_tarihi, [Baslama_Tarihi] = @Baslama_Tarihi, [Departman_Numara] = @Departman_Numara, [Telefon_Numarası] = @Telefon_Numarası, [Email] = @Email, [Maasi] = @Maasi WHERE [id] = @id">
            <UpdateParameters>
                <asp:Parameter Name="Personel_Numarası" Type="String" />
                <asp:Parameter Name="Ad" Type="String" />
                <asp:Parameter Name="Soyad" Type="String" />
                <asp:Parameter Name="Cinsiyet" Type="String" />
                <asp:Parameter Name="Dogum_tarihi" Type="DateTime" />
                <asp:Parameter Name="Baslama_Tarihi" Type="DateTime" />
                <asp:Parameter Name="Departman_Numara" Type="Int32" />
                <asp:Parameter Name="Telefon_Numarası" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Maasi" Type="Decimal" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsDepartman" runat="server"
            ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>"
            SelectCommand="SELECT [Departman_Numara], [Departman_Adı] FROM [Departman]">
        </asp:SqlDataSource>
    </div>
    <div class="container mt-3">
        <asp:ImageButton ID="excelImageButton" runat="server" ImageUrl="İmage/excelicon.png" Width="30" Height="30" OnClick="excelbuton_Click1" />
        <asp:ImageButton ID="pdfImageButton" runat="server" ImageUrl="İmage/pdf.png" Width="30" Height="30" OnClick="pdfbuton_Click1" />
        <div class="row">
            <div class="col-auto" style="margin-right: 125vh;">
                <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="ASPxGridView1" />
            </div>
        </div>
    </div>
</asp:Content>
