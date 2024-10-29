<%@ Page Title="" Language="C#" MasterPageFile="~/Satis.Master" AutoEventWireup="true" CodeBehind="SatisPanel.aspx.cs" Inherits="CRMPROJE3.SatisPanel" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.2.Web, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register assembly="DevExpress.XtraCharts.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraScheduler.v22.2.Core.Desktop, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>
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

     <dxwschs:ASPxDateNavigator ID="ASPxDateNavigator1" runat="server" ClientIDMode="AutoID" MasterControlID="ASPxScheduler1" Width="100%"></dxwschs:ASPxDateNavigator>

     
     <br />

     
     </div>
    
    <div class="container" style="margin-bottom:15vh;>
     <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" AppointmentDataSourceID="dsRandevu" ClientIDMode="AutoID"  Theme="iOS" Width="100%">
         <Views>
<DayView ViewSelectorItemAdaptivePriority="2" DayCount="1" ShowWorkTimeOnly="true">
    <WorkTime Start="09:00" End="18:30" />
    <TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
</DayView>

<WorkWeekView ViewSelectorItemAdaptivePriority="6"><TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
</WorkWeekView>

             <WeekView Enabled="false"></WeekView>

<MonthView ViewSelectorItemAdaptivePriority="5"></MonthView>

<TimelineView ViewSelectorItemAdaptivePriority="3"></TimelineView>

             <FullWeekView Enabled="true">
                 <TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
             </FullWeekView>

<AgendaView ViewSelectorItemAdaptivePriority="1"></AgendaView>
         </Views>

         <Storage>
             <Appointments AutoRetrieveId="True">
                 <Mappings AllDay="AllDay" AppointmentId="UniqueID" Description="Description" End="EndDate" Label="Label" Location="Location" RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo" ResourceId="ResourceID" Start="StartDate" Status="Status" Subject="Subject" Type="Type" />
             </Appointments>
         </Storage>

     </dxwschs:ASPxScheduler>
    

       <asp:SqlDataSource ID="dsRandevu" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" DeleteCommand="DELETE FROM [Appointments] WHERE [UniqueID] = @UniqueID" InsertCommand="INSERT INTO [Appointments] ([Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField1]) VALUES (@Type, @StartDate, @EndDate, @AllDay, @Subject, @Location, @Description, @Status, @Label, @ResourceID, @ResourceIDs, @ReminderInfo, @RecurrenceInfo, @CustomField1)" SelectCommand="SELECT * FROM [Appointments]" UpdateCommand="UPDATE [Appointments] SET [Type] = @Type, [StartDate] = @StartDate, [EndDate] = @EndDate, [AllDay] = @AllDay, [Subject] = @Subject, [Location] = @Location, [Description] = @Description, [Status] = @Status, [Label] = @Label, [ResourceID] = @ResourceID, [ResourceIDs] = @ResourceIDs, [ReminderInfo] = @ReminderInfo, [RecurrenceInfo] = @RecurrenceInfo, [CustomField1] = @CustomField1 WHERE [UniqueID] = @UniqueID">
           <DeleteParameters>
               <asp:Parameter Name="UniqueID" Type="Int32" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="Type" Type="Int32" />
               <asp:Parameter Name="StartDate" Type="DateTime" />
               <asp:Parameter Name="EndDate" Type="DateTime" />
               <asp:Parameter Name="AllDay" Type="Boolean" />
               <asp:Parameter Name="Subject" Type="String" />
               <asp:Parameter Name="Location" Type="String" />
               <asp:Parameter Name="Description" Type="String" />
               <asp:Parameter Name="Status" Type="Int32" />
               <asp:Parameter Name="Label" Type="Int32" />
               <asp:Parameter Name="ResourceID" Type="Int32" />
               <asp:Parameter Name="ResourceIDs" Type="String" />
               <asp:Parameter Name="ReminderInfo" Type="String" />
               <asp:Parameter Name="RecurrenceInfo" Type="String" />
               <asp:Parameter Name="CustomField1" Type="String" />
           </InsertParameters>
           <UpdateParameters>
               <asp:Parameter Name="Type" Type="Int32" />
               <asp:Parameter Name="StartDate" Type="DateTime" />
               <asp:Parameter Name="EndDate" Type="DateTime" />
               <asp:Parameter Name="AllDay" Type="Boolean" />
               <asp:Parameter Name="Subject" Type="String" />
               <asp:Parameter Name="Location" Type="String" />
               <asp:Parameter Name="Description" Type="String" />
               <asp:Parameter Name="Status" Type="Int32" />
               <asp:Parameter Name="Label" Type="Int32" />
               <asp:Parameter Name="ResourceID" Type="Int32" />
               <asp:Parameter Name="ResourceIDs" Type="String" />
               <asp:Parameter Name="ReminderInfo" Type="String" />
               <asp:Parameter Name="RecurrenceInfo" Type="String" />
               <asp:Parameter Name="CustomField1" Type="String" />
               <asp:Parameter Name="UniqueID" Type="Int32" />
           </UpdateParameters>
     </asp:SqlDataSource>
    

        </div>
    
</asp:Content>
