<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="warrantyReport.aspx.cs" Inherits="RADwebApp.Forms.Reports.warrantyReport" %>

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

    <style type="text/css">
        .auto-style1 {
            width: 145px;
        }

        .auto-style2 {
            width: 154px;
        }

        .auto-style3 {
            width: 145px;
            height: 26px;
        }

        .auto-style4 {
            width: 154px;
            height: 26px;
        }

        .auto-style5 {
            height: 26px;
        }

        .auto-style6 {
            width: 100%;
            margin-bottom: 3px;
        }
    </style>
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

            <%--END OF NAV BAR--%>



        <div class="container mt-3">
            <h3>Warranty Reports</h3>
            <br />
            <table class="auto-style6">
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <h3>Search</h3>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Order #:</td>
                    <td class="auto-style4">
                        <asp:TextBox CssClass="form-control" ID="txtOrderNumber" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style3">Customer:</td>
                    <td class="auto-style4">
                        <asp:TextBox CssClass="form-control" ID="txtCustomer" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Button CssClass="btn " ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
            </table>
            <br />


            <div class="row">
                <div class="col-lg-8 text-center ">
                    <asp:GridView CssClass="table table-striped table-bordered table-responsive-lg" ID="gvWarrantyReport" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsWarrantyReport" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" />
                            <asp:CheckBoxField DataField="serordWarranty" HeaderText="Warranty" SortExpression="serordWarranty" />
                            <asp:BoundField DataField="serName" HeaderText="Service" SortExpression="serName" />
                            <asp:BoundField DataField="custFull" HeaderText="Customer" ReadOnly="True" SortExpression="custFull" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>
            </div>


            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:ObjectDataSource ID="dsWarrantyReport" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.warrantyReportTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCustomer" ConvertEmptyStringToNull="False" Name="custName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtOrderNumber" Name="ordNum" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
        </div>
    </form>
</body>
</html>
