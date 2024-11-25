<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="PPDWebsite.checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/themify-icons.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/theme.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/custom.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400%7CRaleway:100,400,300,500,600,700%7COpen+Sans:400,500,600' rel='stylesheet' type='text/css'/>

   
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="main-container">
           
		<section>

        <div class="container">
        <div class="row">
            <div class="col-md-1">

            </div>
            <div class="col-md-4" style="align-content:center; text-align:center">
                <img src="images/buy_devotional.png" />

                <p style="margin-top:40px">
                    The Pregnancy Prayer Devotional is your daily dose of the word of God that encourages and edifies you as you embark on this journey of motherhood. The pregnancy Prayer journal will bring understanding and revelation of your purpose as a mother and encourage you to use the power of the word of God and the power of words to speak into your unborn child before they are born. 280 days of revelation through the word will prepare you for the journey ahead. <b>Download the devotional for £14.99</b>.
                </p>
                <p>
                    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                        <input type="hidden" name="cmd" value="_s-xclick">
                        <input type="hidden" name="hosted_button_id" value="2UMRQDMMRDQ74">
                        <input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online!">
                        <img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
                     </form>
                </p>
            </div>
            <div class="col-md-2">

            </div>
            <div class="col-md-4" style="align-content:center; text-align:center">
                <img src="images/buy_journal.png" />

                <p style="margin-top:40px">
                    Pregnancy is a period filled with many emotions:  excitement, anxiety, love, peace and joy! Don’t let a moment pass without you capturing it in your Pregnancy Prayer Guide Journal. Your thoughts, moods, what you are hearing from God during your pregnancy are not things to allow slip by. Also include the daily prayer for that day in your journal entries. At the end of your pregnancy journey, download the journal into a complete e-journal which you can then take to a reputable printer to print into something you will refer to, go through with fondness and thanksgiving for many years to come. The journal is available to every user. At the end of your journey <b>download it for only £9.99</b>.
                </p>

                <p>
                    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                        <input type="hidden" name="cmd" value="_s-xclick">
                        <input type="hidden" name="hosted_button_id" value="S62ZSKV3H5JC6">
                        <input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online!">
                        <img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
                    </form>
                </p>
            </div>
            <div class="col-md-1">

            </div>
        </div>
       </div>

            </section>

            </div>

<script>

    // Render the PayPal button

    paypal.Button.render({

        // Set your environment

        env: 'sandbox', // sandbox | production

        // Specify the style of the button

        style: {
            label: 'paypal',
            size:  'medium',    // small | medium | large | responsive
            shape: 'rect',     // pill | rect
            color: 'blue',     // gold | blue | silver | black
            tagline: false    
        },

        // PayPal Client IDs - replace with your own
        // Create a PayPal app: https://developer.paypal.com/developer/applications/create

        client: {
            sandbox:    'AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R',
            production: '<insert production client id>'
        },

        payment: function(data, actions) {
            return actions.payment.create({
                payment: {
                    transactions: [
                        {
                            amount: { total: '0.01', currency: 'USD' }
                        }
                    ]
                }
            });
        },

        onAuthorize: function(data, actions) {
            return actions.payment.execute().then(function() {
                window.alert('Payment Complete!');
            });
        }

    }, '#paypal-button-container');

</script>
    
    </form>
</body>
</html>
