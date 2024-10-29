<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRMPROJE3.Login" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet"type="text/css" href="/CSS/style.css">   
        <link rel="stylesheet" type="text/css" href="/CSS/responsive.css"> 
     <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" type="İmage/jpeg" sizes="16x16" href="İmage/Arventus.jpg">
    <link rel="icon" type="İmage/jpeg" sizes="32x32" href="İmage/Arventus.jpg">
    
 <style>
        body {
            background-image: url('İmage/loginyeni3.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed; /* Arka planın sabit kalmasını sağlar */
            margin: 0; /* Sayfa kenar boşluklarını kaldırır */
            padding: 0; /* Sayfa içeriğinin kenar boşluklarını kaldırır */
        }

    </style>  
</head>
<body id="logindiv">
    <form id="form2" runat="server">
    <div class="right-container">
        <h1 style="position: absolute; top: 29%; left: 30%; transform: translate(-50%, -50%) rotate(-13deg); color: #808080;">Giriş Yapınız</h1>
        <h2 style="position: absolute; top: 31%; left: 42%; transform: translate(-50%, -50%) rotate(-13deg); color: #808080;">Arventus Kontrol Hesabınıza</h2>
        <div class="form-group" style="position: absolute; top: 40%; left: 40%; transform: translate(-50%, -50%) rotate(-13deg);">
            <div class="input-group">
                <div class="input-group-prepend">
                    
                        <img src="İmage/Loginekran.png"  width="18" height="25" style="position: relative; right:1vh; top: 1.5vh;"/>
                    
                </div>
                <asp:TextBox ID="txtkullanici" CssClass="form-control custom-textbox" style="width:30vh; height:6vh; z-index:5;" runat="server" placeholder="Kullanıcı Adı"></asp:TextBox>
            </div>
        </div>
        <div class="form-group" style="position: absolute; top: 50%; left: 43%; transform: translate(-50%, -50%) rotate(-13deg);">
            <div class="input-group">
                <div class="input-group-prepend">
                    
                        <img src="İmage/passwordekran.png" alt="Görsel 2" width="18" height="25" style="position: relative;  right:1vh; top: 1.5vh;"/>
                    
                </div>
                <asp:TextBox ID="txtsifre" class="form-control custom-textbox" style="width:30vh; height:6vh; z-index:5;" runat="server" placeholder="Şifre" TextMode="Password" ></asp:TextBox>
            </div>
        </div>
     
         <div class="form-group" style="margin-bottom:10vh;  position: absolute; top: 60%; left: 45%; transform: translate(-50%, -50%) rotate(-13deg);">
            <dx:ASPxCaptcha ID="ASPxCaptcha1" runat="server" TextBox-LabelText="Robot Olmadığınızı Doğrulayınız:" ValidationSettings-ErrorText="Girdiğiniz Kod Hatalı Tekrar Giriniz" TextBoxStyle-ForeColor="#007bff" ForeColor="White" Theme="BlackGlass" style="margin-top:5vh;" ></dx:ASPxCaptcha>
            
        </div>
        
        <div class="form-group" style="margin-top:5vh; display:block; position:absolute; top: 70%; left: 45%; transform: translate(-50%, -50%) rotate(-13deg);">
            <asp:Button ID="btngiris"  runat="server" CssClass="btn btn-primary"  style="display:block; margin-top:10vh;  width:34vh; height:6vh; width:34vh; height:6vh; border-radius: 1.5rem; font-size: 3vh;" Text="Giriş Yap"
 OnClick="btngiris_Click1" />
          
                   
        <!-- Diğer textbox ve içerikler buraya eklenebilir -->
    </div>

         <div class="form-group" style="position: absolute; top: 70%; left: 45%; transform: translate(-50%, -50%) rotate(-13deg);">


              <asp:Label ID="lbluyarı" runat="server" Text="Personel Numarası veya Şifre Hatalı" Visible="False" ForeColor="Red"></asp:Label>

        </div>

    </div>
             
             <!-- Geri kalan içerikler buraya gelecek -->
           <div class="left-container">
            <!-- Sol taraftaki içerikler buraya eklenecek -->
             <!--  <h1 style="position: absolute; top: 20%; left: 10%; transform: translate(-50%, -50%) rotate(0deg); color: #fff;">Arventus</h1>
                <h2 style="position: absolute; top: 25%; left: 18%; transform: translate(-50%, -50%) rotate(0deg); color: #fff;">Personel Sistemine Hoş Geldiniz</h2> -->
               
        </div>
</form>


</body>



</html>
