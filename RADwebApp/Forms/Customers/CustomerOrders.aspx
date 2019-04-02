<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerOrders.aspx.cs" Inherits="RADwebApp.CustomerOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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


       



        <h2><%=Request.QueryString["first"] + " " + Request.QueryString["last"] + "'s Orders" %></h2>
        <div>  
            
            <asp:Panel ID="panelSales" runat="server">
                <div class="container">
                    <div class="row">
                        <div class="text-center m-auto">
                <h3>Sales</h3>
                <asp:GridView ID="gvCustomerOrders" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsCustomerOrders" CssClass="table table-striped table-bordered table-responsive-lg">
                    <Columns>
                        <asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" />
                        <asp:BoundField DataField="ordDate" DataFormatString="{0:d}" HeaderText="Date" SortExpression="ordDate" />
                        <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                        <asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
                        <asp:BoundField DataField="orlQuantity" HeaderText="Quantity" SortExpression="orlQuantity" />
                        <asp:BoundField DataField="orlPrice" DataFormatString="{0:C}" HeaderText="Price" SortExpression="orlPrice" />
                        <asp:BoundField DataField="orlTotal" DataFormatString="{0:C}" HeaderText="Total" SortExpression="orlTotal" />
                        <asp:BoundField DataField="empFull" HeaderText="Employee" ReadOnly="True" SortExpression="empFull" />
                    </Columns>
                    <EmptyDataTemplate>
                        This customer does not have any sales orders yet.
                    </EmptyDataTemplate>
                </asp:GridView>
                            </div>
                        </div>
                    </div>
            </asp:Panel>


            <asp:Panel ID="panelRepairs" runat="server">
                <div class="container">
                    <div class="row">
                        <div class="text-center m-auto">
                <h3>Repairs</h3>
                <asp:GridView ID="gvCustomerRepairs" runat="server" AutoGenerateColumns="False" DataSourceID="dsCustomerRepairs" CssClass="table table-striped table-bordered table-responsive-lg">
                    <Columns>
                        <asp:BoundField DataField="ordNumber" HeaderText="Order Number" SortExpression="ordNumber" />
                        <asp:BoundField DataField="ordDate" HeaderText="Order Date" SortExpression="ordDate" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="payType" HeaderText="Payment Type" SortExpression="payType" />
                        <asp:BoundField DataField="empFirst" HeaderText="First Name" SortExpression="empFirst" />
                        <asp:BoundField DataField="empLast" HeaderText="Last Name" SortExpression="empLast" />
                        <asp:BoundField DataField="serName" HeaderText="Service Name" SortExpression="serName" />
                        <asp:BoundField DataField="serPrice" HeaderText="Service Price" SortExpression="serPrice" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="eqtType" HeaderText="Equiptment Type" SortExpression="eqtType" />
                    </Columns>
                    <EmptyDataTemplate>
                        This customer does not have any repairs orders yet.
                    </EmptyDataTemplate>
                </asp:GridView>
                            </div>
                        </div>
                    </div>
            </asp:Panel>
            <br />

            <div class="container">
                    <div class="row">
                        <div class="text-center m-auto">
            <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" CssClass="btn btn-outline-info mb-3" />
                            </div>
                        </div>
                    </div>
            <asp:ObjectDataSource ID="dsCustomerOrders" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.customerOrdersTableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="Param1" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsCustomerRepairs" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.customerRepairsTableAdapter">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="Param1" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>