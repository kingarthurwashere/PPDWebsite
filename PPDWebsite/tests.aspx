<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tests.aspx.cs" Inherits="PPDWebsite.tests" %>

<!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <script src="https://raw.github.com/enyo/dropzone/master/downloads/dropzone.js"></script>
        <link href="http://www.dropzonejs.com/css/general.css?v=7" rel="stylesheet" />

        <!-- jQuery -->
        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="../vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="../vendors/nprogress/nprogress.js"></script>
        <!-- Dropzone.js -->
        <script src="vendors/dropzone/dist/min/dropzone.min.js"></script>

        <script type="text/javascript">
            Dropzone.options.myAwesomeDropzone = {
                paramName: "file", // The name that will be used to transfer the file
                maxFilesize: 2, // MB
                url: "/user/tasks/photoupload.aspx?tid=<%=Request.QueryString["tid"]%>"
            };
        </script>

    </head>
    <body>
        <form id="frmMain" runat="server">
            <div id="my-awesome-dropzone" class="dropzone">
                <div class="fallback">
                    <input name="file" type="file" multiple="multiple" runat="server"/>
                    <input name="btnUpload" type="submit" /><br /><br />
                    <asp:Label id="lblFallbackMessage" runat="server" />
                </div>
            </div>

        </form>
    </body>
    </html>