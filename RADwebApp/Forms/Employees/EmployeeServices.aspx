<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeServices.aspx.cs" Inherits="RADwebApp.Forms.Employees.EmployeeServices" %>

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




        <div class="container mt-4">
            <div class="row">
                <div class="col-lg-6 text-center m-auto">
                    <h2><%=Request.QueryString["first"] + " " + Request.QueryString["last"] + "'s Services" %></h2>
                </div>
            </div>
        </div>
        <div>
            <div class="container mt-4">
                <div class="row">
                    <div class="col-lg-6 text-center m-auto">
                        <asp:Panel runat="server" ID="panelRepairs" Visible="False">
                            <h3>Repairs</h3>
                            <asp:GridView CssClass="table table-striped table-bordered table-responsive-lg" ID="gvEmployeeRepairs" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsEmployeeRepairs">
                                <Columns>
                                    <asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" />
                                    <asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="ordDate" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="custName" HeaderText="Customer" ReadOnly="True" SortExpression="custName" />
                                    <asp:BoundField DataField="eqtType" HeaderText="Equipment" SortExpression="eqtType" />
                                    <asp:BoundField DataField="serPrice" HeaderText="Price" SortExpression="serPrice" DataFormatString="{0:C}" />
                                </Columns>
                                <EmptyDataTemplate>
                                    This employee has no repairs services.
                                </EmptyDataTemplate>
                            </asp:GridView>

                        </asp:Panel>
                    </div>
                </div>
            </div>


            <div class="container mt-4">
                <div class="row">
                    <div class="col-lg-6 text-center m-auto">
                        <asp:Panel runat="server" ID="panelSales" Visible="False">
                            <h3>Sales</h3>
                            <asp:GridView CssClass="table table-striped table-bordered table-responsive-lg" ID="gvEmployeeSales" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsEmployeeSales">
                                <Columns>
                                    <asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" />
                                    <asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="ordDate" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="custName" HeaderText="Customer" ReadOnly="True" SortExpression="custName" />
                                    <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                                    <asp:BoundField DataField="orlQuantity" HeaderText="Quantity" SortExpression="orlQuantity" />
                                    <asp:BoundField DataField="orlPrice" HeaderText="Price" SortExpression="orlPrice" DataFormatString="{0:C}" />
                                </Columns>
                                <EmptyDataTemplate>
                                    This employee has no sales services.
                                </EmptyDataTemplate>
                            </asp:GridView>

                        </asp:Panel>
                        <asp:Panel runat="server" ID="panelNone" Visible="False">
                            <p>This employee is not directly related to any Sales or Repairs services.</p>

                        </asp:Panel>

                        <div class="container">
                            <div class="row">
                                <div class="text-center m-auto">
                                    <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" CssClass="btn btn-outline-info mb-3" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>



        </div>
        <asp:ObjectDataSource ID="dsEmployeeRepairs" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.employeeRepairsTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="Param1" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsEmployeeSales" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.employeeSalesTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="Param1" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>

</body>
</html>
