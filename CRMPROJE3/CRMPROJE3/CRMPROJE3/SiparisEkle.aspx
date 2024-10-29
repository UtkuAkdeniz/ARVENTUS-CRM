<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="SiparisEkle.aspx.cs" Inherits="CRMPROJE3.SiparisEkle" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
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
        .grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  
   /* Scroll eklenecek yükseklik */
  overflow-y: auto; /* Yatay kaydırma çubuğunu göster */
  margin-bottom: 5vh;
}

.grid-item {
  background-color: #ddd;
  padding: 20px;
  text-align: center;
}

    </style>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/CSS/responsive.css"> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  


     <div class="row">
                    <div class="col-md-6">

                        <label for="TxtTarih">Tarih</label>
                      <asp:TextBox ID="TxtTarih" runat="server" TextMode="Date" CssClass="form-control mb-3"></asp:TextBox>
                        
                        <label for="TxtTeslimTarihi">Teslim Tarihi</label>
                       <asp:TextBox ID="TxtTeslimTarihi" runat="server" TextMode="Date" CssClass="form-control mb-3"></asp:TextBox>

                        <label for="TxtFirmaId">Firma ID</label>
                        <asp:DropDownList ID="FirmaAdiDropDown" runat="server" DataSourceID="DSFirmaDropDown" DataTextField="Firma_Adı" DataValueField="firma_ID" style="height:10%;width:100%;" AutoPostBack="True" OnSelectedIndexChanged="FirmaVKNDropDownGuncelleme" OnTextChanged="FirmaVKNDropDownGuncelleme"></asp:DropDownList>

                            <asp:SqlDataSource ID="DSFirmaDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT [firma_ID], [Firma_Adı], [Vkn] FROM [FirmaMusteri]"></asp:SqlDataSource>
                        
                        
                        
                          
                      
                        
                        
                        
                        
                        
                        <label for="TxtFirmaVKN">Firma VKN</label>
                        <asp:DropDownList ID="FirmaVKNDropDown" runat="server" DataSourceID="DSFirmaDropDown" DataTextField="Vkn" DataValueField="firma_ID" style="height:10%;width:100%;" OnSelectedIndexChanged="FirmaAdiDropDownGuncelleme" AutoPostBack="True" OnTextChanged="FirmaAdiDropDownGuncelleme"></asp:DropDownList>
                        
                          <label for="TxtAdres" >Adres</label>
<asp:TextBox ID="TxtAdres" runat="server" CssClass="form-control mb-3" Style= "Width:100%;" ></asp:TextBox> 

                    </div>
                    <div class="col-md-6">
                        <label for="TxtSozlesmeId">Sözleşme ID</label>
                        <dx:ASPxTextBox ID="TxtSozlesmeId" runat="server" CssClass="form-control mb-3"></dx:ASPxTextBox>

                         <label for="TxtOncelik">Öncelik</label>
                     <asp:DropDownList ID="OncelikDDL" runat="server" style="height:10%;width:100%;" DataSourceID="DSOncelik" DataTextField="Oncelik_Adi" AppendDataBoundItems="True" DataValueField="Oncelik_Kodu">
   
</asp:DropDownList>
                        <asp:SqlDataSource ID="DSOncelik" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT [Oncelik_Adi], [Oncelik_Kodu] FROM [Siparis_Oncelik]"></asp:SqlDataSource>
                        
                        <label for="TxtStokKodu">Stok Kodu</label>
                        <asp:DropDownList ID="StokDDL" runat="server" style="height:10%;width:100%;" AutoPostBack="True" OnTextChanged="SatısUcretiGuncelleme" OnSelectedIndexChanged="SatısUcretiGuncelleme" DataSourceID="DSStok" DataTextField="stok_adi" DataValueField="Id" OnPreRender="SatısUcretiGuncelleme"></asp:DropDownList> 

                       

                        <asp:SqlDataSource ID="DSStok" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT [Id], [stok_adi] FROM [Stok]"></asp:SqlDataSource>

                       

                        <label for="TxtSatisUcreti">Satış Ücreti</label>
                        <dx:ASPxTextBox ID="TxtSatisUcreti" runat="server" CssClass="form-control mb-3"></dx:ASPxTextBox>
                        
                        <label for="TxtUrunAdet">Ürün Adet</label>
                        <dx:ASPxTextBox ID="TxtUrunAdet" runat="server" CssClass="form-control mb-3"></dx:ASPxTextBox>

                    </div>
                </div>
                      


    <div style="text-align: center ;margin-top: 2%;  height: 80px;">
    <dx:ASPxButton ID="KAYIT_Ekle" runat="server" Text="Sipariş Ekle " OnClick="KAYIT_Ekle_Click" PostBackUrl="~/SiparisEkle.aspx" Theme="iOS" style="width: 25%; height:70%; border-radius:3000px;"  ></dx:ASPxButton>
