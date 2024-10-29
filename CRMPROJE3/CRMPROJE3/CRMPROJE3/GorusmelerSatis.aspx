<%@ Page Title="" Language="C#" MasterPageFile="~/Satis.Master" AutoEventWireup="true" CodeBehind="GorusmelerSatis.aspx.cs" Inherits="CRMPROJE3.GorusmelerSatis" %>
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
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


  <dx:ASPxGridView ID="gvGorusmeler" runat="server" AutoGenerateColumns="False" DataSourceID="dsGorusmeler" KeyFieldName="Gorusme_Id" Theme="iOS" Width="100%">
    <SettingsEditing Mode="Batch">
    </SettingsEditing>
    <Settings ShowGroupPanel="True" ShowHeaderFilterButton="True" />
    <SettingsPopup>
        <FilterControl AutoUpdatePosition="False"></FilterControl>
    </SettingsPopup>
    <SettingsSearchPanel Visible="True" />
    <Columns>
        <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="Gorusme_Id" ReadOnly="True" VisibleIndex="1" Caption="Görüşme ID">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="Tarih" VisibleIndex="2" Caption="Tarih">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="Bitis_Tarihi" VisibleIndex="3" Caption="Bitiş Tarihi">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn FieldName="Firma_Id" VisibleIndex="4" Caption="Firma/Tedarikçi ">
            <PropertiesComboBox DataSourceID="dsFirmaTedarikci" ValueField="ID" TextField="Ad">
                <Columns>
                    <dx:ListBoxColumn FieldName="Ad" Caption="Ad" />
                    <dx:ListBoxColumn FieldName="Tip" Caption="Tip" />
                </Columns>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="Kisi" VisibleIndex="5" Caption="Kişi">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn FieldName="Tur" VisibleIndex="6" Caption="Tür">
            <PropertiesComboBox>
                <Items>
                    <dx:ListEditItem Text="Yüz yüze" Value="Yüz yüze" />
                    <dx:ListEditItem Text="Telefon" Value="Telefon" />
                    <dx:ListEditItem Text="E-Mail" Value="E-Mail" />
                    <dx:ListEditItem Text="Video Konferans" Value="Video Konferans" />
                </Items>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
          <dx:GridViewDataComboBoxColumn FieldName="Oncelik" VisibleIndex="4" Caption="Öncelik">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="En Düşük" Value="En Düşük" />
                                    <dx:ListEditItem Text="Düşük" Value="Düşük" />
                                    <dx:ListEditItem Text="Normal" Value="Normal" />
                                    <dx:ListEditItem Text="Yüksek" Value="Yüksek" />
                                    <dx:ListEditItem Text="En Yüksek" Value="En Yüksek" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
       <dx:GridViewDataComboBoxColumn FieldName="Personel_Id" VisibleIndex="8" Caption="Personel">
            <PropertiesComboBox DataSourceID="dsPersonel" ValueField="id" TextField="FullName">
                <Columns>
                    <dx:ListBoxColumn FieldName="FullName" Caption="Personel" />
                </Columns>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
         <dx:GridViewDataComboBoxColumn FieldName="Aktivite" VisibleIndex="9" Caption="Aktivite">
            <PropertiesComboBox>
                <Items>
                    <dx:ListEditItem Text="Toplantı" Value="Toplantı" />
                    <dx:ListEditItem Text="Sunum" Value="Sunum" />
                    <dx:ListEditItem Text="Eğitim" Value="Eğitim" />
                    <dx:ListEditItem Text="Seminer" Value="Seminer" />
                    <dx:ListEditItem Text="Ziyaret" Value="Ziyaret" />
                    <dx:ListEditItem Text="Diğer" Value="Diğer" />
                    <dx:ListEditItem Text="Görüşme Tamamlandı" Value="Görüşme Tamamlandı" />
                </Items>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="Aciklama" VisibleIndex="10" Caption="Açıklama">
        </dx:GridViewDataTextColumn>
    </Columns>
</dx:ASPxGridView>


<asp:SqlDataSource ID="dsFirmaTedarikci" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>"
    SelectCommand="
        SELECT Firma_ID AS ID, Firma_Adı AS Ad, 'Musteri' AS Tip FROM FirmaMusteri
        UNION ALL
        SELECT id AS ID, Firma_Ad AS Ad, 'Tedarikci' AS Tip FROM Tedarikci">
