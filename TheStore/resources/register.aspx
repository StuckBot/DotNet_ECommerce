<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="TheStore.resources.register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="stylesheet" href="css/styles-login.css"/>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <title>The Store | Register</title>
</head>
<body class="bg-dark">
<!--Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="index.aspx">The Store</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link" href="index.aspx">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about.aspx">About</a></li>
                <li class="nav-item"><a class="nav-link" href="shop.aspx">Shop</a></li>
            </ul>
            <div class="c-flex" style="display: none;">
                <button class="btn btn-outline-light" type="button" onclick="location.href='cart.aspx'">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                </button>
                <button class="btn btn-outline-light" type="button" onclick="location.href='../login.aspx'">
                    Login
                </button>
            </div>
        </div>
    </div>
</nav>
<div class="login-page">
  <form class="form bg-dark" runat="server">
    <div class="login-form">
      <asp:TextBox class="forminput" ID="txtUserName_reg" placeholder="UserName" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorusername" 
            runat="server" ErrorMessage="User Name required" Text="*"
            ControlToValidate="txtUserName_reg" ForeColor="Red">
        </asp:RequiredFieldValidator>
      <asp:TextBox class="forminput" ID="txtPassword_reg" TextMode="Password" placeholder="Password" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" 
            runat="server" ErrorMessage="Password required" Text="*"
            ControlToValidate="txtPassword_reg" ForeColor="Red">
        </asp:RequiredFieldValidator>
      <asp:TextBox class="forminput" ID="txtConfirmPassword_reg" TextMode="Password" placeholder="Confirm Password" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" 
            runat="server" ErrorMessage="Confirm Password required" Text="*"
            ControlToValidate="txtConfirmPassword_reg" ForeColor="Red" 
            Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidatorPassword" runat="server" 
            ErrorMessage="Password and Confirm Password must match"
            ControlToValidate="txtConfirmPassword_reg" ForeColor="Red" 
            ControlToCompare="txtPassword_reg" Display="Dynamic"
            Type="String" Operator="Equal" Text="*">
        </asp:CompareValidator>
      <asp:TextBox class="forminput" ID="txtEmail_reg" style="margin-top: 20px;" placeholder="Email" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" 
            runat="server" ErrorMessage="Email required" Text="*"
            ControlToValidate="txtEmail_reg" ForeColor="Red"
            Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" 
            runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtEmail_reg"
            ForeColor="Red" Display="Dynamic" Text="*"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
        </asp:RegularExpressionValidator>
      <asp:Button class="formbutton" ID="btnRegister" style="margin-top: 15px;" runat="server" Text="Register" OnClick="btnRegister_Click" />
        <asp:Label ID="lblMessage" style="color: white;" runat="server"></asp:Label>
      <p class="message">Already registered? <a href="../login.aspx">Sign In</a></p>
        <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />
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
<script src="js/scripts.js"></script>
</body>
</html>
