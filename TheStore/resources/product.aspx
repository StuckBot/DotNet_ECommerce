<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="TheStore.resources.product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Item - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script type="text/javascript">
            function getCookie(cname) {
                let name = cname + "=";
                let decodedCookie = decodeURIComponent(document.cookie);
                let ca = decodedCookie.split(';');
                for (let i = 0; i < ca.length; i++) {
                    let c = ca[i];
                    while (c.charAt(0) == ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                        return c.substring(name.length, c.length);
                    }
                }
                return "";
            }

            function readcookie()
            {                
                let x = getCookie("id");
                document.getElementById("item-img").src = "assets/"+x[0]+".jpg";
                document.getElementById("item-sku").innerHTML = "SKU: BST-49" + x[0];
                document.getElementById("item-price").innerHTML = getCookie("price");
                document.getElementById("item-name").innerHTML = getCookie("name");

                if (getCookie("red") == 1)
                {
                    document.getElementById("red").classList = "btn btn-danger mt-auto";
                    document.getElementById("red").innerHTML = "Out Of Stock";
                    document.getElementById("red").style = "pointer-events: none";
                }               
            }
        </script>
</head>
<body onload="readcookie();">
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
                    <form class="c-flex">
                        <button class="btn btn-outline-light" type="button" onclick="location.href='cart.aspx'">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                        </button>
                        <button class="btn btn-outline-light" type="button" onclick="location.href='../login.aspx'">
                            Login
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img id="item-img" class="card-img-top mb-5 mb-md-0" alt="..." /></div>
                    <div class="col-md-6">
                        <div id="item-sku" class="small mb-1"></div>
                        <h1 id="item-name" class="display-5 fw-bolder"></h1>
                        <div class="fs-5 mb-5">
                            <span id="item-price"></span>
                        </div>
                        <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
                        <div class="d-flex">
                            <button id="red" class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
