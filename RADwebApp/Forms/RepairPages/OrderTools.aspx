<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderTools.aspx.cs" Inherits="RADwebApp.Forms.RepairPages.OrderTools" %>

<!DOCTYPE html>

<%--DESIGN PART DONE BY FILIP LYESOVYY--
---------------13/12/2018--------------%>

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
                            <% } %>                            <% } %>
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
                            <% } %>                            <% } %>
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



        <div class="container mt-4">
            <h3>Order Tools</h3>
            <br />
            <asp:HyperLink CssClass="btn btn-outline-primary" ID="hlOrderAllRepairs" runat="server" NavigateUrl="~/Forms/RepairPages/AllRepairs.aspx">All Repairs</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink CssClass="btn btn-outline-info" ID="hlOrderWarranty" runat="server" NavigateUrl="~/Forms/RepairPages/Warranty.aspx">Warranty</asp:HyperLink>
        </div>

        <div id="insertPanel" class="insertPanel container mt-3">
            <div class="row">
                <div class="col-lg-4">
                    <h3 class="mb-3">Crete a new Order</h3>
                    <div class=" col-lg-12 border rounded mb-4">
                        <asp:Label CssClass="" ID="lblCustFirst" runat="server" Text="Customer First Name"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtCustFirst" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblCustLast" runat="server" Text="Customer Last Name"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtCustLast" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblEmpFirst" runat="server" Text="Employee First Name"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtEmpFirst" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblEmpLast" runat="server" Text="Employee Last Name"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtEmpLast" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblEquipMod" runat="server" Text="Equipment Model"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtEqpMod" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblEqpSerNo" runat="server" Text="Equipment Serial No"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtEqpSerNo" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblEqpType" runat="server" Text="Equipment Type"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtEqpType" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblOrNo" runat="server" Text="Order Number"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtOrNo" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblOrDate" runat="server" Text="Order Date"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtOrDate" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button CssClass="btn btn-outline-success mb-3" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                        <br />
                    </div>
                </div>

                <div class="col-lg-6 text-center">
                    <a class="btn btn-outline-dark mb-3 mt-3" data-toggle="collapse" href="#collapse2" role="button" aria-expanded="false" aria-controls="collapseExample">See all Tool Orders
                    </a>
                    <div id="collapse2" class="collapse">
                        <asp:GridView CssClass="table table-striped table-bordered table-responsive-lg text-center" ID="gvToolOrders" runat="server" AutoGenerateColumns="False" DataSourceID="dsNewOrderTools">
                            <Columns>
                                <asp:BoundField DataField="Customer First Name" HeaderText="Customer First Name" SortExpression="Customer First Name" />
                                <asp:BoundField DataField="Customer Last Name" HeaderText="Customer Last Name" SortExpression="Customer Last Name" />
                                <asp:BoundField DataField="Equipment Model" HeaderText="Equipment Model" SortExpression="Equipment Model" />
                                <asp:BoundField DataField="Equipment Serial No" HeaderText="Equipment Serial No" SortExpression="Equipment Serial No" />
                                <asp:BoundField DataField="Order Number" HeaderText="Order Number" SortExpression="Order Number" />
                                <asp:BoundField DataField="Order Date" HeaderText="Order Date" SortExpression="Order Date" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </div>
        </div>
        <asp:ObjectDataSource ID="dbOrderTools" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.orderToolsSelectTableAdapter"></asp:ObjectDataSource>

        <br />
        <asp:ObjectDataSource ID="dsNewOrderTools" runat="server" DataObjectTypeName="aLibrary.EmmasDataSet+OrderToolsNewAddDataTable" InsertMethod="Fill" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.OrderToolsNewAddTableAdapter"></asp:ObjectDataSource>

    </form>
    </form>
</body>
</html>
