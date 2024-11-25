<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="settings-1.aspx.cs" Inherits="PPDWebsite.settings_1" %>

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
                                    <img src="img/logo-full.png" >
		                            </div>
                            <div class="col-sm-12">
                              <!--<form class="form mt24" id="login-save" data-success="Settings saved" data-error="Please fill all fields correctly."  autocomplete="off"> -->
                                <div class="col-md-12 text-center">
                                  <h5 class="uppercase"><strong>Step 1 Of 2<br/>Select Due Date</strong></h5>
                                  <p>To determine your expected delivery date, select the “EDD Calculator” Option. </p>
                                  <p>If You already know the due date please select it below</p>
                                </div>
                                <div class="col-md-4">
                                  <asp:DropDownList runat="server" type="text" class="validate-required input-minimal" id="ddlDay" name="day" placeholder="Day"  autocomplete="off" required="required">
                                      <asp:ListItem>DAY</asp:ListItem>
                                      <asp:ListItem>1</asp:ListItem>
                                      <asp:ListItem>2</asp:ListItem>
                                      <asp:ListItem>3</asp:ListItem>
                                      <asp:ListItem>4</asp:ListItem>
                                      <asp:ListItem>5</asp:ListItem>
                                      <asp:ListItem>6</asp:ListItem>
                                      <asp:ListItem>7</asp:ListItem>
                                      <asp:ListItem>8</asp:ListItem>
                                      <asp:ListItem>9</asp:ListItem>
                                      <asp:ListItem>10</asp:ListItem>
                                      <asp:ListItem>11</asp:ListItem>
                                      <asp:ListItem>12</asp:ListItem>
                                      <asp:ListItem>13</asp:ListItem>
                                      <asp:ListItem>14</asp:ListItem>
                                      <asp:ListItem>15</asp:ListItem>
                                      <asp:ListItem>16</asp:ListItem>
                                      <asp:ListItem>17</asp:ListItem>
                                      <asp:ListItem>18</asp:ListItem>
                                      <asp:ListItem>19</asp:ListItem>
                                      <asp:ListItem>20</asp:ListItem>
                                      <asp:ListItem>21</asp:ListItem>
                                      <asp:ListItem>22</asp:ListItem>
                                      <asp:ListItem>23</asp:ListItem>
                                      <asp:ListItem>24</asp:ListItem>
                                      <asp:ListItem>25</asp:ListItem>
                                      <asp:ListItem>26</asp:ListItem>
                                      <asp:ListItem>27</asp:ListItem>
                                      <asp:ListItem>28</asp:ListItem>
                                      <asp:ListItem>29</asp:ListItem>
                                      <asp:ListItem>30</asp:ListItem>
                                      <asp:ListItem>31</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                  <asp:DropDownList runat="server" type="text" class="validate-required input-minimal" id="ddlMonth" name="month" placeholder="Month"  autocomplete="off">
                                      <asp:ListItem Value="0">MONTH</asp:ListItem>
                                      <asp:ListItem Value="1">Jan</asp:ListItem>
                                      <asp:ListItem Value="2">Feb</asp:ListItem>
                                      <asp:ListItem Value="3">Mar</asp:ListItem>
                                      <asp:ListItem Value="4">Apr</asp:ListItem>
                                      <asp:ListItem Value="5">May</asp:ListItem>
                                      <asp:ListItem Value="6">Jun</asp:ListItem>
                                      <asp:ListItem Value="7">Jul</asp:ListItem>
                                      <asp:ListItem Value="8">Aug</asp:ListItem>
                                      <asp:ListItem Value="9">Sep</asp:ListItem>
                                      <asp:ListItem Value="10">Oct</asp:ListItem>
                                      <asp:ListItem Value="11">Nov</asp:ListItem>
                                      <asp:ListItem Value="12">Dec</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                  <asp:DropDownList runat="server" type="text" class="validate-required input-minimal" id="ddlYear" name="year" placeholder="Year"  autocomplete="off">
                                      <asp:ListItem>YEAR</asp:ListItem>
                                      <asp:ListItem>2016</asp:ListItem>
                                      <asp:ListItem>2017</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-12">
                                  <a class="btn btn-lg btn-pink" href="#"><i class="ti-calendar"></i>EDD Calculator</a>
                                </div>
                                  <div class="col-sm-12 text-center mt8">
                                    <asp:Button runat="server" type="button" class="btn btn-grey" Text="Next" ID="cmdNext" OnClick="cmdNext_Click"/>
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
