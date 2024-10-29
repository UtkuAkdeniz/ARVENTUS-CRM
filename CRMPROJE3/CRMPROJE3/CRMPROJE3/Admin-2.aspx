<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Admin-2.aspx.cs" Inherits="CRMPROJE3.Admin_2" %>
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

/* İçindeki scrollbar track'ı dikdörtgen şeklinde bırakmak için */
::-webkit-scrollbar-track-piece {
  background: #ccc; /* Track arka plan rengi */

  .pagination {
    position: fixed;
    bottom: 0;
    width: 100%;
    background-color: white;
    box-shadow: 0px -2px 10px rgba(0, 0, 0, 0.1);
    padding: 10px;
    margin: 0;
    list-style: none;
    display: flex;
    justify-content: center;
}

     .dx-cardview {
        background-color: #4E73DF; /* Grid arka plan rengi */
        border-radius: 10px; /* Grid köşe yarıçapı */
    }
    .dx-cardview .dx-card {
        background-color: white; /* Kart arka plan rengi */
        border-radius: 5px; /* Kart köşe yarıçapı */
    }
        }
            .auto-style1 {
                margin-right: 0px;
            }
        </style>
  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/CSS/responsive.css"> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>

<dx:ASPxCardView ID="ASPxCardView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsPersonelCard" Theme="IOS" style="margin-left:37vh; margin-bottom:10vh; margin-top:5vh;" EnableTheming="True" CssClass="auto-style1" Width="10%">
        <SettingsPager AlwaysShowPager="True">
        </SettingsPager>
    <SettingsPopup>
        <FilterControl AutoUpdatePosition="False"></FilterControl>
    </SettingsPopup>
    <SettingsExport ExportSelectedCardsOnly="False"></SettingsExport>
    <Columns>
        <dx:CardViewTextColumn FieldName="Personel_Numarası" VisibleIndex="1" Caption="Personel Numarası">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn FieldName="Ad" VisibleIndex="2">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn FieldName="Soyad" VisibleIndex="3">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn FieldName="Telefon_Numarası" VisibleIndex="4" Caption="Telefon Numarası">
        </dx:CardViewTextColumn>
        <dx:CardViewTextColumn FieldName="Email" VisibleIndex="5" Caption="E-Mail">
        </dx:CardViewTextColumn>
        <dx:CardViewBinaryImageColumn FieldName="Profil_Resmi" VisibleIndex="0" Caption="">
            <PropertiesBinaryImage ImageHeight="200px" ImageWidth="170px">
            </PropertiesBinaryImage>
        </dx:CardViewBinaryImageColumn>
    </Columns>
        <CardLayoutProperties>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit">
            </SettingsAdaptivity>
        </CardLayoutProperties>
        <Styles>
            <SearchPanel BackColor="White">
            </SearchPanel>
        </Styles>
    <StylesExport>
        <Card BorderSides="All" BorderSize="1">
        </Card>
        <Group BorderSides="All" BorderSize="1">
        </Group>
        <TabbedGroup BorderSides="All" BorderSize="1">
        </TabbedGroup>
        <Tab BorderSize="1">
        </Tab>
    </StylesExport>
        <Border BorderColor="#4E73DF" />
</dx:ASPxCardView>

<asp:SqlDataSource ID="dsPersonelCard" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" SelectCommand="SELECT Profil_Resmi, Personel_Numarası, Ad, Soyad, Telefon_Numarası, Email FROM Personel">
</asp:SqlDataSource>





    </div>



</asp:Content>
