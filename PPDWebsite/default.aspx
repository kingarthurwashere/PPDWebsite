<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="PPDWebsite._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<title>Pregnancy Prayer</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<link rel="stylesheet" type="text/css" href="css_site/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css_site/font-awesome.css"/>
		<link rel='stylesheet' id='camera-css'  href='css_site/camera.css' type='text/css' media='all'/>

		<link rel="stylesheet" type="text/css" href="css_site/slicknav.css"/>
		<link rel="stylesheet" href="css_site/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css_site/style.css"/>
		
		
		<script type="text/javascript" src="js_site/jquery-1.8.3.min.js"></script>

		<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700|Open+Sans:700' rel='stylesheet' type='text/css'/>
		<script type="text/javascript" src="js_site/jquery.mobile.customized.min.js"></script>
		<script type="text/javascript" src="js_site/jquery.easing.1.3.js"></script> 
		<script type="text/javascript" src="js_site/camera.min.js"></script>
		<script type="text/javascript" src="js_site/myscript.js"></script>
		<script src="js_site/sorting.js" type="text/javascript"></script>
		<script src="js_site/jquery.isotope.js" type="text/javascript"></script>
		<!--script type="text/javascript" src="js_site/jquery.nav.js"></script-->
		<script>
			jQuery(function(){
					jQuery('#camera_wrap_1').camera({
					transPeriod: 500,
					time: 3000,
					height: '490px',
					thumbnails: false,
					pagination: true,
					playPause: false,
					loader: false,
					navigation: false,
					hover: false
				});
			});
		</script>
	</head>
