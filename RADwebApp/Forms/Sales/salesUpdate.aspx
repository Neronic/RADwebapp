<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="salesUpdate.aspx.cs" Inherits="RADwebApp.Forms.Sales.salesUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Sale</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="Welcome.aspx">Emma's Kiosk</a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item"><a class="nav-link" href="/Welcome.aspx">Home</a></li>
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Customers</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/Forms/Customers/Customers.aspx">Search</a>
                                <div class="dropdown-divider"></div>
                                <%if ((User.Identity.Name == "admin") || (User.Identity.Name == "manager") || (User.Identity.Name == "sales"))
                                    { %>
                                <a class="dropdown-item" href="/Forms/Customers/Customers.aspx?mode=addNew">Add New</a>
                                <%if (User.Identity.Name == "admin")
                                    { %>
                                <a class="dropdown-item" href="/Forms/Customers/Customers.aspx?mode=edit">Edit</a>
                                <a class="dropdown-item" href="/Forms/Customers/Customers.aspx?mode=delete">Remove</a>
                                <% } %>
                                <% } %>
                            </div>
                        </li>
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Services</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/Forms/RepairPages/AllRepairs.aspx">Repairs</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Forms/Sales/searchSales.aspx">Search for a Sale</a>
                                <%if (User.Identity.Name == "admin")
                                    { %>
                                <a class="dropdown-item" href="/Forms/Sales/SalesNew.aspx">New Sale</a>
                                <% } %>
                            </div>
                        </li>
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Employees</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/Forms/Employees/Employees.aspx">Search</a>
                                <div class="dropdown-divider"></div>
                                <%if ((User.Identity.Name == "admin") || (User.Identity.Name == "manager"))
                                    { %>
                                <a class="dropdown-item" href="/Forms/Employees/Employees.aspx?mode=addNew">Add New</a>
                                <a class="dropdown-item" href="/Forms/Employees/Employees.aspx?mode=edit">Edit</a>
                                <%if (User.Identity.Name == "admin")
                                    { %>
                                <a class="dropdown-item" href="/Forms/Employees/Employees.aspx?mode=delete">Remove</a>
                                <% } %>
                                <% } %>
                            </div>
                        </li>
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Orders</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/Forms/Inventory/Inventory.aspx">Inventory</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/Forms/RepairPages/OrderTools.aspx">Order Tools</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Documents</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/Forms/Reports/SalesRepairReport.aspx">Reports</a>
                                <a class="dropdown-item" href="/Forms/Reports/warrantyReport.aspx">Warranty Records</a>
                                <div class="dropdown-divider"></div>
                                
                                <a class="dropdown-item" href="/Forms/RepairPages/Policies.aspx">Policies</a>
                            </div>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    </ul>                    
                        <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" Text="Log Out"></asp:Button>                    
                </div>
            </nav>



        <div class="container mt-4" style="text-align: center;">
            <div class="row">
           <div class="col-lg-4 text-center m-auto ">

        <h3>
            EDIT SALE</h3>
        <p>
            <asp:Label ID="lblSave" runat="server" ForeColor="Red"></asp:Label>
        </p>
        <p>
            Order #:
            </p>
            <asp:TextBox ID="txtOrderNum" runat="server" CssClass="form-control input-lg"></asp:TextBox>
&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtOrderNum" ErrorMessage="Order # cannot be empty." ForeColor="Red">*</asp:RequiredFieldValidator>
            &nbsp;<p>
            Payment Type:
            </p>
            <asp:DropDownList ID="ddlPayType" runat="server" DataSourceID="dsPayType" DataTextField="payType" DataValueField="id" CssClass="form-control">
            </asp:DropDownList>
        
               <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlPayType" ErrorMessage="You must select a payment type." ForeColor="Red">*</asp:RequiredFieldValidator>
        
            <p><asp:Button ID="btnViewCart" runat="server" OnClick="btnViewCart_Click" Text="View Shopping Cart" class="btn btn-default"/></p>
            
        
            <asp:ListBox ID="lbCart" runat="server" Visible="False"></asp:ListBox>
        
            <asp:Button ID="btnSelect" runat="server" OnClick="btnSelect_Click" Text="Select" CssClass="btn btn-outline-info mb-3" />
            <p>
            Quantity:
                </p>
            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" CssClass="form-control input-lg"></asp:TextBox>
            <p>
            Order Notes:
            </p>
            <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" CssClass="form-control input-lg"></asp:TextBox>
            <p>
            Customer:
            </p>
            <asp:DropDownList ID="ddlCust" runat="server" DataSourceID="dsCustomer" DataTextField="custFull" DataValueField="id" CssClass="form-control">
            </asp:DropDownList>
               <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlCust" ErrorMessage="You must select a customer." ForeColor="Red">*</asp:RequiredFieldValidator>
            <p>
            Employee:
            </p>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlEmp" ErrorMessage="You must select a employee." ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:DropDownList ID="ddlEmp" runat="server" DataSourceID="dsEmployee" DataTextField="empFull" DataValueField="id" CssClass="form-control">
            </asp:DropDownList><p></p>
            

            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-outline-info mb-3"/>
            &nbsp;
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-outline-info mb-3"/>
       
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please, fix the following:" />
        <p>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:ObjectDataSource ID="dsPayType" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.paymentTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsCustomer" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.salesCustomerTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsEmployee" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.salesEmployeeTableAdapter"></asp:ObjectDataSource>
        </p>
        <p>
            &nbsp;</p>
               </div>
                </div>
            </div>
    </form>
</body>
</html>
