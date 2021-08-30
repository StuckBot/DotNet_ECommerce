<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TheStore.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="stylesheet" href="resources/css/styles-login.css"/>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="resources/css/styles.css" rel="stylesheet" />
    <title>The Store | Login</title>
</head>
<body class="bg-dark">
<!--Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="resources/index.aspx">The Store</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link" href="resources/index.aspx">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="resources/about.aspx">About</a></li>
                <li class="nav-item"><a class="nav-link" href="resources/shop.aspx">Shop</a></li>
            </ul>
            <div class="c-flex">
                <button class="btn btn-outline-light" type="button" onclick="location.href='resources/cart.aspx'">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                </button>
                <button class="btn btn-outline-light" type="button" onclick="location.href='login.aspx'">
                    Login
                </button>
            </div>
        </div>
    </div>
</nav>
<div class="login-page">
  <form class="form bg-dark" runat="server">
    <div class="login-form">
      <asp:TextBox class="forminput" ID="txtUserName" placeholder="UserName" runat="server"/>
      <asp:TextBox class="forminput" ID="txtPassword" TextMode="Password" placeholder="Password" runat="server"/>
      <asp:CheckBox ID="chkBoxRememberMe" style="color: white;" runat="server" Text="Remember Me" />
      <asp:Button class="formbutton" ID="btnLogin" runat="server" Text="login" OnClick="btnLogin_Click" />
      <asp:Label ID="lblMessage" style="color: white;" runat="server"></asp:Label>
      <p class="message">Not registered? <a href="resources/register.aspx">Create an account</a></p>
    </div>
  </form>
</div>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="resources/js/scripts-login.js"></script>
<!-- Footer-->
<footer class="py-5 bg-dark">
<div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; The Store 2021</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="resources/js/scripts.js"></script>
</body>
</html>