</asp:SqlDataSource>



    <asp:SqlDataSource ID="dsGorusmeler" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" DeleteCommand="DELETE FROM [Gorusmeler] WHERE [Gorusme_Id] = @Gorusme_Id" InsertCommand="INSERT INTO [Gorusmeler] ([Tarih], [Bitis_Tarihi], [Firma_Id], [Kisi], [Tur], [Oncelik], [Personel_Id], [Aktivite], [Aciklama]) VALUES (@Tarih, @Bitis_Tarihi, @Firma_Id, @Kisi, @Tur, @Oncelik, @Personel_Id, @Aktivite, @Aciklama)" SelectCommand="SELECT * FROM [Gorusmeler]" UpdateCommand="UPDATE [Gorusmeler] SET [Tarih] = @Tarih, [Bitis_Tarihi] = @Bitis_Tarihi, [Firma_Id] = @Firma_Id, [Kisi] = @Kisi, [Tur] = @Tur, [Oncelik] = @Oncelik, [Personel_Id] = @Personel_Id, [Aktivite] = @Aktivite, [Aciklama] = @Aciklama WHERE [Gorusme_Id] = @Gorusme_Id">
        <DeleteParameters>
            <asp:Parameter Name="Gorusme_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Tarih" Type="DateTime" />
            <asp:Parameter Name="Bitis_Tarihi" Type="DateTime" />
            <asp:Parameter Name="Firma_Id" Type="Int32" />
            <asp:Parameter Name="Kisi" Type="String" />
            <asp:Parameter Name="Tur" Type="String" />
            <asp:Parameter Name="Oncelik" Type="String" />
            <asp:Parameter Name="Personel_Id" Type="Int32" />
            <asp:Parameter Name="Aktivite" Type="String" />
            <asp:Parameter Name="Aciklama" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Tarih" Type="DateTime" />
            <asp:Parameter Name="Bitis_Tarihi" Type="DateTime" />
            <asp:Parameter Name="Firma_Id" Type="Int32" />
            <asp:Parameter Name="Kisi" Type="String" />
            <asp:Parameter Name="Tur" Type="String" />
            <asp:Parameter Name="Oncelik" Type="String" />
            <asp:Parameter Name="Personel_Id" Type="Int32" />
            <asp:Parameter Name="Aktivite" Type="String" />
            <asp:Parameter Name="Aciklama" Type="String" />
            <asp:Parameter Name="Gorusme_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    
<asp:SqlDataSource ID="dsPersonel" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" 
    SelectCommand="SELECT [id], [Ad] + ' ' + [Soyad] AS FullName FROM [Personel]">
</asp:SqlDataSource>

    




                

                               



 <asp:SqlDataSource ID="dsSozlesmeler" runat="server" 
     ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" 
     DeleteCommand="DELETE FROM [Sozlesme] WHERE [Sozlesme_Id] = @Sozlesme_Id" 
     InsertCommand="INSERT INTO [Sozlesme] ([Baslangic_Tarih], [Firma_Id], [Oncelik], [Sozlesme_Turu], [Durumu], [Imza_Tarihi], [Yenileme_Tarihi]) VALUES (@Baslangic_Tarih, @Firma_Id, @Oncelik, @Sozlesme_Turu, @Durumu, @Imza_Tarihi, @Yenileme_Tarihi)" 
     SelectCommand="SELECT * FROM [Sozlesme]" 
     UpdateCommand="UPDATE [Sozlesme] SET [Baslangic_Tarih] = @Baslangic_Tarih, [Firma_Id] = @Firma_Id, [Oncelik] = @Oncelik, [Sozlesme_Turu] = @Sozlesme_Turu, [Durumu] = @Durumu, [Imza_Tarihi] = @Imza_Tarihi, [Yenileme_Tarihi] = @Yenileme_Tarihi WHERE [Sozlesme_Id] = @Sozlesme_Id">
     <DeleteParameters>
         <asp:Parameter Name="Sozlesme_Id" Type="Int32" />
     </DeleteParameters>
     <InsertParameters>
         <asp:Parameter Name="Baslangic_Tarih" Type="DateTime" />
         <asp:Parameter Name="Firma_Id" Type="Int32" />
         <asp:Parameter Name="Oncelik" Type="String" />
         <asp:Parameter Name="Sozlesme_Turu" Type="String" />
         <asp:Parameter Name="Durumu" Type="String" />
         <asp:Parameter Name="Imza_Tarihi" Type="DateTime" />
         <asp:Parameter DbType="Date" Name="Yenileme_Tarihi" />
     </InsertParameters>
     <UpdateParameters>
         <asp:Parameter Name="Baslangic_Tarih" Type="DateTime" />
         <asp:Parameter Name="Firma_Id" Type="Int32" />
         <asp:Parameter Name="Oncelik" Type="String" />
         <asp:Parameter Name="Sozlesme_Turu" Type="String" />
         <asp:Parameter Name="Durumu" Type="String" />
         <asp:Parameter Name="Imza_Tarihi" Type="DateTime" />
         <asp:Parameter DbType="Date" Name="Yenileme_Tarihi" />
         <asp:Parameter Name="Sozlesme_Id" Type="Int32" />
     </UpdateParameters>
 </asp:SqlDataSource>
              <style>
                  /* Özel genişlik sınıfı */
