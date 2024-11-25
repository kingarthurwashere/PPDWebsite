<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="settings-2.aspx.cs" Inherits="PPDWebsite.settings_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8"/>
        <title>Pregnancy Prayer App - Log In</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/themify-icons.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/animate.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/flexslider.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/theme.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400%7CRaleway:100,400,300,500,600,700%7COpen+Sans:400,500,600' rel='stylesheet' type='text/css'/>

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
                            <div class="col-sm-12">
                              <!--<form class="form mt24" id="login-save" data-success="Settings saved" data-error="Please fill all fields correctly."  autocomplete="off"> -->
                                <div class="col-md-12 text-center">
                                  <h5 class="uppercase"><strong>Step 2 Of 2<br/>Select Color Theme</strong></h5>
                                  <p>Please choose your prefered color option</p>
                                  <div class="colors col-sm-12">
                                      <asp:RadioButton CssClass="checkbox" ID="radOne" GroupName="Colours" Text="Pink" runat="server" />
                                      <asp:RadioButton CssClass="checkbox" ID="radTwo" GroupName="Colours" Text="Blue" runat="server" />
                                      <asp:RadioButton CssClass="checkbox" ID="radThree" GroupName="Colours" Text="Grey" runat="server" />
                                  </div>
                                  <div class="col-sm-12 text-center mt8">
                                    <asp:Button runat="server" ID="cmdSave" type="submit" Text="Save" class="btn btn-grey" OnClick="cmdSave_Click"/>
                                  </div>

                              <!--</form> -->

                            </div>


		                        </div>
		                    </div>
		                </div>
		            </li>
		        </ul>
		    </section></div>


	<script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/flexslider.min.js"></script>
        <script src="js/parallax.js"></script>
        <script src="js/scripts.js"></script>
    </form>
</body>
</html>
