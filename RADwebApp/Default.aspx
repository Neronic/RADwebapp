<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MovieWeb.Landing" %>

<!DOCTYPE html>

<%--DESIGN PART DONE BY FILIP LYESOVYY--
---------------13/12/2018--------------%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Emma's | Homepage</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script src="Scripts/popper.js"></script>
    <style type="text/css">
        body {
            background-image: url("images/car-background.png");
            background-size: cover;
        }
    </style>
</head>
<body>
    <div class="card-header bg-transparent text-white mb-5">
           <%: DateTime.Now.Date.ToLongDateString() %>
    </div>
        <div class="col-sm-2 offset-5 jumbotron">
    <form class="text-center" id="form1" runat="server">
            <asp:Image  src="Images/emmas-logo.png" Alt="emmas-logo" ID="Image1" runat="server" /><br />
            <asp:Button CssClass="btn btn-secondary mt-5" ID="btnLogin" runat="server" Text="Sign In" Height="50px" Width="120px" OnClick="btnLogin_Click" />
    </form>
    </div>
</body>
</html>

