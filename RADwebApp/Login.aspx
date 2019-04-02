<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RADwebApp.LOG" %>

<!DOCTYPE html>

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
            margin: auto;
            font-size: 16px;
            font-family: Arial;
            max-width: 100%;
            height: 100%;
            background-size: cover;
            background-image: url("images/car-background.png");
            
        }
       

        .center {
           
            margin: 0 auto;
            width: 30%;
            padding: 70px 0;
            text-align: center;
            position: center;
        }
        .txtbox {
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                width: 150px;
            }
    </style>
</head>
<body>
     <div class="card-header bg-transparent text-white mb-5">
           <%: DateTime.Now.Date.ToLongDateString() %>
    </div>
        <div class="col-sm-2 offset-5 jumbotron">
            <form class="text-center" id="form1" runat="server">
                
            <asp:Image src="Images/emmas-logo.png" Alt="emmas-logo" ID="logo" runat="server" /><br /><br />
            <asp:TextBox ID="txtUser" placeholder="Username" runat="server" TabIndex="1" CssClass="txtbox" OnTextChanged="txtUser_TextChanged" style="text-align: center" ></asp:TextBox><br /><br />
            <asp:TextBox ID="txtPass" placeholder="Password" runat="server" TextMode="Password" TabIndex="1" CssClass="txtbox" OnTextChanged="txtPass_TextChanged" style="text-align: center"></asp:TextBox><br /><br />
            <asp:Button CssClass="btn btn-secondary mt-5" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" style="text-align: center" Height="50px" Width="120px" /> 
            <br />
            <asp:Label ID="lblMessage" runat="server" CssClass="alert-danger"></asp:Label>
    </form>
            </div>
</body>
</html>