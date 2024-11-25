<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="PPDWebsite.settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
        <title>Pregnancy Prayer App - Settings</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/themify-icons.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/theme.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400%7CRaleway:100,400,300,500,600,700%7COpen+Sans:400,500,600' rel='stylesheet' type='text/css'/>
    <link href="css/fileupload.css" rel="stylesheet" />
    <!--  Below CSS is for styling the alerts    -->
    <!--<link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>-->
    <link href="css/sweetalert.css" rel="stylesheet" />

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'/>
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <style>
        .alert {
            display: block;
        }
    </style>

    <script src="js/bootstrap-notify.js"></script>
    
    <script type="text/javascript">
    	function showSaveAlert(){

        	$.notify({
        	    icon: 'pe-7s-shield',
            	message: "<b>Prayer Saved!</b></br>Your prayer has been saved to the bookmarks section."

            },{
                type: 'success',
                timer: 1000,
                placement: {
                    from: 'top',
                    align: 'center'
                }
            });

    	};
	</script>

    <script type="text/javascript">
    	function showFailedAlert(){

        	$.notify({
        	    icon: 'pe-7s-shield',
            	message: "<b>Save failed!</b></br>This prayer is already saved in your bookmarks."

            },{
                type: 'warning',
                timer: 1000,
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
          
          <nav class="absolute transparent">
                  <div class="nav-bar">
                      <div class="module widget-handle right">
                          <a href="dashboard.aspx"><img src="img/logo-icon-white.png"/></a>
                      </div>
                      <div>
                        <ul class="icon-container">
                            <li class="menu-item home-btn" ><a class="menu-title" title="Home">&nbsp;</a></li>
                            <li class="menu-item bookmark-btn"><a href="bookmarks.aspx" class="menu-title" title="Bookmarks">&nbsp;</a></li>
                            <li class="menu-item journal-btn" ><a href="settings.aspx" class="menu-title" title="Settings">&nbsp;</a></li>
                            <!--<li class="menu-item settings-btn"><a href="settings.aspx" class="menu-title" title="">&nbsp;</a></li>-->
                        </ul>
                    </div>
                  </div>
                </nav>

      </div>


		<div class="main-container">
		<section class="page-title page-title-4 image-bg overlay parallax">
		        <div class="background-image-holder">
		            <img alt="Background Image" class="background-image" src="img/cover14.jpg"/>
		        </div>
		        <div class="container">
		            <div class="row">
                        <div class="col-md-12 text-right username_text">
                            <p class="lead bold "><asp:Label ID="lblUsersName" runat="server" Text="..."/></p>
                            
                        </div>
		                <div class="col-xs-6">
		                    <h3 class="uppercase bold mb0">Settings</h3>
                        <p class="lead bold"><asp:Label ID="lblRecordCount" runat="server" Text=""/></p>
                        <p class="left bold tile-left left">
                            <a href="dashboard.aspx">
                                <span class="btn btn-pink"><i class="ti-angle-left">&nbsp;</i>Dashboard</span>

                            </a></p>
		                </div>
		            </div>

		        </div>
		    </section>


        <section class=" entriesList mb0 pb0">

		        <div class="container">
		            <div class="row">
		                
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
                                  <!--<div class="row">
                                    <div class="col-md-6">
                                      <asp:Textbox runat="server" type="password" class="validate-required" id="txtPassword" name="password" placeholder="Password" autocomplete="off"/>
                                    </div>
                                  <div class="col-md-6">
                                    <asp:Textbox runat="server" type="password" class="validate-required" id="txtPasswordConfirm" name="password-confirm" placeholder="Confirm Password" autocomplete="off"/>
                                  </div>
                                </div>-->
                                <hr style="height:1px;border-width:0;color:gray;background-color:lightgray"/>
                                <div class="row" style="text-align:left">
                                    
                                    <div class="col-md-6">
                                        <h5>Please select your expected due date</h5>
                                        <asp:TextBox ID="txtDueDate" runat="server" class="validate-required" required="required"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                  <div class="col-sm-12 text-center">
                                    
                                      <asp:Button runat="server" ID="cmdUpdate" Text="Update Details" class="btn btn-pink" OnClick="cmdUpdate_Click"/>
                                   
                                  </div>
                                </div>
		            </div>

		        </div>

		    </section>
          
      </div>


	    <script src="js/jquery.min.js"></script>
        <script src="js/sweetalert.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/parallax.js"></script>
        <script src="js/scripts.js"></script>
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