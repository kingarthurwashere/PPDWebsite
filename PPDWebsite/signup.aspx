<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="PPDWebsite.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8"/>
        <title>Pregnancy Prayer App - Sign Up</title>
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

    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />

        <style>
            .alert {
                display: block;
            }
        </style>

        <script src="js/bootstrap-notify.js"></script>
    
        <script type="text/javascript">
    	    function showErrorAlert(errMessage){

        	    $.notify({
        	        icon: 'pe-7s-attention',
            	    message: "<b>Registration Failed!</b></br>" + errMessage

                },{
                    type: 'danger',
                    timer: 2000,
                    placement: {
                        from: 'top',
                        align: 'center'
                    }
                });

    	    };

    	    function showMissingInfoAlert(errMessage) {

    	        $.notify({
    	            icon: 'pe-7s-attention',
    	            message: "<b>Missing Info!</b></br>" + errMessage

    	        }, {
    	            type: 'warning',
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
		                        <div class="col-sm-8 col-sm-push-2 pt24 pb24  text-center bg-white cast-shadow animated zoomIn">
		                            <div id="logo" class=" col-sm-12 pb16">
                                    <img src="img/logo-full.png" >
		                            </div>
                            <div class="col-sm-12">
                             <!-- <form class="form mt24" id="signup-form" data-success="You have successfully signed up, Redirecting to log in" data-error="Please fill all fields correctly."  autocomplete="off"> -->
                                <h3>SIGN UP</h3>
                                  <div class="row">
                                    <div class="col-md-6">
                                      <asp:Textbox runat="server" type="text" class="validate-required" id="txtFirstName" name="email" placeholder="Name"  autocomplete="off" required="required"/>
                                    </div>
                                    <div class="col-md-6">
                                      <asp:Textbox runat="server" type="text" class="validate-required" id="txtSurname" name="mobile" placeholder="Surname"  autocomplete="off" required="required"/>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-md-6">
                                      <asp:Textbox runat="server" type="text" class="validate-required" id="txtEmail" name="email" placeholder="E-Mail Address"  autocomplete="off" required="required"/>
                                    </div>
                                    <div class="col-md-6">
                                      <asp:Textbox runat="server" type="text" class="validate-required" id="txtMobile" name="mobile" placeholder="Mobile Number"  autocomplete="off"/>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-md-6">
                                      <asp:Textbox runat="server" type="password" class="validate-required" id="txtPassword" name="password" placeholder="Password" autocomplete="off" required="required"/>
                                    </div>
                                  <div class="col-md-6">
                                    <asp:Textbox runat="server" type="password" class="validate-required" id="txtPasswordConfirm" name="password-confirm" placeholder="Confirm Password" autocomplete="off" required="required"/>
                                  </div>
                                </div>
                                <hr style="height:1px;border-width:0;color:gray;background-color:lightgray"/>
                                <div class="row" style="text-align:left">
                                    
                                    <div class="col-md-6">
                                        <h5>Please select your expected due date</h5><br />
                                        <asp:TextBox ID="txtDueDate" runat="server" class="validate-required"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                  <div class="col-sm-12 text-center">
                                    
                                      <asp:Button runat="server" ID="cmdSignUpSave" Text="Sign Up" class="btn btn-orange full-width" OnClick="cmdSignUp_Click"/>
                                   
                                  </div>
                                </div>
                                
                                  <!--<div class="col-sm-12 text-center mt8 mb24">
                                      <img src="img/or.png">
                                    </div>
                                    <div class="col-sm-12 text-center">
                                      <img src="img/facebook.png">
                                    </div>
                                  </div>-->
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
        <script src="js/bootstrap-notify.js"></script>
    
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#txtDueDate").datepicker();
            });
  </script>
    </form>
</body>
</html>
