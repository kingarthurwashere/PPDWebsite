<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myaccount.aspx.cs" Inherits="PPDWebsite.myaccount" %>


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

    <!-- Datatables -->
    <link href="vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet"/>
    <link href="vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet"/>
    <link href="vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet"/>
    <link href="vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet"/>
      
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="css/demo.css" rel="stylesheet" />

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
    
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
  
    <link href="css/sweetalert.css" rel="stylesheet" />

     <script type="text/javascript">
         function successalert(message) {
             swal({
                 title: 'Operation Successful!',
                 text: message,
                 type: 'success'
             },
                 function () {
                     window.location.href = window.location.href;
                 });
         }
    </script>

     <script type="text/javascript">
         function failedalert(errMessage) {
             swal({
                 title: 'Operation Failed!',
                 text: errMessage,
                 type: 'error'
             });
         }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">

       <div class="modal fade" id="modal-new">
          <div class="modal-dialog">
            <div class="modal-content">

              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Password Reset</h4>
              </div>

              <div class="modal-body">
                <p>Enter your new password below.</p>

                  <div class="form-group">
                    <label>Current Password</label>                 
                    <asp:TextBox runat="server" ID="txtCurrentPassword" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
                  </div>
                   <hr />
                  <div class="form-group">
                    <label>Password</label>                 
                    <asp:TextBox runat="server" ID="txtNewPassword" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
                  </div>

                  <div class="form-group">
                    <label>Re-enter New Password</label>                 
                    <asp:TextBox runat="server" ID="txtPassword2" CssClass="form-control" TextMode="Password" required="required"></asp:TextBox>
                  </div>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                
                  <asp:Button runat="server" ID="cmdDoReset" CssClass="btn btn-primary" Text="Reset" OnClick="cmdDoReset_Click"/>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          
        </div>
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
                    <a class="navbar-brand" href="#">System Users</a>
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
                               <li><a href="myaccount">Edit Profile</a></li>
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

             
                 
      <!-- Default box -->
      <div class="card">
        <div class="header">
           <h4 class="title">Account Details</h4>
        </div>
        <div class="content">
             <a href="#" class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#modal-new"><i class="fa fa-plus"></i> Create New User</a>
            <div class="form-group">
                    <label>Name</label>                 
                    <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" required="required"></asp:TextBox>
                  </div>

                   <div class="form-group">
                    <label>Surname</label>                 
                    <asp:TextBox runat="server" ID="txtSurname" CssClass="form-control" required="required"></asp:TextBox>
                  </div>

                   <div class="form-group">
                    <label>Email</label>                 
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" required="required"></asp:TextBox>
                  </div>

                  <div class="form-group">
                    <label>Phone Number</label>                 
                    <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control"></asp:TextBox>
                  </div>
                   
        </div>
        <!-- /.box-body -->
        <div class="footer">
           <a href="#" class="btn btn-danger" data-toggle="modal" data-target="#modal-new"><i class="fa fa-plus"></i> Reset Password</a>
            <asp:Button runat="server" ID="cmdUpdate" Text="Save Changes" CssClass="btn btn-success" OnClick="cmdUpdate_Click"/>
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->


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

     <script src="js/sweetalert.js"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="js/light-bootstrap-dashboard.js"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="js/demo.js"></script>


    <script type="text/javascript"  src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#usersTable').DataTable();
        });
    </script>
</html>