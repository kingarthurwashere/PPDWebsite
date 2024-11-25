<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="devotional_edit.aspx.cs" Inherits="PPDWebsite.devotional_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PPA Devotional Edit</title>

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
    
    <link href="css/sweetalert.css" rel="stylesheet" type="text/css" media="all" />
    <!-- NProgress -->
    <link href="vendors/nprogress/nprogress.css" rel="stylesheet" />
    
    <script type="text/javascript">
        function successalert() {
            swal({
                title: 'Saved!',
                text: 'The devotional entry was updated successfully!',
                type: 'success'
            },
                function () {
                    window.location.replace("devotional_management.aspx");
                });
        }
    </script>

    <script type="text/javascript">
        function failedalert() {
            swal({
                title: 'Failed!',
                text: 'An error was encountered updating the devotional entry',
                type: 'error'
            });
        }
    </script>

</head>

<body>
     

    <form id="form1" runat="server">
      
     
    <div class="wrapper">
    <div class="sidebar" data-color="red" data-image="img/sidebar-5.jpg">

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
                    <a href="#">
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
                    <a class="navbar-brand" href="#">Devotional Management</a>
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
                                <li><a href="#">Chido Sachikonye</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Edit Profile</a></li>
                                <li><a href="#">Change Password</a></li>
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
                  <div class="col-md-12">
                        <div class="card ">
                            <div class="header">
                                <h4 class="title"><asp:Label ID="lblDay" runat="server" Text="Label"></asp:Label> </h4>
                                <p class="category">Edit the content for this day</p>

                            </div>
                            <div class="content">
                                <div>
                                    <label>Scripture</label>
                                    <asp:TextBox ID="txtScripture" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>

                                    <label>Detail</label>
                                    <asp:TextBox ID="txtDetail" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>

                                    
                                    <hr />
                                    <div class="clearfix">
                                        <asp:Button ID="cmdSaveContent" CssClass="btn btn-success pull-right" runat="server" Text="Save Content" OnClick="cmdSaveContent_Click"/>
                                    </div>
                                    
                                </div>
                                <div class="footer">
                                    <hr/>
                                    <div class="stats">
                                        
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

 <script src="js/jquery.min.js"></script>
        <script src="js/sweetalert.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/parallax.js"></script>
        <script src="js/scripts.js"></script>    
    </form>
</body>
    
    
       

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



</html>