<body>
    <form id="form1" runat="server">
    
        <!--home start-->
    
    <div id="home">
    	<div class="headerLine">
	<div id="menuF" class="default">
		<div class="container">
			<div class="row">
				<div class="logo col-md-4">
					<div>
						<a href="#">
							<img src="images/logo.png">
						</a>
					</div>
				</div>
				<div class="col-md-8">
					<div class="navmenu"style="text-align: center;">
						<ul id="menu">
							<li class="active" ><a href="#home">Home</a></li>
							<li><a href="#">About</a></li>
							<!--<li><a href="#news">Shop</a></li>-->
							<li class="last"><a href="login.aspx">Enter App</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="container">
			<div class="row wrap">
				<div class="col-md-12 gallery"> 
						<div class="camera_wrap camera_white_skin" id="camera_wrap_1">
							<div data-thumb="" data-src="images/slides/blank.gif">
								<div class="img-responsive camera_caption fadeFromBottom">
									<h2 style="font-size:60px">Follow the daily devotional as you journey through your pregnancy.</h2>
								</div>
							</div> 
							<div data-thumb="" data-src="images/slides/blank.gif">
								<div class="img-responsive camera_caption fadeFromBottom">
									<h2 style="font-size:70px">Get daily baby development info.</h2>
								</div>
							</div>
                            <div data-thumb="" data-src="images/slides/blank.gif">
								<div class="img-responsive camera_caption fadeFromBottom">
									<h2 style="font-size:60px">A devotion for every day of your pregnancy .</h2>
								</div>
							</div>
                            <!--
                            <div data-thumb="" data-src="images/slides/blank.gif">
								<div class="img-responsive camera_caption fadeFromBottom">
									<h2 style="font-size:60px">Document your thoughts, experiences in your private journal.</h2>
								</div>
							</div>
                            -->
                            <div data-thumb="" data-src="images/slides/blank.gif">
								<div class="img-responsive camera_caption fadeFromBottom">
									<h2 style="font-size:70px">Pray for your growing baby everyday from day 1 to day 280.</h2>
								</div>
							</div>
                            <div data-thumb="" data-src="images/slides/blank.gif">
								<div class="img-responsive camera_caption fadeFromBottom">
									<h2 style="font-size:70px">Save your favourite daily prayers to revisit.</h2>
								</div>
							</div>
						</div><!-- #camera_wrap_1 -->
				</div>
			</div>
		</div>
	</div>
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					
				</div>
				<div class="col-md-8" style="text-align:center">

                    <h4 style="margin-top:40px">The <strong>Pregnancy Prayer Guide</strong> is a web app that is based on the scripture in the Book of Psalms 139:14- I praise you, for I am fearfully and wonderfully made. Wonderful are your works; my soul knows it very well (ESV). A web app created for the Christian mother-to-be which gives a day-by-day guide of her pregnancy plus a daily prayer for her growing child. This app serves to encourage and pray the word of God over the baby she is carrying for the entire 280 days (40 week) gestation period. Covering every aspect of the baby’s development and the changes that the mother’s body goes through.<br /><br /> This is an app that every Christian expecting mother should not be without!</h4>
					
                    <hr />
                    <br />
                    <div class="row">
                        <div class="col-md-4" style="text-align:center">
                            <div style="height:30px"><b>Get the Pregnancy Prayer Guide Book</b></div><br />
                             <a href='https://www.amazon.com/Pregnancy-Prayer-Guide-Book-Wonderfully-ebook/dp/B07SKKRFNK/ref=sr_1_3?keywords=Pregnancy+Prayer+Guide&qid=1562059293&s=books&sr=1-3' target="_blank"><img alt='Available on Amazon' src='img/amazon-badge.png' style="height: 40px; margin-top:10px" /></a>
					   </div>
                        <div class="col-md-4" style="text-align:center" >
                            <div style="height:30px"><b>Download the Android App</b></div><br />
                            <a href='https://play.google.com/store/apps/details?id=com.luminsoft.pregnancyprayer2&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1' target="_blank"><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png' style="height:60px;"/></a>
					    </div>
                        <div class="col-md-4" style="text-align:center">
                            <div style="height:30px"><b>Get the Pregnancy Prayer Guide Devotional</b></div><br />
                            <a href='https://www.amazon.com/Pregnancy-Prayer-Guide-Devotional-Wonderfully-ebook/dp/B07SKJ7QGP/ref=sr_1_4?keywords=Pregnancy+Prayer+Guide&qid=1562059347&s=books&sr=1-4' target="_blank"><img alt='Available on Amazon' src='img/amazon-badge.png' style="height: 40px; margin-top: 10px;" /></a>
                        </div>
                    </div>
                    
					
				</div>
				<div class="col-md-2">
					
				</div>
			</div>
           
		</div>
		<!--<div class="container">
			<div class="row">
				<div class="col-md-12 cBusiness">
					<h3>The Best Way to Create Business Site &ndash; Attractive One Page</h3>
					<h4>Discover elegant solution for your online business fast, reliable, affordable.</h4>
				</div>
			</div>
		</div>
		<div class="container"> -->
			
		</div>   
   
    
    <!--about start-->    
    
    <div id="about">
	
    	<div class="line2">
			<div class="container">
				<div class="row Fresh">
					<div class="col-md-6 Des">
						<i class="fa fa-heart"></i>
						<h4>Pray</h4>
						<p>Follow the daily prayers for your growing baby. Pray the word of God over your child daily.</p>
					</div>
                    <!--
					<div class="col-md-4 Ver">
						<i class="fa fa-cog"></i>
						<h4>Your journal</h4>
						<p>Journal your thoughts and experiences on your exciting journey to becoming a new mother and at the end of the journey receive an e-journal of your journal which you can get professionally printed and keep as a reminder of your journey.</p>
					</div>-->
					<div class="col-md-6 Fully">
						<i class="fa fa-tablet"></i>
						<h4>Devotional</h4>
						<p>Follow the daily devotional that gives you revelation of Gods purpose as a mother and God’s purpose for your unborn child.</p>
					</div>		
				</div>
			</div>
		</div>
	
			<div class="row">
				<div class="col-md-12 wwa" >
					<span name="about" ></span>
					<h3>About the app</h3>
					<h4 style="margin-left:10%; margin-right:10%">The Pregnancy Prayer Guide Web App is an evolution from the pregnancy prayer app. Praying for your unborn baby DAILY is paramount. Prayer is a powerful tool to communicate with our Creator and even more powerful when we pray the Word of God! We cannot wait to start praying for your child when they are born but to do so as soon as you know you are expecting. This web app helps you pray for your baby daily, to speak and declare God’s word to and over your baby with each day. To shape and create greatness into your baby before he evens takes his first breathe! It also gives you the opportunity to journal your journey capturing your thoughts with each day, saving your favorite prayers and scriptures, uploading pictures into a journal that you will forever cherish, refer to and share with your child. The daily devotional is unique in that it gives you revelation of God’s purpose and plan for mothers and our babies. This is a web app every Christian mother to be should have and use.</h4>
				</div>
			</div>
		</div>
		
	<div class="container">
			<div class="row">
				<div class="col-md-12 hr1">
					<hr/>
				</div>
			</div>
		</div>		
	
	<div class="container">
			<div class="row aboutUs">
				<div class="col-md-12 ">
					<h3>Testimonials</h3>
				</div>
			</div>
		</div>
		
	<div style="position: relative;">
		
			<div class="container">
				<div class="row about">
					<div class="col-md-6">
						<div class="about1">
						
							<h3>Jenn DuBose </h3>
							<p>Thank you I just want to say thank you for making a Godly Inspirational app to help us pray over every aspect of our pregnancy. Thank you so very much and God Bless you!!</p>
						</div>
					</div>
					<div class="col-md-6">
						<div class="about2">						
							<h3>Trenchee Dat </h3>
							<p>This app is the truth! The symptoms, even the ones not normally brought up in everyday discussions, is discussed on the app with makes me feel like I'm not alone with certain symptoms i have...with an amazing prayer daily.</p>
						</div>
					</div>
				</div>
			</div>
		
			<div class="horL"></div>
		
			<div class="container">
				<div class="row about">
					<div class="col-md-6">
						<div class="about1">
							<h3>Vandana Andrews</h3>
							<p>Love it. Thanks for creating such a beautiful app.</p>
						</div>
					</div>
					<div class="col-md-6">
						<div class="about2">
							<h3>Anonymous</h3>
							<p>This is the best app, every women deserves.. Every day i feel something is lifted off my shoulders, it's just superb#wondermaglorious</p>
						</div>
					</div>
				</div>
			</div>

		</div>
        
    <!--contact start-->
   
    <div id="contact">
    	
		<div class="line5">					
			<div class="container">
				<div class="row Ama">
					<div class="col-md-12">
					<h3>Got a Question? We&rsquo;re Here to Help!</h3>
					<p>Get in touch with us</p>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="container">
			<div class="row">
                <div class="col-md-1"></div>
				<div class="col-md-10 col-xs-8 forma" style="text-align:center">
					<div>
						
                        <asp:TextBox runat="server" ID="txtName" CssClass="col-md-6 col-xs-12 name" placeholder='Name *' required="required"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtEmail" CssClass="col-md-6 col-xs-12 Email" placeholder='Email *' required="required"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtSubject" CssClass="col-md-12 col-xs-12 Subject" placeholder='Subject' required="required"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtMessage" TextMode="Multiline" CssClass="col-md-12 col-xs-12 Message"  placeholder='Message' required="required"></asp:TextBox>
                       
                        
						<!--<input type="text" class="col-md-6 col-xs-12 Email" name='Email' placeholder='Email *'/>
						<input type="text" class="col-md-12 col-xs-12 Subject" name='Subject' placeholder='Subject'/>
						<textarea type="text" class="col-md-12 col-xs-12 Message" name='Message' placeholder='Message *'></textarea>-->
						<div class="cBtn col-xs-12">
                            <asp:Button runat="server" ID="cmdSendMessage" ForeColor="White" CssClass="send" Text="Send Message" OnClick="cmdSendMessage_Click" />
							<ul>
								
								<!--<li class="send"><a href="#"><i class="fa fa-share"></i>Send Message</a></li>-->
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
		
		
		
		<!--
		<div class="line7">
			<div class="container">
				<div class="row footer">
					<div class="col-md-12">
						<h3>Subscribe for Our Newsletter!</h3>
						<p>Subscribe to our newsletter email to get notification about fresh news, latest promos, giveaways and free stuff from Skew. Stay always up-to-date!</p>
						<div class="fr">
						<div style="display: inline-block;">
							<input class="col-md-6 fEmail" name='Email' placeholder='Enter Your Email'/>
							<a href="#" class="subS">Subscribe!</a>
						</div>
						</div>
					</div>
					<div class="soc col-md-12">
						<ul>
							<li class="soc1"><a href="#"></a></li>
							<li class="soc2"><a href="#"></a></li>
							<li class="soc3"><a href="#"></a></li>
							<li class="soc4"><a href="#"></a></li>
							<li class="soc5"><a href="#"></a></li>
							<li class="soc6"><a href="#"></a></li>
							<li class="soc7"><a href="#"></a></li>
							<li class="soc8"><a href="#"></a></li>
							
						</ul>
					</div>
				</div>
			</div>
		</div>
		-->
		<div class="lineBlack">
			<div class="container">
				<div class="row downLine">
					<div class="col-md-12 text-right">
						<!--input  id="searchPattern" type="search" name="pattern" value="Search the Site" onblur="if(this.value=='') {this.value='Search the Site'; }" onfocus="if(this.value =='Search the Site' ) this.value='';this.style.fontStyle='normal';" style="font-style: normal;"/-->
						<input  id="searchPattern" type="search" placeholder="Search the Site"/><i class="glyphicon glyphicon-search" style="font-size: 13px; color:#a5a5a5;" id="iS"></i>
					</div>
					<div class="col-md-6 text-left copy">
						<p>Copyright &copy; 2017 Twelve Tribes Apps. All Rights Reserved.</p>
					</div>
					<div class="col-md-6 text-right dm">
						<ul id="downMenu">
							<li class="active"><a href="#home">Home</a></li>
							<li><a href="#">About</a></li>
							<!--<li><a href="#project1">Shop</a></li>-->
							<li><a href="login.aspx">Enter App</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
    </div>		
		
		
	
   
    </form>

    <script src="js_site/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
	<script src="js_site/bootstrap.min.js"></script>
	<script src="js_site/jquery.slicknav.js"></script>
	<script>
        $(document).ready(function () {
            $(".bhide").click(function () {
                $(".hideObj").slideDown();
                $(this).hide(); //.attr()
                return false;
            });
            $(".bhide2").click(function () {
                $(".container.hideObj2").slideDown();
                $(this).hide(); // .attr()
                return false;
            });

            $('.heart').mouseover(function () {
                $(this).find('i').removeClass('fa-heart-o').addClass('fa-heart');
            }).mouseout(function () {
                $(this).find('i').removeClass('fa-heart').addClass('fa-heart-o');
            });

            function sdf_FTS(_number, _decimal, _separator) {
                var decimal = (typeof (_decimal) != 'undefined') ? _decimal : 2;
                var separator = (typeof (_separator) != 'undefined') ? _separator : '';
                var r = parseFloat(_number)
                var exp10 = Math.pow(10, decimal);
                r = Math.round(r * exp10) / exp10;
                rr = Number(r).toFixed(decimal).toString().split('.');
                b = rr[0].replace(/(\d{1,3}(?=(\d{3})+(?:\.\d|\b)))/g, "\$1" + separator);
                r = (rr[1] ? b + '.' + rr[1] : b);

                return r;
            }
        });			
			
	</script>

	<script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery('#menu').slicknav();

        });
	</script>
	
	<script type="text/javascript">
    $(document).ready(function(){
       
        var $menu = $("#menuF");
            
        $(window).scroll(function(){
            if ( $(this).scrollTop() > 100 && $menu.hasClass("default") ){
                $menu.fadeOut('fast',function(){
                    $(this).removeClass("default")
                           .addClass("fixed transbg")
                           .fadeIn('fast');
                });
            } else if($(this).scrollTop() <= 100 && $menu.hasClass("fixed")) {
                $menu.fadeOut('fast',function(){
                    $(this).removeClass("fixed transbg")
                           .addClass("default")
                           .fadeIn('fast');
                });
            }
        });
	});
    //jQuery
	</script>
	<script>
		/*menu*/
		function calculateScroll() {
			var contentTop      =   [];
			var contentBottom   =   [];
			var winTop      =   $(window).scrollTop();
			var rangeTop    =   200;
			var rangeBottom =   500;
			$('.navmenu').find('a').each(function(){
				contentTop.push( $( $(this).attr('href') ).offset().top );
				contentBottom.push( $( $(this).attr('href') ).offset().top + $( $(this).attr('href') ).height() );
			})
			$.each( contentTop, function(i){
				if ( winTop > contentTop[i] - rangeTop && winTop < contentBottom[i] - rangeBottom ){
					$('.navmenu li')
					.removeClass('active')
					.eq(i).addClass('active');				
				}
			})
		};
		
		$(document).ready(function(){
			calculateScroll();
			$(window).scroll(function(event) {
				calculateScroll();
			});
			$('.navmenu ul li a').click(function() {  
				$('html, body').animate({scrollTop: $(this.hash).offset().top - 80}, 800);
				return false;
			});
		});		
	</script>	
	<script type="text/javascript" charset="utf-8">

		jQuery(document).ready(function(){
			jQuery(".pretty a[rel^='prettyPhoto']").prettyPhoto({animation_speed:'normal',theme:'light_square',slideshow:3000, autoplay_slideshow: true, social_tools: ''});
			
		});
	</script>
</body>
</html>
