<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="TheStore.resources.shop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>The Store | Shop</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script type="text/javascript">
            function OutOfStockDOM()
            {
                TheStore.resources.ReadOnlyService.OutOfStock(success,failure);
            }
            function success(results)
            {
                let i = results['result'].length - 1;
                for (let j = 1; j <= i;j=j+2)
                {
                    document.getElementById(results['result'][j]).classList = "btn btn-danger mt-auto";
                    document.getElementById(results['result'][j]).innerHTML = "Out Of Stock";
                    document.getElementById(results['result'][j]).style = "pointer-events: none";
                }
            }
            function failure(errors)
            {
                alert(errors.get_message);
            }
            function cookieredirect(id)
            {
                document.cookie = "id=" + id + ";";
                let temp = document.getElementById(id[0]).innerHTML;
                if (temp == "Out Of Stock") {
                    document.cookie = "red=1;";
                }
                else
                {
                    document.cookie = "red=0;";
                }
                document.cookie = "name=" + document.getElementById(id).innerHTML + ";";
                temp = id[0] + ".2";
                document.cookie = "price=" + document.getElementById(temp).innerText + ";"
            }

            function displayAlert(text, action) {
                const alert = document.getElementById("alert");
                alert.textContent = text;
                alert.classList.add(`alert-${action}`);
                // remove alert
                setTimeout(function () {
                    alert.textContent = "";
                    alert.classList.remove(`alert-${action}`);
                }, 1000);
            }
            function addtocart(id)
            {
                TheStore.resources.ReadOnlyService.SessionCart(id,suc,failure);
            }
            function suc(results)
            {
                //document.getElementById("alert").innerHTML = results['result'][0];
                if (results['result'] == "1") {
                    displayAlert("Added to Cart", "success");
                }
                else if (results['result'] == "0"){
                    displayAlert("Already In Cart", "danger");

                }
            }
        </script>
</head>
<body onload="OutOfStockDOM()">
    <!--Navigation-->
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="./ReadOnlyService.asmx" />
            </Services>
        </asp:ScriptManager>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.aspx">The Store</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" href="index.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.aspx">About</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="shop.aspx">Shop</a></li>
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
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-light">
                    <h1 id="works" class="display-4 fw-bolder">Shop Now !!!</h1>
                    <p class="lead fw-normal text-light-50 mb-0">With our wide array of choices</p>
                </div>
            </div>
        </header>
        <p id="alert" class="text-center" style="position:fixed;top:0px;float:left;left:0px;padding:10px;"></p>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/1.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">
                                        <a id="1.1" class="nav-link" style="color:black" onclick="cookieredirect(this.id);" href="product.aspx">Clock</a>
                                    </h5>
                                    <div class="small mb-1">
                                        SKU: BST-491
                                    </div>
                                    <!-- Product price-->
                                    <div id="1.2">$40.00</div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div  class="text-center">
                                    <a id="1" class="btn btn-outline-dark mt-auto" onclick="addtocart(this.id);">Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/2.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a id="2.1" onclick="cookieredirect(this.id);" class="nav-link" style="color:black" href="product.aspx">HeadPhones</a></h5>
                                    <div  class="small mb-1">SKU: BST-492</div>
                                    <!-- Product price-->
                                    <div id="2.2">$18.00</div>                              
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div  class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a id="2" class="btn btn-outline-dark mt-auto" onclick="addtocart(this.id);">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/3.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a id="3.1" onclick="cookieredirect(this.id);" class="nav-link" style="color:black" href="product.aspx">Bananna</a></h5>
                                    <div  class="small mb-1">SKU: BST-493</div>
                                    <!-- Product price-->
                                    <div id="3.2">
                                    $25.00
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div  class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a id="3" class="btn btn-outline-dark mt-auto" onclick="addtocart(this.id);">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/4.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a id="4.1" onclick="cookieredirect(this.id);" class="nav-link" style="color:black" href="product.aspx">Fancy</a></h5>
                                    <div  class="small mb-1">SKU: BST-494</div>
                                    <!-- Product price-->
                                    <div id="4.2">
                                    $40.00
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div  class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a id="4" class="btn btn-outline-dark mt-auto" onclick="addtocart(this.id);">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/5.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a id="5.1" onclick="cookieredirect(this.id);" class="nav-link" style="color:black" href="product.aspx">Ball</a></h5>
                                    <div  class="small mb-1">SKU: BST-495</div>
                                    <!-- Product price-->
                                    <div id="5.2">
                                    $25.00
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div  class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a id="5" class="btn btn-outline-dark mt-auto" onclick="addtocart(this.id);">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/6.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a id="6.1" onclick="cookieredirect(this.id);" class="nav-link" style="color:black" href="product.aspx">Controller</a></h5>
                                    <div class="small mb-1">SKU: BST-496</div>
                                    <!-- Product price-->
                                    <div id="6.2">
                                    $120.00
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div  class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a id="6" class="btn btn-outline-dark mt-auto" onclick="addtocart(this.id);">Add to Cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/7.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a id="7.1" onclick="cookieredirect(this.id);" class="nav-link" style="color:black" href="product.aspx">Camera</a></h5>
                                    <div class="small mb-1">SKU: BST-497</div>
                                    <!-- Product price-->
                                    <div id="7.2">
                                    $18.00
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div  class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a id="7" class="btn btn-outline-dark mt-auto" onclick="addtocart(this.id);">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="assets/8.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a id="8.1" onclick="cookieredirect(this.id);" class="nav-link" style="color:black" href="product.aspx">Phones</a></h5>
                                    <div  class="small mb-1">SKU: BST-498</div>
                                    <!-- Product price-->
                                    <div id="8.2">
                                    $40.00
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div  class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a id="8" class="btn btn-outline-dark mt-auto" onclick="addtocart(this.id);">Add to cart</a></div>
                            </div>
                        </div>
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
