<%@ Page Language="C#" EnableEventValidation="false"AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="PPDWebsite.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Pregnancy Prayer App - Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/themify-icons.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/theme.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400%7CRaleway:100,400,300,500,600,700%7COpen+Sans:400,500,600' rel='stylesheet' type='text/css'/>

    <!--  Below CSS is for styling the alerts    -->
    <!--<link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>-->
    <link href="css/sweetalert.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <style>
        .alert {
            display: block;
        }
    </style>
    <style>
        .footer {
          position: fixed;
          left: 0;
          bottom: 0;
          width: 100%;;
          color: white;
          text-align: center;
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

    <script type="text/javascript">
        function showPaymentSuccessful() {

            swal({
                title: "Purchase Successful!",
                text: "Thank you for your Daily Devotional purchase!",
                type: "success",
                confirmButtonColor: "#ff0000",
                confirmButtonText: "OK",
                closeOnConfirm: false
            },
                function () {
                    window.location.href = window.location.href;
                });

        };
	</script>

    <script type="text/javascript">
        function showPaymentFailed() {

            $.notify({
                icon: 'pe-7s-shield',
                message: "<b>Purchase failed!</b></br>The purchase failed. Please re-try!"

            }, {
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
		                    <h3 class="uppercase bold mb0"><asp:Label runat="server" ID="lblDayNumber" Text="DAY 0"/></h3>
                            
                            <p class="lead bold"><asp:Label ID="lblDailyDev" runat="server" Text="..."/></p>
                            
                            <p class="left bold tile-left left">
                                <asp:LinkButton runat="server" ID="cmdPrevious" class="btn btn-pink" Text="<i class='ti-angle-left'>&nbsp;</i>Previous Day" OnClick="cmdPrevious_Click"/>

                            </p>
                            
                            <p class="right bold tile-right right">
                                <asp:LinkButton runat="server" ID="cmdNext" class="btn btn-pink" Text="Next Day  <i class='ti-angle-right'>&nbsp;</i>" OnClick="cmdNext_Click"/>
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
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#prayer">Daily Prayer</a></li>
                        <li><a data-toggle="tab" href="#devotional">Devotional</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="prayer" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-sm-4 text-center">
                                </div>
                                <div class="col-sm-4 text-center">
                                    <div class="feature" style="margin-top: 20px">
                                        <p class="center">
                                            <img src="img/cross.png" /></p>
                                        <h5 class="uppercase bold mb0">
                                            <asp:Label ID="lblDayNumber2" runat="server" Text="Day 0"></asp:Label>
                                        </h5>
                                        <h4 class="uppercase bold mt0">Daily Prayer</h4>
                                        <p class="lead">
                                            <asp:Label ID="lblPrayer" runat="server" Text="..."></asp:Label>
                                        </p>
                                        <asp:LinkButton runat="server" ID="cmdSavePrayer" class="btn btn-pink" Text="<i class='ti-bookmark-alt'>&nbsp;</i>Save Prayer" OnClick="cmdSavePrayer_Click" />
                                    </div>
                                </div>
                                <div class="col-sm-4 text-center">
                                </div>
                            </div>
                        </div>

                        <div id="devotional" class="tab-pane fade">
                            <div id="divDevotional" runat="server"  class="row " style="margin-top: 20px">
                                <div class="col-sm-4 text-left" style="margin-top: 80px; padding-right: 20px">

                                    <h5 class="uppercase bold mt0">Trimester Notes</h5>
                                    <p>
                                        <asp:Label ID="lblTrimester" runat="server" Text="..."></asp:Label>
                                    </p>
                                </div>
                                <div class="col-sm-4 text-center">
                                    <div class="feature">
                                        <p class="center">
                                            <img src="img/cross.png" /></p>
                                        <h5 class="uppercase bold mb0">
                                            <asp:Label ID="lblDevotionalDay" runat="server" Text="Day 0"></asp:Label>
                                        </h5>
                                        <h4 class="uppercase bold mt0">Scripture</h4>
                                        <p class="lead">
                                            <asp:Label ID="lblScripture" runat="server" Text="..."></asp:Label>
                                        </p>
                                        <h4 class="uppercase bold mt0">Today's Note</h4>
                                        <p class="lead">
                                            <asp:Label ID="lblDetail" runat="server" Text="..."></asp:Label>
                                        </p>
                                        <asp:LinkButton runat="server" ID="cmdSaveDevotional" class="btn btn-pink" Text="<i class='ti-bookmark-alt'>&nbsp;</i>Save Devotional" />
                                    </div>
                                </div>
                                <div class="col-sm-4 text-right" style="margin-top: 80px; padding-left: 20px">

                                    <h5 class="uppercase bold mt0">Weekly Notes</h5>
                                    <p>
                                        <asp:Label ID="lblWeekly" runat="server" Text="..."></asp:Label>
                                    </p>
                                </div>
                            </div>
                            <div id="divBuyDevotional" runat="server" class="row" style="margin-top: 20px">
                                <div class="col-md-1"></div>
                                <div class="col-md-10" style="align-content:center; text-align:center">
                                    <div class="col-md-5">
                                        <img src="images/buy_devotional.png" />
                                    </div>
                                    <div class="col-md-7" style="text-align:left">
                                        <p class="lead">
                                            The Pregnancy Prayer Devotional is your daily dose of the word of God that encourages and edifies you as you embark on this journey of motherhood. The pregnancy Prayer journal will bring understanding and revelation of your purpose as a mother and encourage you to use the power of the word of God and the power of words to speak into your unborn child before they are born. 280 days of revelation through the word will prepare you for the journey ahead. <b>Get the devotional for £5.99</b>.
                                        </p>
                                        
                                            <div class="row">
                                                <div class="col-md-2"></div>
                                                <div id="paypal-holder"class="col-md-8">

                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            
                                            <!--<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                                                <input type="hidden" name="cmd" value="_s-xclick"/>
                                                <input type="hidden" name="hosted_button_id" value="2UMRQDMMRDQ74"/>
                                                <asp:ImageButton src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" ID="cmdPay" PostBackUrl='https://www.paypal.com/cgi-bin/webscr' runat="server" alt="PayPal – The safer, easier way to pay online!" />
                                                <!--<input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online!"/>
                                                <img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1"/>
                                            
                                            <!--</form>-->
                                        

                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                            </div>
                        </div>

                    </div>


                </div>

            </div>

        </section>
           
            
            <div class="footer">
               <a href='https://play.google.com/store/apps/details?id=com.luminsoft.pregnancyprayer2&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png' style="width:200px;"/></a>
            </div>
		</div>


	    <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/parallax.js"></script>
        <script src="js/scripts.js"></script>
        <script src="js/bootstrap-notify.js"></script>
        <script src="js/sweetalert.js"></script>

        <script src="https://www.paypal.com/sdk/js?client-id=Ad-E80OUDDcAcuh4WjILE3XtON6wqqSmeHYVZrolNbF_1hAJr-WAZhg12R9ScbLRTv3vFfKp5Goef8xB"></script>

        <script>
            paypal.Buttons({
                createOrder: function (data, actions) {
                    // Set up the transaction
                    return actions.order.create(
                        {
                            purchase_units: [{
                                amount: {
                                    value: '6.99'
                                }
                            }]
                        });
                },
                onApprove: function (data, actions) {
                    // Capture the funds from the transaction
                    return actions.order.capture().then(function (details) {
                        // Show a success message to your buyer
                        //alert('Transaction completed by ' + details.payer.name.given_name);
                        var pageUrl = '<%= ResolveUrl("~/dashboard.aspx/CompletePurchase") %>';
                        var parameter = { "details": JSON.stringify(details) }

                        return $.ajax({
                            type: 'POST',
                            url: pageUrl,
                            data: JSON.stringify(parameter),
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'json',
                            success: function (result) {
                                showPaymentSuccessful()
                            },
                            error: function (data, success, error) {
                                showPaymentFailed()
                            }
                        }).then(function (details) {
                            if (details.error === 'INSTRUMENT_DECLINED') {
                                return actions.restart();
                            }
                        });
                    });
                }
            }).render('#paypal-holder');
        </script>

    </form>

</body>
</html>
