<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="journal-edit.aspx.cs" Inherits="PPDWebsite.journal_edit" %>

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
           function test(){
               alert('test');
           }
    </script>

    <script type="text/javascript">         
       function test2() {     
           $.ajax({
               type: "POST",
               contentType: "application/json; charset=utf-8",
               url: "journal-edit.aspx/closePic",
               dataType: "json",
               data: '{}',
               success: function (result) {
                   alert(result);
                   // window.location.href = "ClubCreation.aspx";
               },
               Error: function () {
                   alert('error');
               }
           });
       }
   </script>

    <script type="text/javascript">
        function successalert() {
            swal({
                title: 'Saved!',
                text: 'Your journal entry has been saved!',
                type: 'success'
            },
            function () {
                window.location.replace("journal-list.aspx");
            });
        }
    </script>

    <script type="text/javascript">
        function failedalert() {
            swal({
                title: 'Failed!',
                text: 'An error was encountered saving your journal entry',
                type: 'error'
            });
        }
    </script>
</head>
<body style="overflow:auto">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" EnablePartialRendering="true" runat="server" />

       <div id="uploadModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content  card">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title title">Attach Images</h4>
                </div>

                <div class="modal-body">                   
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>

                <div class="modal-footer">
                    <asp:Button runat="server" ID="cmdAttach" OnClick="cmdAttach_Click" CssClass="btn btn-pink pull-right" Text="Upload" style="margin-bottom:0px"/>
                </div>

            </div>
        </div>
    </div>

       
      <div class="nav-container">

          <nav class="absolute transparent">
                  <div class="nav-bar">
                      <div class="module widget-handle right">
                          <a href="dashboard.aspx"><img src="img/logo-icon-white.png"/></a>
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
                            <p class="lead bold "><asp:Label ID="lblUsersName" runat="server" Text="..."/><br /><a href="login.aspx" title="Logout"><img src="images/logout.png" style="height:22px"/></a></p>
                        </div>
		                <div class="col-xs-6">
		                    <h3 class="uppercase bold mb0">Your Journal</h3>
                        <p class="lead bold"><asp:Label ID="lblRecordCount" runat="server" Text="New Entry"/></p>
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
		                <div class="col-md-10">
                              <div class="mb24">                                  

                                    <div class="col-md-12">
                                        <p class="lead bold" style="margin-bottom:0px"><asp:Label ID="Label1" runat="server" ForeColor="GrayText" Text="Topic"/></p>
                                        <asp:TextBox runat="server" ID="txtJournalHeading" class="bordered" style="border-color:#FF0066;border-width:1px;border-style:Solid;"></asp:TextBox> 
                                        <div class="card">
                                            <p class="lead bold" style="margin-bottom:0px"><asp:Label ID="Label2" runat="server" ForeColor="GrayText" Text="Body"/></p>
                                            <asp:Textbox runat="server" ID="txtJournalBody" TextMode="MultiLine" class="bordered" style="border-color:#FF0066;border-width:1px;border-style:Solid;height:220px;"></asp:Textbox>
                                        </div>
                                    </div>
                              </div>
                            <div class="row">
		                        

		                    </div>
		                </div>
                        <div class="col-md-2">
                         
                          <asp:Literal runat="server" ID="ltrPhoto"></asp:Literal>
                                                      
                         <asp:LinkButton runat="server" ID="cmdSave" CssClass="btn btn-pink btn-block" OnClick="cmdSave_Click" Text="<i class='ti-save'>&nbsp;</i>Save Entry" />
                            
                            
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