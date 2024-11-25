<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PPDWebsite.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Pregnancy Prayer App - Log In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/themify-icons.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/flexslider.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/theme.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400%7CRaleway:100,400,300,500,600,700%7COpen+Sans:400,500,600' rel='stylesheet' type='text/css' />


    <!--  Below CSS is for styling the alerts    -->
    <link href="css/light-bootstrap-dashboard.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css' />
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />

    <style>
        .alert {
            display: block;
        }
    </style>

    <script src="js/bootstrap-notify.js"></script>

    <script type="text/javascript">
        function showAlert() {

            $.notify({
                icon: 'pe-7s-shield',
                message: "<b>Login Failed!</b></br>Username and password do not match. Please try again"

            }, {
                    type: 'danger',
                    timer: 2000,
                    placement: {
                        from: 'top',
                        align: 'center'
                    }
                });

        };
    </script>

</head>
<body>
    <form id="form1" runat="server">

        <div class="nav-container">
        </div>



        <div class="main-container">

            <section class="cover fullscreen image-slider slider-arrow-controls controls-inside parallax">
                <ul class="slides">
                    <li class="overlay image-bg">
                        <div class="background-image-holder">
                            <img alt="image" class="background-image" src="img/bg/login-bg.jpg"><!-- Blurry Background can be replaced here. -->
                        </div>
                        <div class="container v-align-transform">
                            <div class="row">
                                <div class="col-sm-4 col-sm-push-4 pt24 pb24  text-center bg-white cast-shadow animated zoomIn">
                                    <div id="logo" class=" col-sm-12 pb16">
                                        <img src="img/logo-full.png" />
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12" style="margin-top: 40px">
                                            <!--</div>-->
                                            <asp:TextBox runat="server" type="text" class="validate-required" ID="username" name="username" placeholder="E-mail Address" autocomplete="off" required="required" />
                                            <asp:TextBox runat="server" type="password" class="validate-required" ID="password" name="password" placeholder="Password" autocomplete="off"  required="required"/>
                                            <div class="">
                                                <asp:Button runat="server" ID="cmdLogin" CssClass="btn btn-block btn-orange" Text="Log On" UseSubmitBehavior="true" OnClick="cmdLogin_Click" />
                                            </div>
                                            <!--
                                              <div class="col-sm-6">
                                                <asp:Button runat="server" ID="cmdSignUp" CssClass="btn btn-orange" Text="Sign Up" OnClick="cmdSignUp_Click"/>
                                    
                                              </div>
                                            
                                            <div class="col-sm-12 mt24 mb8 ">
                                                <input type="checkbox" name="radio" value="remember-me" id="remember" />
                                                <span class="float-left">Remember Me on This Device</span>
                                            </div>-->
                                            <div class="col-sm-12 text-center mt8 mb24">
                                                <img src="img/or.png" />
                                            </div>
                                            <div class="col-sm-12 text-center">
                                                <!-- INSERT FACEBOOK LOG IN CODE HERE | PLACEHOLDER IMAGE <img src="img/facebook.png"/>-->
                                                <span style="color: gray;">Don't have an account?</span>
                                                <asp:Button runat="server" ID="cmdSignUp2" CssClass="btn btn-grey" Text="Sign Up" OnClick="cmdSignUp_Click" UseSubmitBehavior="False" />
                                            </div>
                                       
                                    </div>
                                    <!--</form>-->
                                </div>


                            </div>
                        </div>
                        <!--</div>-->
                    </li>
                </ul>
            </section>
        </div>


        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/flexslider.min.js"></script>
        <script src="js/parallax.js"></script>
        <script src="js/scripts.js"></script>
        <script src="js/bootstrap-notify.js"></script>
        <script src="js/demo.js"></script>




    </form>
</body>
</html>
