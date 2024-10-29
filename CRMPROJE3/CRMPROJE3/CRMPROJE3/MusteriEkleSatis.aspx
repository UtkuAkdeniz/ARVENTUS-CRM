<%@ Page Title="" Language="C#" MasterPageFile="~/Satis.Master" AutoEventWireup="true" CodeBehind="MusteriEkleSatis.aspx.cs" Inherits="CRMPROJE3.MusteriEkleSatis" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <div >
    <dx:ASPxGridView ID="MusteriGridView" runat="server" AutoGenerateColumns="False" DataSourceID="dsMusteri" KeyFieldName="firma_ID" Theme="IOS" Width="100%">
        <SettingsEditing Mode="EditForm">
        </SettingsEditing>
        <Settings ShowGroupPanel="True" ShowHeaderFilterButton="True" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="firma_ID" ReadOnly="True" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Firma_Adı" VisibleIndex="3" Caption="Firma Adı"> 
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Ad" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Soyad" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="telefon_numarası" VisibleIndex="6" Caption="Telefon Numarası">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Oluşturulma_Tarihi" VisibleIndex="8" Caption="Oluşturma Tarihi">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Adres" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Vkn" VisibleIndex="10" Caption="Tck/Vkn">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Tuketici_Tipi" VisibleIndex="2" ShowInCustomizationForm="True" Caption="Müşteri Tipi">
                 <PropertiesComboBox DataSourceID="dsMusteriTipi" TextField="Tuketici_Adi" ValueField="Tuketici_Tipi" ValueType="System.Int32"/>
            </dx:GridViewDataComboBoxColumn>
           
        </Columns>
    </dx:ASPxGridView>



    <asp:SqlDataSource ID="dsMusteri" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" DeleteCommand="DELETE FROM [FirmaMusteri] WHERE [firma_ID] = @firma_ID" InsertCommand="INSERT INTO [FirmaMusteri] ([Tuketici_Tipi], [Firma_Adı], [Ad], [Soyad], [telefon_numarası], [Email], [Oluşturulma_Tarihi], [Adres], [Vkn]) VALUES (@Tuketici_Tipi, @Firma_Adı, @Ad, @Soyad, @telefon_numarası, @Email, @Oluşturulma_Tarihi, @Adres, @Vkn)" SelectCommand="SELECT * FROM [FirmaMusteri]" UpdateCommand="UPDATE [FirmaMusteri] SET [Tuketici_Tipi] = @Tuketici_Tipi, [Firma_Adı] = @Firma_Adı, [Ad] = @Ad, [Soyad] = @Soyad, [telefon_numarası] = @telefon_numarası, [Email] = @Email, [Oluşturulma_Tarihi] = @Oluşturulma_Tarihi, [Adres] = @Adres, [Vkn] = @Vkn WHERE [firma_ID] = @firma_ID">
        <DeleteParameters>
            <asp:Parameter Name="firma_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Tuketici_Tipi" Type="String" />
            <asp:Parameter Name="Firma_Adı" Type="String" />
            <asp:Parameter Name="Ad" Type="String" />
            <asp:Parameter Name="Soyad" Type="String" />
            <asp:Parameter Name="telefon_numarası" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter DbType="Date" Name="Oluşturulma_Tarihi" />
            <asp:Parameter Name="Adres" Type="String" />
            <asp:Parameter Name="Vkn" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Tuketici_Tipi" Type="String" />
            <asp:Parameter Name="Firma_Adı" Type="String" />
            <asp:Parameter Name="Ad" Type="String" />
            <asp:Parameter Name="Soyad" Type="String" />
            <asp:Parameter Name="telefon_numarası" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter DbType="Date" Name="Oluşturulma_Tarihi" />
            <asp:Parameter Name="Adres" Type="String" />
            <asp:Parameter Name="Vkn" Type="String" />
            <asp:Parameter Name="firma_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsMusteriTipi" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT * FROM [Musteri_Tipi]">
</asp:SqlDataSource>
            
        </div >

      <div class="container mt-3" style="display:flex; align-items:flex-end;">
          
      <asp:ImageButton ID="excelbutonmst" runat="server" ImageUrl="İmage/excelicon.png" Width="30" Height="30"  OnClick="excelbutonstok_Click"/>
            
    <asp:ImageButton ID="pdfbutonstokmst" runat="server" ImageUrl="İmage/pdf.png" Width="30" Height="30" OnClick="pdfbutonstok_Click"/>
          
        <div class="col-auto" style="margin-right: 115vh;">
            <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="ASPxGridView1" />
        </div>
       
        </div>


</asp:Content>
