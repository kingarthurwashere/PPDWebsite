<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getjournal.aspx.cs" Inherits="PPDWebsite.getjournal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
        <title>Pregnancy Prayer App - Journal</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/themify-icons.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/theme.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/sweetalert.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400%7CRaleway:100,400,300,500,600,700%7COpen+Sans:400,500,600' rel='stylesheet' type='text/css'/>
    <!--<link href="css/fileupload.css" rel="stylesheet" />-->
    <!--  Below CSS is for styling the alerts    -->
    <!--<link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>-->

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'/>
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
    <!-- Dropzone.js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   
    <link href="vendors/dropzone/dist/dropzone.css" rel="stylesheet"/>
    <script src="vendors/dropzone/dropzone.js" type="text/javascript"></script>
   
    <style>
        .alert {
            display: block;
        }
    </style>

    <script src="js/bootstrap-notify.js"></script>
    
   
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" EnablePartialRendering="true" runat="server" />

       
      <div class="nav-container">

          <nav class="absolute transparent">
                  <div class="nav-bar">
                      <div class="module widget-handle right">
                          <img src="img/logo-icon-white.png"/>
                      </div>
                      <div>
                        <ul class="icon-container">
                            <li class="menu-item home-btn" ><a class="menu-title" title="Home" href="dashboard.aspx">&nbsp;</a></li>
                            <li class="menu-item bookmark-btn"><a class="menu-title" title="Bookmarks" href="bookmarks.aspx">&nbsp;</a></li>
                            <li class="menu-item journal-btn" ><a class="menu-title" title="Journal" href="journal-listing.aspx">&nbsp;</a></li>
                            <li class="menu-item settings-btn"><a class="menu-title" title="Settings" href="settings.aspx">&nbsp;</a></li>
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
		                    <h3 class="uppercase bold mb0">Buy Your Journal</h3>
                        <p class="lead bold"><asp:Label ID="lblRecordCount" runat="server" Text="Purchase your downloadable journal."/></p>
                        <p class="left bold tile-left left">
                            <a href="journal-list.aspx">
                                <span class="btn btn-pink"><i class="ti-angle-left">&nbsp;</i>Journal Entries</span>

                            </a></p>
		                </div>
		            </div>

		        </div>
		    </section>


        <section class=" entriesList mb0 pb0">

		        <div class="container">
		            <div class="row">
		                <div class="col-md-12">
                              <div class="mb24">                                  

                                    <div class="col-md-1"></div>
                                <div class="col-md-10" style="align-content:center; text-align:center">
                                    <div class="col-md-5">
                                        <img src="images/buy_journal.png" />
                                    </div>
                                    <div class="col-md-7" style="text-align:left">
                                         <p class="lead">
                                            Pregnancy is a period filled with many emotions:  excitement, anxiety, love, peace and joy! Don’t let a moment pass without you capturing it in your Pregnancy Prayer Guide Journal. Your thoughts, moods, what you are hearing from God during your pregnancy are not things to allow slip by. Also include the daily prayer for that day in your journal entries. At the end of your pregnancy journey, download the journal into a complete e-journal which you can then take to a reputable printer to print into something you will refer to, go through with fondness and thanksgiving for many years to come. The journal is available to every user. At the end of your journey <b>download it for only £9.99</b>.
                                        </p>
                                        <p>
                                            <!--<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">-->
                                                <input type="hidden" name="cmd" value="_s-xclick"/>
                                                <input type="hidden" name="hosted_button_id" value="S62ZSKV3H5JC6"/>
                                                <asp:ImageButton src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" ID="cmdPay" PostBackUrl='https://www.paypal.com/cgi-bin/webscr' runat="server" alt="PayPal – The safer, easier way to pay online!" />
                                                <!--<input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online!"/>-->
                                                <img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1"/>
                                            
                                            <!--</form>-->
                                        </p>

                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                              </div>
                            <div class="row">
		                        

		                    </div>
		                </div>
                       
                        </div>
		            </div>

		</section>
        <section class="mt0 pb0 pt0 mb0">
            
        </section>

      </div>


	<script src="js/jquery.min.js"></script>
        <script src="js/sweetalert.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/parallax.js"></script>
        <script src="js/scripts.js"></script>
    </form>
    </body>

    <script>
        $('.btnAlert').click(function () {
    swal({
      title: "Are you sure?",
      text: "Do you want to delete this jounral entry? This cannot be undone!",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#ff0000",
      confirmButtonText: "Yes, delete it!",
      closeOnConfirm: false
    },
    function(){
      swal("Deleted!", "Your entry has been deleted.", "success");
    });
  });
    </script>
</html>