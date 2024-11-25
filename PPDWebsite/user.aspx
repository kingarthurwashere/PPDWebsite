<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="PPDWebsite.user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PPA Dashboard</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <!-- Animation library for notifications   -->
    <link href="css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'/>
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />



    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/demo.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
  
    
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet" />
    <!-- Datatables -->
    <link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet"/>
    <link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet"/>
    <link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet"/>
    <link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet"/>
      
</head>

<body>
     

    <form id="form1" runat="server">
      
    <div class="wrapper">
    <div class="sidebar" data-color="purple" data-image="img/sidebar-5.jpg">

    <!--

        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag

    -->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="admin.aspx">
                <img src="img/logo-full-white.png" />
                </a>
            </div>

             <ul class="nav">
                <li class="active">
                    <a href="admin.aspx">
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="users.aspx">
                        <i class="pe-7s-users"></i>
                        <p>Users</p>
                    </a>
                </li>
                <li>
                    <a href="content_management.aspx">
                        <i class="pe-7s-notebook"></i>
                        <p>Content Management</p>
                    </a>
                </li>
                <li>
                    <a href="devotional_management.aspx">
                        <i class="pe-7s-bookmarks"></i>
                        <p>Devotional</p>
                    </a>
                </li>
                <li>
                    <a href="adminsettings.aspx">
                        <i class="pe-7s-config"></i>
                        <p>Settings</p>
                    </a>
                </li>
				
            </ul>
    	</div>
    </div>

    <div class="main-panel">
        
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">User Information</a>
                </div>
                <div class="collapse navbar-collapse">
                   <!-- <ul class="nav navbar-nav navbar-left">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-dashboard"></i>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-globe"></i>
                                    <b class="caret"></b>
                                    <span class="notification">5</span>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li>
                        <li>
                           <a href="">
                                <i class="fa fa-search"></i>
                            </a>
                        </li>
                    </ul>-->

                    <ul class="nav navbar-nav navbar-right">
                         <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    My Account
                                    <b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#"><asp:Literal runat="server" ID="ltUserName"></asp:Literal></a></li>
                                <li class="divider"></li>
                                <li><a href="myaccount.aspx">Edit Profile</a></li>
                                <li class="divider"></li>
                                <li><asp:LinkButton id="lnkLogout" Text="Logout" OnClick="lnkLogout_Click" runat="server"/></li>
                              </ul>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card-user">
                            <div class="image">
                                <img src="img/profilebanner.jpg" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                     
                                    <img class="avatar border-gray" src="img/avatar.jpg" alt="..."/>

                                      <h4 class="title"><asp:Label runat="server" ID="lblUsername"></asp:Label><br/>
                                        <small>Registered On: <asp:Label runat="server" ID="lblRegDate"></asp:Label></small>
                                      </h4>
                                         <br />
                                      <asp:Label runat="server" ID="lblDay" CssClass="h1" Text="..."></asp:Label>
                                        <br />
                                </div>
                                <p class="description text-center"> 
                                    Last logged in on <asp:Label runat="server" ID="lblLastLogin"></asp:Label>
                                </p>
                            </div>
                            <hr/>
                            <div class="text-center" >
                                <asp:Button runat="server" ID="cmdSuspend" Text="Suspend" CssClass="btn btn-warning" style="margin-bottom:8px" />
                                <asp:Button runat="server" ID="cmdDelete" Text="Delete" CssClass="btn btn-danger" style="margin-bottom:8px"/>
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h3 class="title">Profile Info</h3>
                            </div>
                            <hr />
                            <div class="content">
                                <div>
                                    <div class="row" style="margin:10px">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label>Email Address</label><br />
                                                <asp:Label runat="server" ID="lblEmailAd" Text="..." CssClass="h4"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label>Phone Number</label><br />
                                                <asp:Label runat="server" ID="lblPhoneNo" Text="..." CssClass="h4"></asp:Label>
                                            </div>

                                            <hr />
                                            <div class="form-group">
                                              <!--<asp:Button runat="server" ID="cmdExportJournal" Text="Export Journal" CssClass="btn btn-info btn-fill" style="margin-bottom:8px" OnClick="cmdExportJournal_Click"/>-->
                                
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-4">
                                            <div class="card">
                                                <div style="margin:6px; text-align:center">
                                                    <label style="margin-top:20px"><strong>Quick Stats</strong></label>
                                                    <hr />
                                                    <asp:Label runat="server" ID="lblJournalEntries" Text="0" Font-Bold="true"></asp:Label> Journal Entries <br />
                                                    <asp:Label runat="server" ID="lblSavedPrayers" Text="0" Font-Bold="true"></asp:Label> Bookmarks <br />
                                                    <asp:Label runat="server" ID="lblLoginCount" Text="0" Font-Bold="true"></asp:Label> Logins <br />
                                                    <br /><br />
                                                </div>
                                                
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>
                       
                    </ul>
                </nav>
                <p class="copyright pull-right">
                    &copy; 2017 <a href="http://www.luminsoft.com">LuminSoft Systems</a>. All rights reserved
                </p>
            </div>
        </footer>

    </div>
</div>
    </form>
</body>
    <!--   Core JS Files   -->
    <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="js/bootstrap-checkbox-radio-switch.js"></script>

	<!--  Charts Plugin -->
	<script src="js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="js/bootstrap-notify.js"></script>

    
    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="js/light-bootstrap-dashboard.js"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! 
	<script src="js/demo.js"></script>-->

   

	<script type="text/javascript">
    	function showAlert(){

        	demo.initChartist();

        	$.notify({
            	icon: 'pe-7s-gift',
            	message: "Welcome to <b>Light Bootstrap Dashboard</b> - a beautiful freebie for every web developer."

            },{
                type: 'info',
                timer: 4000
            });

    	};
	</script>

    <!-- Custom Theme Scripts -->
    <script src="js/custom.min.js"></script>

     <!-- Datatables -->
    <script src="vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <!--<script src="vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>-->
    <script src="vendors/jszip/dist/jszip.min.js"></script>
    <script src="vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="vendors/pdfmake/build/vfs_fonts.js"></script> 

</html>