<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Admin-3.aspx.cs" Inherits="CRMPROJE3.Admin_3" %>
<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.2.Web, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register assembly="DevExpress.XtraCharts.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mb-5">

        <!-- Gelir Grafiği-->

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
       
        <!-- Gider Grafiği -->
        <div class="mt-5 mb-5">
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

         <!-- Stok Grafiği --> 
     
  <dx:WebChartControl ID="StokChart" runat="server" CrosshairEnabled="True" DataSourceID="dsStokChart" Height="500px" Width="1150px">
    <DiagramSerializable>
        <dx:SimpleDiagram3D RotationMatrixSerializable="1;0;0;0;0;0.5;-0.866025403784439;0;0;0.866025403784439;0.5;0;0;0;0;1">
        </dx:SimpleDiagram3D>
    </DiagramSerializable>
    <SeriesSerializable>
        <dx:Series ArgumentDataMember="stok_adi" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="depodaki_miktar" LegendTextPattern="{A}">
            <ViewSerializable>
                <dx:Pie3DSeriesView>
                </dx:Pie3DSeriesView>
            </ViewSerializable>
        </dx:Series>
    </SeriesSerializable>
    <SeriesTemplate LegendTextPattern="{A}">
    </SeriesTemplate>
      <Titles>
          <dx:ChartTitle Text="STOK GRAFİĞİ" />
      </Titles>
</dx:WebChartControl>

<asp:SqlDataSource ID="dsStokChart" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT * FROM [Stok]"></asp:SqlDataSource>


 </div>
      
      
        


        <!-- Stok Grafiği Sonu -->


     </div>

</asp:Content>
