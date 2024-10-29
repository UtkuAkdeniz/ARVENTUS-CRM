<%@ Page Title="" Language="C#" MasterPageFile="~/Muhasebe.Master" AutoEventWireup="true" CodeBehind="Gelir.aspx.cs" Inherits="CRMPROJE3.Gelir" %>

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

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsGelir" Theme="IOS" KeyFieldName="id" Width="100%">
                <SettingsEditing Mode="Batch"></SettingsEditing>
                <Settings ShowGroupPanel="True" ShowHeaderFilterButton="True" ShowFooter="True" />
                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
                <SettingsSearchPanel Visible="True" />
                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataDateColumn FieldName="Tarih" VisibleIndex="1">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Tutar" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Acıklama" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="5">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Gelir" FieldName="Gelir_kodu" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="dsGelirTipi" TextField="Gelir_Adı" ValueField="Gelir_Kodu">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
                <TotalSummary>
                    <dx:ASPxSummaryItem ShowInColumn="Tutar" ShowInGroupFooterColumn="Tutar" />
                </TotalSummary>
            </dx:ASPxGridView>






            <asp:SqlDataSource ID="dsGelirTipi" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>"
                SelectCommand="SELECT [Gelir_Kodu], [Gelir_Adı] FROM [Gelir_Tipi]"></asp:SqlDataSource>

            <asp:SqlDataSource ID="dsGelir" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>"
                SelectCommand="SELECT [Tarih], [Gelir_kodu], [Tutar], [Acıklama], [id] FROM [Gelirler]"
                DeleteCommand="DELETE FROM [Gelirler] WHERE [id] = @id"
                UpdateCommand="UPDATE [Gelirler] SET [Tarih] = @Tarih, [Gelir_kodu] = @Gelir_kodu, [Tutar] = @Tutar, [Acıklama] = @Acıklama WHERE [id] = @id"
                InsertCommand="INSERT INTO [Gelirler] ([Tarih], [Gelir_kodu], [Tutar], [Acıklama]) VALUES (@Tarih, @Gelir_kodu, @Tutar, @Acıklama)">

            </asp:SqlDataSource>
            </div>


         <!-- Gelir Grafiği-->
        <div class="container mb-5 mt-3" >

<asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" Placeholder="Başlangıç Tarihi"></asp:TextBox>
<asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" Placeholder="Bitiş Tarihi"></asp:TextBox>
<asp:Button ID="btnGenerateChart" Class="btn btn-primary mb-1" runat="server" Text="Grafik Oluştur" OnClick="btnGenerateChart_Click" />

<dx:WebChartControl ID="IncomeChart" runat="server" CrosshairEnabled="True" Height="438px" Width="1129px">
    <DiagramSerializable>
        <dx:XYDiagram>
            <AxisX>
                <Title Text="Tarih"></Title>
            </AxisX>
            <AxisY>
                <Title Text="Gelir Miktarı"></Title>
            </AxisY>
        </dx:XYDiagram>
    </DiagramSerializable>
    <SeriesSerializable>
        <dx:Series ArgumentDataMember="Tarih" ValueDataMembersSerializable="Tutar" Name="Gelir">
            <ViewSerializable>
                <dx:LineSeriesView />
            </ViewSerializable>
        </dx:Series>
    </SeriesSerializable>
    <Titles>
        <dx:ChartTitle Text="GELİR GRAFİĞİ" />
    </Titles>
</dx:WebChartControl>

<asp:SqlDataSource ID="dsIncomeChart" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>"></asp:SqlDataSource>
      
    </div>
                
</asp:Content>