.modal-lg-custom {
    max-width: 80%; /* Burada istediğiniz genişliği ayarlayabilirsiniz */
    
}

.modal-body-custom {
    max-height: 500px; /* Modalın yüksekliğini de ayarlayabilirsiniz */
    overflow-y: auto; /* İçeriğin taşması durumunda kaydırma çubuğu eklemek için */
}

              </style>
    
                <!--Sözleşme Modal -->
               <div class="modal fade" id="SozlesmeModal" tabindex="-1" role="dialog" aria-labelledby="SozlesmeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg-custom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="SozlesmeModalLabel">Sözleşme Ekle</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body modal-body-custom d-flex flex-column align-items-center">
                <dx:ASPxGridView ID="gvSozlesmeler" runat="server" AutoGenerateColumns="False" DataSourceID="dsSozlesmeler" KeyFieldName="Sozlesme_Id" Theme="iOS" Width="100%">
                    <SettingsEditing Mode="Batch" />

                    <Settings ShowGroupPanel="True" />
                    <SettingsPopup>
                        <FilterControl AutoUpdatePosition="False" />
                    </SettingsPopup>
                    <SettingsSearchPanel Visible="True" />
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" />
                        <dx:GridViewDataTextColumn FieldName="Sozlesme_Id" ReadOnly="True" VisibleIndex="1" Caption="Sözleşme İD">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Baslangic_Tarih" VisibleIndex="2" Caption="Başlangıç Tarihi" />
                        <dx:GridViewDataComboBoxColumn FieldName="Firma_Id" VisibleIndex="3" Caption="Firma/Tedarikçi">
                            <PropertiesComboBox DataSourceID="dsFirmaTedarikci" ValueField="ID" TextField="Ad">
                                <Columns>
                                    <dx:ListBoxColumn FieldName="Ad" Caption="Ad" />
                                    <dx:ListBoxColumn FieldName="Tip" Caption="Tip" />
                                </Columns>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Oncelik" VisibleIndex="4" Caption="Öncelik">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="En Düşük" Value="En Düşük" />
                                    <dx:ListEditItem Text="Düşük" Value="Düşük" />
                                    <dx:ListEditItem Text="Normal" Value="Normal" />
                                    <dx:ListEditItem Text="Yüksek" Value="Yüksek" />
                                    <dx:ListEditItem Text="En Yüksek" Value="En Yüksek" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Sozlesme_Turu" VisibleIndex="5" Caption="Sözleşme Türü">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="Satış Sözleşmesi" Value="Satış Sözleşmesi" />
                                    <dx:ListEditItem Text="Hizmet Sözleşmesi" Value="Hizmet Sözleşmesi" />
                                    <dx:ListEditItem Text="Tedarik Sözleşmesi" Value="Tedarik Sözleşmesi" />
                                    <dx:ListEditItem Text="İş Sözleşmesi" Value="İş Sözleşmesi" />
                                    <dx:ListEditItem Text="Taşıma Sözleşmesi" Value="Taşıma Sözleşmesi" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Durumu" VisibleIndex="6">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="Reddedildi" Value="Normal" />
                                    <dx:ListEditItem Text="Teklif Bekleniyor" Value="En Düşük" />
                                    <dx:ListEditItem Text="İmza Bekleniyor" Value="Düşük" />
                                    <dx:ListEditItem Text="Tamamlandı" Value="Yüksek" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataDateColumn FieldName="Imza_Tarihi" VisibleIndex="7" Caption="İmza Tarihi" />
                        <dx:GridViewDataDateColumn FieldName="Yenileme_Tarihi" VisibleIndex="8" Caption="Yenileme Tarihi" />
                    </Columns>
                </dx:ASPxGridView>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button class="btn btn-primary" type="button" data-dismiss="modal">Kapat</button>
            </div>
        </div>
    </div>
</div>

</asp:Content>