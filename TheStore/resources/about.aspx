<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="TheStore.resources.about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>The Store | About</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
     <!--Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="index.aspx">The Store</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link" href="index.aspx">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="about.aspx">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="shop.aspx">Shop</a></li>
                </ul>
                <div class="c-flex">
                    <button class="btn btn-outline-light" type="button" onclick="location.href='cart.aspx'">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                    </button>
                    <asp:Button ID="auth" class="btn btn-outline-light" runat="server" Text="Login" PostBackUrl="../login.aspx"/>
                </div>
            </div>
        </div>
    </nav>
    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="text-center my-5">
            <img class="img-fluid rounded-circle mb-1" style="height: 150px;" src="assets/avatar.png" alt="..." />
            <h1 class="text-light fs-3 fw-bolder">StuckBot</h1>
            <p class="text-white-50 mb-0">Interning</p>
        </div>
    </header>
    <!-- Content section-->
    <section class="py-5">
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <h2>About</h2>
                    <p class="lead"> An ecommerce website made using dotnet framework. </p>
                    <p class="mb-0"> Hosted on an IIS server, this web application uses concepts such as ASP.NET, ADO.NET and WebServices heavily. The main Application has another sub-application which is accessed using Web Services in SOAP message format to establish connection with the SQL Database.</p>
                    <p class="mb-0"> Front-end has been made mostly by using various open source bootstrap and codepen codes. Finally Javascript is used to communicate with the Databse and dynamically update the HTML DOM whenever seen fit. </p>
                </div>
            </div>
        </div>
    </section>
    </form>
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
