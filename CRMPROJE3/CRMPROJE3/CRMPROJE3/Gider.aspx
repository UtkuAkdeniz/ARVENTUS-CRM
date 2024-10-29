<%@ Page Title="" Language="C#" MasterPageFile="~/Muhasebe.Master" AutoEventWireup="true" CodeBehind="Gider.aspx.cs" Inherits="CRMPROJE3.Gider" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.2.Web, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register assembly="DevExpress.XtraCharts.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/CSS/responsive.css"> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

         <div id="gridContainer">
      <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsGider" KeyFieldName="id" EnableTheming="True" Theme="IOS" Width="100%">
    <SettingsEditing Mode="Batch"></SettingsEditing>
    <Settings ShowGroupPanel="True" ShowHeaderFilterButton="True" ShowFooter="True" />
    <SettingsPopup>
        <FilterControl AutoUpdatePosition="False"></FilterControl>
    </SettingsPopup>
          <SettingsSearchPanel Visible="True" />
    <Columns>
        <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="1" Visible="False">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="Tarih" VisibleIndex="2">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Acıklama" VisibleIndex="5" Caption="Açıklama">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn FieldName="Gider_Kodu" VisibleIndex="3" Caption="Gider Kodu">
                        <PropertiesComboBox DataSourceID="dsGiderTipi" TextField="Gider_Adi" ValueField="Gider_Kodu">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
    </Columns>
          <TotalSummary>
              <dx:ASPxSummaryItem FieldName="Tutar" ShowInColumn="Tutar" />
          </TotalSummary>
</dx:ASPxGridView>

<asp:SqlDataSource ID="dsGider" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>"
    DeleteCommand="DELETE FROM [Giderler] WHERE [id] = @id"
    InsertCommand="INSERT INTO [Giderler] ([Tarih], [Gider_Kodu], [Tutar], [Acıklama]) VALUES (@Tarih, @Gider_Kodu, @Tutar, @Acıklama)"
    SelectCommand="SELECT [id], [Tarih], [Gider_Kodu], [Tutar], [Acıklama] FROM [Giderler]"
    UpdateCommand="UPDATE [Giderler] SET [Tarih] = @Tarih, [Gider_Kodu] = @Gider_Kodu, [Tutar] = @Tutar, [Acıklama] = @Acıklama WHERE [id] = @id">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter DbType="Date" Name="Tarih" />
        <asp:Parameter Name="Gider_Kodu" Type="Int32" />
        <asp:Parameter Name="Tutar" Type="Decimal" />
        <asp:Parameter Name="Acıklama" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter DbType="Date" Name="Tarih" />
        <asp:Parameter Name="Gider_Kodu" Type="Int32" />
        <asp:Parameter Name="Tutar" Type="Decimal" />
        <asp:Parameter Name="Acıklama" Type="String" />
        <asp:Parameter Name="id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="dsGiderTipi" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>"
    SelectCommand="SELECT [Gider_Kodu], [Gider_Adi] FROM [Gider_Tipi]">
</asp:SqlDataSource>


         </div>

       <div class="container mt-3 mb-5">
            <!-- Gider Grafiği -->
       
        <asp:TextBox ID="txtGider" runat="server" TextMode="Date" Placeholder="Başlangıç Tarihi"></asp:TextBox>
<asp:TextBox ID="txtgidertrh" runat="server" TextMode="Date" Placeholder="Bitiş Tarihi"></asp:TextBox>
<asp:Button ID="btnGiderChart" runat="server" Class="btn btn-primary mb-1" Text="Grafik Oluştur" OnClick="btnGiderChart_Click" />

<dx:WebChartControl ID="ExpenseChart" runat="server" CrosshairEnabled="True" Height="438px" Width="1129px">
    <DiagramSerializable>
        <dx:XYDiagram>
            <AxisX>
                <Title Text="Tarih"></Title>
            </AxisX>
            <AxisY>
                <Title Text="Gider Miktarı"></Title>
            </AxisY>
        </dx:XYDiagram>
    </DiagramSerializable>
    <SeriesSerializable>
        <dx:Series ArgumentDataMember="Tarih" ValueDataMembersSerializable="Tutar" Name="Giderler">
            <ViewSerializable>
                <dx:LineSeriesView />
            </ViewSerializable>
        </dx:Series>
    </SeriesSerializable>
    <Titles>
        <dx:ChartTitle Text="GİDER GRAFİĞİ" />
    </Titles>
</dx:WebChartControl>

<asp:SqlDataSource ID="dsExpenseChart" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>"></asp:SqlDataSource>

    </div>


</asp:Content>
