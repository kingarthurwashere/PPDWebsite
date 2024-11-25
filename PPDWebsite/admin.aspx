<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="PPDWebsite.admin" %>

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

     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
    <script>
        function LoadMonthlyRegistrations() {
            var pageUrl = '<%= ResolveUrl("~/admin.aspx/GetRegistrationsInYear") %>';

            // var parameter = { "regNo": vehicleRegNo}

            $.ajax({
                type: 'POST',
                url: pageUrl,
                //data: JSON.stringify(parameter),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (result) {
                    onByYearSuccess(result.d);
                },
                error: function (data, success, error) {
                    alert("Error : " + error);
                }
            });

            return false;
        }
        function onByYearSuccess(data) {

            //setInterval(LoadWeeklyData, 10000);

            console.log('Load called from ajax!');
            //var chartData = data;
            var ctx = $("#barChartReferrals").get(0).getContext("2d");

            var myPieChart;
            if (myPieChart != null) {
                myPieChart.destroy();
            }
            myPieChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: data[0],
                    datasets: [{
                        label: 'Mobile',
                        backgroundColor: 'rgba(255,0,0,0.5)',
                        borderColor: 'rgba(255,0,0,1)',
                        borderWidth: 2,
                        data: data[1]
                    },
                    {
                        label: 'Web',
                        backgroundColor: 'rgba(51,153,255,0.5)',
                        borderColor: 'rgba(51,153,255,1)',
                        borderWidth: 2,
                        data: data[2]
                    }
                    ],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {

                        display: true
                    },
                    animation: {
                        animateScale: true,
                        animateRotate: true
                    }
                }
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
                    <a class="navbar-brand" href="#">Dashboard</a>
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

                <div class="row">
                    
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">User Registrations</h4>
                                <p class="category">Registrations by Month</p>
                            </div>
                            <div class="content">
                                 <div>
                                    <canvas id="barChartReferrals" style="height:400px"></canvas>
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

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
 
    
    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="js/light-bootstrap-dashboard.js"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="js/demo.js"></script>

    <script>
        $(document).ready(LoadMonthlyRegistrations());
    </script>

</html>