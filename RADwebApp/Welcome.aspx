<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="RADwebApp.Welcome" %>

<!DOCTYPE html>

<%--DESIGN PART DONE BY FILIP LYESOVYY--
---------------13/12/2018--------------%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Emma's | Welcome Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body style="width: 100%">
    <form id="form2" runat="server">
        <asp:Panel ID="pnlContent" runat="server" Visible="True" Wrap="True">
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
                                <%if ((User.Identity.Name == "admin") || (User.Identity.Name == "manager") || (User.Identity.Name == "sales"))
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
                                <a class="dropdown-item" href="/Forms/Customers/Customers.aspx?mode=addNew">Add New</a>
                                <a class="dropdown-item" href="/Forms/Customers/Customers.aspx?mode=edit">Edit</a>
                                <%if (User.Identity.Name == "admin")
                                    { %>
                                <a class="dropdown-item" href="/Forms/Customers/Customers.aspx?mode=delete">Remove</a>
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

            <%--END OF NAV BAR--%>

            <div class="container text-center display-3 mt-3">
                <strong>Welcome</strong>
            </div>
            <div class="container">
                <div class="row form-group container mt-5">
                    <div class="col-lg-4  text-center">
                        <div class="container ">
                            <a href="Forms/Customers/Customers.aspx" class="btn btn-outline-info mb-3">CUSTOMERS
                            </a>
                            <br />
                            <a href="Forms/Customers/Customers.aspx">
                                <asp:Image src="Images/customers-icon.png" Alt="Customers-icon" ID="imgCustomer" runat="server" CssClass="mb-2" /></a>
                        </div>
                    </div>
                    <div class="col-lg-4 text-center">
                        <div class="container">
                            <a href="#collapse1" class="btn btn-outline-info mb-3" data-toggle="collapse" aria-expanded="false" aria-controls="collapse1">SERVICES
                            </a>
                            <br />
                            <a href="#collapse1" data-toggle="collapse" aria-expanded="false" aria-controls="collapse1">
                                <asp:Image src="Images/services-icon.png" Alt="Services-icon" ID="imgServices" runat="server" CssClass="" /></a>
                        </div>
                        <div class="collapse" id="collapse1">
                            <div class="row mt-2">
                                <div class="col">
                                    <h4 class="">Repairs</h4>
                                    <div class="btn-group">
                                        <asp:Button CssClass="btn" Text="Search" runat="server" />
                                    </div>
                                </div>
                                <div class="col">
                                    <h4 class="">Sales</h4>
                                    <div class="btn-group">
                                        <asp:Button CssClass="btn" Text="Search" runat="server" />
                                        <asp:Button CssClass="btn" Text="New" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 text-center">
                        <div class="container ">
                            <a href="Forms/Employees/Employees.aspx" class="btn btn-outline-info mb-3">EMPLOYEES
                            </a>
                            <br />
                            <a href="Forms/Employees/Employees.aspx">
                                <asp:Image src="Images/employees-icon.png" Alt="Employees-icon" ID="imgEmployees" runat="server" CssClass="mb-2" /></a>
                        </div>
                    </div>
                </div>
                <div class="row form-group container" style="margin-top: 40px;">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-4 text-center">
                        <div class="container ">
                            <a href="/Forms/Inventory/Inventory.aspx" class="btn btn-outline-info mb-3">INVENTORY
                            </a>
                            <br />
                            <a href="/Forms/Inventory/Inventory.aspx">
                                <asp:Image src="Images/inventory-icon.png" Alt="Inventory-icon" ID="imgInventory" runat="server" CssClass="mb-1" /></a>
                        </div>
                    </div>
                    <div class="col-lg-4 text-center">
                        <div class="container ">
                            <a href="#collapse2" class="btn btn-outline-info mb-3" data-toggle="collapse" aria-expanded="false" aria-controls="collapse2">DOCUMENTS
                            </a>
                            <br />
                            <a href="#collapse2" data-toggle="collapse" aria-expanded="false" aria-controls="collapse2">
                                <asp:Image src="Images/reports-icon.png" Alt="Reports-icon" ID="imgReports" runat="server" CssClass="mb-1" /></a>
                        </div>
                        <div class="collapse" id="collapse2">
                            <div class="btn-group mt-2">
                                <a href="/Forms/Reports/SalesRepairReport.aspx">
                                    <asp:Button CssClass="btn" Text="Reports" runat="server" /></a>
                                <a href="/Forms/Reports/warrantyReport.aspx">
                                    <asp:Button CssClass="btn" Text="Warranty Records" runat="server" /></a>
                                <a href="/Forms/RepairPages/Policies.aspx">
                                    <asp:Button CssClass="btn" Text="Policies" runat="server" /></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
