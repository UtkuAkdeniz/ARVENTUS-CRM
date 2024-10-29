<%@ Page Title="" Language="C#" MasterPageFile="~/Satis.Master" AutoEventWireup="true" CodeBehind="DokumanlarSatis.aspx.cs" Inherits="CRMPROJE3.DokumanlarSatis" %>
<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css" rel="stylesheet" />
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
      <link rel="stylesheet"type="text/css" href="/CSS/style.css">   
        <link rel="stylesheet" type="text/css" href="/CSS/responsive.css"> 
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
      .containerdokum {
            position: relative;
           margin-left:2vh;
           margin-top:2vh;
            width: 30vh;
            height: 30vh;
        }
        .containerdokum input[type="file"],
        .containerdokum input[type="submit"] {
            width: 100%;
            height: 50%;
            box-sizing: border-box;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" DataKeyNames="Id" width="100%">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad" />
        <asp:BoundField DataField="YüklemeTarihi" HeaderText="YüklemeTarihi" SortExpression="YüklemeTarihi" />
        <asp:TemplateField HeaderText="İncele">
            <ItemTemplate>
                <asp:Button ID="btnIncele" runat="server" Text="İncele" CommandName="Select" CommandArgument='<%# Container.DataItemIndex %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


        <div class="containerdokum" style="background-image: url('İmage/pdfdok.jpg'); background-size: cover; background-position: center; ">
    <asp:FileUpload ID="FileUploadControl" runat="server" style="padding:1vh; border:none; background:none; background-color:none;" ForeColor="#ffffff"  />
    <asp:Button ID="UploadButton" runat="server" Text="Yükle" OnClick="UploadButton_Click"  style="margin-top:15%;  border:none; background:none; "  ForeColor="#ffffff" />
             
   

</div>
    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red" style="margin-top:10vh; margin-left:5vh;"></asp:Label>

 


 

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ARVENTUSConnectionString %>" DeleteCommand="DELETE FROM [Dokumanlar] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Dokumanlar] ([Ad], [Icerik], [YüklemeTarihi]) VALUES (@Ad, @Icerik, @YüklemeTarihi)" SelectCommand="SELECT * FROM [Dokumanlar]" UpdateCommand="UPDATE [Dokumanlar] SET [Ad] = @Ad, [Icerik] = @Icerik, [YüklemeTarihi] = @YüklemeTarihi WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ad" Type="String" />
                <asp:Parameter Name="Icerik" Type="Object" />
                <asp:Parameter Name="YüklemeTarihi" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ad" Type="String" />
                <asp:Parameter Name="Icerik" Type="Object" />
                <asp:Parameter Name="YüklemeTarihi" Type="DateTime" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
 

</asp:Content>


