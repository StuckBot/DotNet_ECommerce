<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="TheStore.resources.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" href="css/styles-cart.css"/>
    <link href="css/styles.css" rel="stylesheet" />
    <title>The Store | Cart</title>
    <script type="text/javascript">
        function works()
        {
            TheStore.resources.ReadOnlyService.SessionCart_Ret(success, failure);
        }
        function success(results) {
            let temp = results['result'];
            const myarr = temp.split("$");
            for (let i = 0; i < myarr.length; i++)
            {
                if (myarr[i] == "1") {
                    let id = i+1;
                    TheStore.resources.ReadOnlyService.PopulateCart(id, succ, failure);
                }             
            }
            updateCartTotal();
        }
        function failure(errors) {
            alert(errors.get_message);
        }
        function succ(results) {
            addItemToCart(results['name'], results['price']);
        }
    </script>
</head>
<body class="bg-dark" onload="works();">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="./ReadOnlyService.asmx" />
            </Services>
        </asp:ScriptManager>
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

<section class="container content-section col-lg-7 bg-dark">
  <h2 class="section-header text-white">Your Cart</h2>
  <div class="cart-row">
      <span class="cart-item cart-header cart-column text-white">ITEM</span>
      <span class="cart-price cart-header cart-column text-white">PRICE</span>
      <span class="cart-quantity cart-header cart-column text-white">QUANTITY</span>
  </div>
  <div id="works" class="cart-items" style="color:aliceblue;"> </div>
  <div class="cart-total">
      <strong class="cart-total-title text-white">Total</strong>
      <span class="cart-total-price text-white">Rs. 0</span>
  </div>
  <button class="btn btn-primary btn-purchase" type="button" onclick="purchaseClicked();">PURCHASE</button>
  <p class="alert"></p>
</section>
        </form>
<!-- partial -->
  <script  src="js/scripts-cart.js"></script>
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
