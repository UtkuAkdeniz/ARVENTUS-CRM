<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Tedarikci.aspx.cs" Inherits="CRMPROJE3.Tedarikci" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="CSS\responsive.css" />
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

    <div >

            <dx:ASPxGridView ID="Gvtedarik" runat="server" AutoGenerateColumns="False" DataSourceID="dsTedarikci" EnableTheming="True" KeyFieldName="id" Theme="IOS" Width="100%">
                <SettingsEditing Mode="Batch">
                </SettingsEditing>
                <Settings ShowGroupPanel="True" ShowHeaderFilterButton="True" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                <SettingsSearchPanel Visible="True" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="1" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="vkn" VisibleIndex="2" Caption="VKN/ TCKN">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Firma_Ad" VisibleIndex="3" Caption="Firma Adı/ Ad">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Telefon" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="5" Caption="E-Mail">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Adres" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="Oluşturulma_Tarihi" VisibleIndex="7" Caption="Oluşturulma Tarihi">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                </Columns>
            </dx:ASPxGridView>


            <asp:SqlDataSource ID="dsTedarikci" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" DeleteCommand="DELETE FROM [Tedarikci] WHERE [id] = @id" InsertCommand="INSERT INTO [Tedarikci] ([vkn], [Firma_Ad], [Telefon], [Email], [Adres], [Oluşturulma_Tarihi]) VALUES (@vkn, @Firma_Ad, @Telefon, @Email, @Adres, @Oluşturulma_Tarihi)" SelectCommand="SELECT * FROM [Tedarikci]" UpdateCommand="UPDATE [Tedarikci] SET [vkn] = @vkn, [Firma_Ad] = @Firma_Ad, [Telefon] = @Telefon, [Email] = @Email, [Adres] = @Adres, [Oluşturulma_Tarihi] = @Oluşturulma_Tarihi WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="vkn" Type="String" />
                    <asp:Parameter Name="Firma_Ad" Type="String" />
                    <asp:Parameter Name="Telefon" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Adres" Type="String" />
                    <asp:Parameter DbType="Date" Name="Oluşturulma_Tarihi" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="vkn" Type="String" />
                    <asp:Parameter Name="Firma_Ad" Type="String" />
                    <asp:Parameter Name="Telefon" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Adres" Type="String" />
                    <asp:Parameter DbType="Date" Name="Oluşturulma_Tarihi" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>


            
       
            
<div class="container mt-3" style="display: flex; align-items: flex-end;">
    <asp:ImageButton ID="pdfbutontdrk" runat="server" ImageUrl="İmage/pdf.png" Width="30" Height="30" Class="pdfbutonstok" OnClick="pdfbutontdrk_Click" />
    <asp:ImageButton ID="excelbutontdrk" runat="server" ImageUrl="İmage/excelicon.png" Width="30" Height="30" Class="excelbutonstok" OnClick="excelbutontdrk_Click" />

    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" />
</div>

              
              
 
       
    
   <dx:ASPxGridViewExporter ID="Exporter" runat="server" GridViewID="ASPxGridView1" />
    </div>
       

</asp:Content>

