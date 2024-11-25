<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="devotional.aspx.cs" Inherits="PPDWebsite.devotional" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
        <title>Pregnancy Prayer App - Devoptional</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/themify-icons.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/theme.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400%7CRaleway:100,400,300,500,600,700%7COpen+Sans:400,500,600' rel='stylesheet' type='text/css'/>

    <!--  Below CSS is for styling the alerts    -->
    <!--<link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>-->

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
<body style="overflow:auto">
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
                            <p class="lead bold "><asp:Label ID="lblUsersName" runat="server" Text="..."/><br /><a href="login.aspx" title="Logout"><img src="images/logout.png" style="height:22px"/></a></p>
                        </div>
		                <div class="col-xs-6">
		                    <h3 class="uppercase bold mb0"><asp:Label runat="server" ID="lblDayNumberv" Text="DAILY DEVOTIONAL"/></h3>
                            
                            <p class="lead bold"><asp:Label ID="lblDailyDev" runat="server" Text="..."/></p>
                            
                            <p class="left bold tile-left left">
                                <asp:LinkButton runat="server" ID="cmdPrevious" class="btn btn-pink" Text="<i class='ti-angle-left'>&nbsp;</i>Previous Day"/>

                            </p>
                            
                            <p class="right bold tile-right right">
                                <asp:LinkButton runat="server" ID="cmdNext" class="btn btn-pink" Text="Next Day  <i class='ti-angle-right'>&nbsp;</i>"/>
                            </p>
		                </div>
		            </div>
		        </div>
	 </section>

      <section class="baby-container mb0">
        <div class="container">
            <div class="row v-align-children">
                <div class="col-md-4 col-sm-5 mb-xs-24">
                </div>
                <div class="col-md-7 col-md-offset-5 col-sm-6 col-sm-offset-2 text-right baby-thumb">
                    <!--<img src="img/months/month6.png" />-->
                    <asp:Image ID="imgDevelopment" runat="server" ImageUrl="~/img/months/month_1.png" />
                </div>
            </div>

        </div>
      </section>

        <section class="mt0 pt0">

		        <div class="container">
		            <div class="row">
		                <div class="col-sm-4 text-left" style="margin-top:80px; padding-right:20px">
                            
                            <h5 class="uppercase bold mt0">Trimester Notes</h5>
                            <p>
                               <asp:Label ID="lblTrimester" runat="server" Text="..."></asp:Label>
                            </p>
		                </div>
		                <div class="col-sm-4 text-center">
		                    <div class="feature">
                          <p class="center"><img src="img/cross.png" /></p>
		                        <h5 class="uppercase bold mb0"><asp:Label ID="lblDayNumber2" runat="server" Text="Day 0"></asp:Label> </h5>
		                        <h4 class="uppercase bold mt0">Scripture</h4>
		                        <p class="lead">
                                    <asp:Label ID="lblScripture" runat="server" Text="..."></asp:Label>
                                </p>
                                <h4 class="uppercase bold mt0">Today's Note</h4>
		                        <p class="lead">
                                    <asp:Label ID="lblDetail" runat="server" Text="..."></asp:Label>
                                </p>
                                <asp:LinkButton runat="server" ID="cmdSaveDevotional" class="btn btn-pink" Text="<i class='ti-bookmark-alt'>&nbsp;</i>Save Prayer"/>
		                    </div>
		                </div>
		                <div class="col-sm-4 text-right" style="margin-top:80px; padding-left:20px">

                            <h5 class="uppercase bold mt0">Weekly Notes</h5>
                            <p>
                               <asp:Label ID="lblWeekly" runat="server" Text="..."></asp:Label>
                            </p>
		                </div>
		            </div>

		        </div>

		    </section>
            <section class="collapsable">
                <div class="container">
                    <div class="col-sm-4"></div>
                      <div class="col-sm-4">Devotional</div>
                      <div class="col-sm-4"></div>
                </div>
            </section>
		</div>


	    <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/parallax.js"></script>
        <script src="js/scripts.js"></script>
        <script src="js/bootstrap-notify.js"></script>
    </form>
</body>
</html>