</div>


    <div class="grid-container">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="DSZiparis" AutoGenerateColumns="False"  KeyFieldName="Siparis_Id" Theme="IOS" Width="70%" HorizontalAlign="Center">
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
        <Settings ShowGroupPanel="True" ShowHeaderFilterButton="True" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Siparis_Id" ReadOnly="True" VisibleIndex="1" Caption="Sipariş ID">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Tarih" VisibleIndex="2" Caption="Tarih">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Teslim_Tarihi" VisibleIndex="3" Caption="Teslim Tarihi">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Sozlesme_Id" VisibleIndex="7" Caption="Sözleşme ID">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Urun_Adet" VisibleIndex="9" Caption="Ürün Adeti">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Satis_Ucreti" VisibleIndex="10" Caption="Satış Ücreti">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="11" Caption="Tutar">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Adres" VisibleIndex="12" Caption="Adres">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Fatura_Numarasi" VisibleIndex="13" Caption="Fatura Numarası">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn Caption="Öncelik" FieldName="Oncelik" VisibleIndex="6">
                                <PropertiesComboBox DataSourceID="DSOncelik" TextField="Oncelik_Adi" ValueField="Oncelik_Kodu">
<Items>
    <dx:ListEditItem Text="En Düşük" Value="En Düşük" />
    <dx:ListEditItem Text="Düşük" Value="Düşük" />
    <dx:ListEditItem Text="Normal" Value="Normal" />
    <dx:ListEditItem Text="Yüksek" Value="Yüksek" />
    <dx:ListEditItem Text="En Yüksek" Value="En Yüksek" />
</Items>
    </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Firma ID" FieldName="Firma_Id" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="DSFirmaDropDown" TextField="Firma_Adı" ValueField="firma_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Stok Kodu" FieldName="Stok_Kodu" VisibleIndex="8">
                <PropertiesComboBox DataSourceID="DSStok" TextField="stok_adi" ValueField="Id">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Firma VKN" FieldName="Firma_VKN" ReadOnly="True" VisibleIndex="5">
                <PropertiesComboBox DataSourceID="DSFirmaDropDown" TextField="Vkn" ValueField="firma_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="DSZiparis" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" DeleteCommand="DELETE FROM [Siparis] WHERE [Siparis_Id] = @Siparis_Id" InsertCommand="INSERT INTO [Siparis] ([Tarih], [Teslim_Tarihi], [Firma_Id], [Firma_VKN], [Oncelik], [Sozlesme_Id], [Stok_Kodu], [Urun_Adet], [Satis_Ucreti], [Tutar], [Adres], [Fatura_Numarasi]) VALUES (@Tarih, @Teslim_Tarihi, @Firma_Id, @Firma_VKN, @Oncelik, @Sozlesme_Id, @Stok_Kodu, @Urun_Adet, @Satis_Ucreti, @Tutar, @Adres, @Fatura_Numarasi)" SelectCommand="SELECT * FROM [Siparis]" UpdateCommand="UPDATE [Siparis] SET [Tarih] = @Tarih, [Teslim_Tarihi] = @Teslim_Tarihi, [Firma_Id] = @Firma_Id, [Firma_VKN] = @Firma_VKN, [Oncelik] = @Oncelik, [Sozlesme_Id] = @Sozlesme_Id, [Stok_Kodu] = @Stok_Kodu, [Urun_Adet] = @Urun_Adet, [Satis_Ucreti] = @Satis_Ucreti, [Tutar] = @Tutar, [Adres] = @Adres, [Fatura_Numarasi] = @Fatura_Numarasi WHERE [Siparis_Id] = @Siparis_Id">
        <DeleteParameters>
            <asp:Parameter Name="Siparis_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="Tarih" />
            <asp:Parameter DbType="Date" Name="Teslim_Tarihi" />
            <asp:Parameter Name="Firma_Id" Type="Int32" />
            <asp:Parameter Name="Firma_VKN" Type="String" />
            <asp:Parameter Name="Oncelik" Type="String" />
            <asp:Parameter Name="Sozlesme_Id" Type="Int32" />
            <asp:Parameter Name="Stok_Kodu" Type="Int32" />
            <asp:Parameter Name="Urun_Adet" Type="Int32" />
            <asp:Parameter Name="Satis_Ucreti" Type="Decimal" />
            <asp:Parameter Name="Tutar" Type="Decimal" />
            <asp:Parameter Name="Adres" Type="String" />
            <asp:Parameter Name="Fatura_Numarasi" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="Tarih" />
            <asp:Parameter DbType="Date" Name="Teslim_Tarihi" />
            <asp:Parameter Name="Firma_Id" Type="Int32" />
            <asp:Parameter Name="Firma_VKN" Type="String" />
            <asp:Parameter Name="Oncelik" Type="String" />
            <asp:Parameter Name="Sozlesme_Id" Type="Int32" />
            <asp:Parameter Name="Stok_Kodu" Type="Int32" />
            <asp:Parameter Name="Urun_Adet" Type="Int32" />
            <asp:Parameter Name="Satis_Ucreti" Type="Decimal" />
            <asp:Parameter Name="Tutar" Type="Decimal" />
            <asp:Parameter Name="Adres" Type="String" />
            <asp:Parameter Name="Fatura_Numarasi" Type="String" />
            <asp:Parameter Name="Siparis_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        </div>
        
</asp:Content>
