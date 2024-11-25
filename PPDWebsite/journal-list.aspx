<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="journal-list.aspx.cs" Inherits="PPDWebsite.journal_list" %>

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
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400%7CRaleway:100,400,300,500,600,700%7COpen+Sans:400,500,600' rel='stylesheet' type='text/css'/>
    <link href="css/fileupload.css" rel="stylesheet" />
    <!--  Below CSS is for styling the alerts    -->
    <!--<link href="css/light-bootstrap-dashboard.css" rel="stylesheet"/>-->
    <link href="css/sweetalert.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'/>
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />

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
                            <div class="col-md-12 text-right username_text">
                            <p class="lead bold "><asp:Label ID="lblUsersName" runat="server" Text="..."/><br /><a href="login.aspx" title="Logout"><img src="images/logout.png" style="height:22px"/></a></p>
                        </div>

                            <a href="getjournal.aspx"class="pull-right" style="width:100px"><i class="ti-shopping-cart">&nbsp;</i>Buy Journal</a>
                        </div>
		                <div class="col-xs-6">
		                    <h3 class="uppercase bold mb0">Your Journal</h3>
                        <p class="lead bold"><asp:Label ID="lblRecordCount" runat="server" Text="0 Entries"/></p>
                        <p class="left bold tile-left left">
                            <a href="dashboard.aspx">
                                <span class="btn btn-pink"><i class="ti-angle-left">&nbsp;</i>Dashboard</span>

                            </a></p>
		                </div>
		            </div>

		        </div>
		    </section>


        <section class=" entriesList mb0 pb0">

		        <div class="container">
		            <div class="row">
		                <div class="col-md-10">
                      <div class="mb24">
                        
                          <asp:Literal ID="ltrJournal" runat="server"></asp:Literal>

                        <div class="deleteAll col-md-12 mb32">
                          <!--<i class="ti-trash pull-left deleteEntry">&nbsp;</i><span class="italic">Delete Selected</span>-->
                            <span>&nbsp;</span>
                        </div>
                      </div>
		            </div>
                <div class="col-md-2">
                  <a href="journal-edit.aspx" style="margin-top:20px"><button class="btn btn-pink col-md-12"><i class="ti-plus">&nbsp;</i>New Entry</button></a>
                  <!--<a href="journal-view.html"><button class="btn btn-pink col-md-12"><i class="ti-eye">&nbsp;</i>View Entry</button></a>-->
                </div>
		            </div>

		        </div>

		    </section>
            <!--
        <section class="mt0 pb0 pt0 mb0">
          <div class="text-center">
              <ul class="pagination">
                  <li>
                      <a href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                      </a>
                  </li>
                  <li class="active">
                      <a href="#">1</a>
                  </li>
                  <li>
                      <a href="#">2</a>
                  </li>
                  <li>
                      <a href="#">3</a>
                  </li>
                  <li>
                      <a href="#">4</a>
                  </li>
                  <li>
                      <a href="#">5</a>
                  </li>
                  <li>
                      <a href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                      </a>
                  </li>
              </ul>
          </div>
     
        </section>
            -->
      </div>


	<script src="js/jquery.min.js"></script>
        <script src="js/sweetalert.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/parallax.js"></script>
        <script src="js/scripts.js"></script>
    </body>

    <script>
    $('.deleteEntrysd').click(function() {
    swal({
      title: "Are you sure?",
      text: "Do you want to delete this journal entry? This cannot be undone!",
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

    <script>
        function deleteEntry(jid) {
            
                swal({
                    title: "Are you sure?",
                    text: "Do you want to delete this journal entry? This cannot be undone!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#ff0000",
                    confirmButtonText: "Yes, delete it!",
                    closeOnConfirm: false
                },
                    function () {
                        DeleteJournalEntry(jid);
                    });
            
        }
    </script>

    <script>

        function DeleteJournalEntry(jid) {
            var pageUrl = '<%= ResolveUrl("~/journal-list.aspx/DeleteJournalEntry") %>';

            var parameter = { "jid": jid}

            $.ajax({
                type: 'POST',
                url: pageUrl,
                data: JSON.stringify(parameter),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (result) {
                    onDeleteSuccess(result.d);
                },
                error: function (data, success, error) {
                    alert("Error : " + error);
                }
            });

            return false;
        }
        function onDeleteSuccess(data) {

            if (data == "1") {
                
                swal({
                    title: "Deleted!",
                    text: "Your entry has been deleted.",
                    type: "success"
                },
                    function () {
                        window.location.href = window.location.href;
                    });
                
            } else {
                swal("Error!", "There was an error in deleting your entry. Please try again!", "error");
            }
            
            
        }

    </script>
</html>