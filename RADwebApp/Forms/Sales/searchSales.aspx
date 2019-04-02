<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchSales.aspx.cs" Inherits="RADwebApp.Forms.Sales.searchSales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style type="text/css">
        body{
            background-color:white;
        }
        .auto-style1 {
            width: 99px;
        }
        .auto-style2 {
            width: 143px;
        }
        .auto-style3 {
            width: 42px;

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
                                <% } %>                                <% } %>
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
                                <a class="dropdown-item" href="/Forms/Customers/Customers.aspx?mode=addNew">Add New</a>
                                <a class="dropdown-item" href="/Forms/Customers/Customers.aspx?mode=edit">Edit</a>
                                <%if (User.Identity.Name == "admin")
                                    { %>
                                <a class="dropdown-item" href="/Forms/Customers/Customers.aspx?mode=delete">Remove</a>
                                <% } %>                                <% } %>
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
        <div>
                
            <table border="0" class="table table-striped table-bordered table-responsive-lg">
                <tr>
                    <td class="auto-style1">Search for Sales:</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Order #:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtOrderNum" runat="server"  CssClass="form-control input-lg" Width="200px" Height="25px" TabIndex="1"></asp:TextBox>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Customer:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtCustName" runat="server" CssClass="form-control input-lg" Width="200px" Height="25px" TabIndex="1"></asp:TextBox>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Employee:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtEmpName" runat="server" CssClass="form-control input-lg" Width="200px" Height="25px" TabIndex="1"></asp:TextBox>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Date Between:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtDateStart" runat="server" CssClass="form-control input-lg" Width="200px" Height="33px" TabIndex="1" TextMode="Date"></asp:TextBox>
                    </td>
                    <td class="auto-style3">AND</td>
                    <td>
                        <asp:TextBox ID="txtDateEnd" runat="server" CssClass="form-control input-lg" Width="200px" Height="33px" TabIndex="1" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-default" OnClick="btnSearch_Click" />
                    </td>
                    <td class="auto-style2">
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" class="btn btn-default" />
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <br />

        <div class="row">
            <div class="col-lg-8 text-center m-auto">

        <asp:GridView ID="gvSales" runat="server" AutoGenerateColumns="False" CellPadding="3" DataSourceID="dsSearchSales" ForeColor="Black" GridLines="Vertical" CssClass="table table-striped table-bordered table-responsive-lg" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="gvSales_SelectedIndexChanged">
          
            <AlternatingRowStyle BackColor="#CCCCCC" />
          
            <Columns>
                <asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" />
                <asp:BoundField DataField="ordDate" DataFormatString="{0:d}" HeaderText="Date" SortExpression="ordDate" />
                <asp:CheckBoxField DataField="ordPaid" HeaderText="Paid?" SortExpression="ordPaid" />
                <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                <asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
                <asp:BoundField DataField="orlPrice" DataFormatString="{0:C}" HeaderText="Price" SortExpression="orlPrice" />
                <asp:BoundField DataField="orlQuantity" HeaderText="Quantity" SortExpression="orlQuantity" />
                <asp:BoundField DataField="custFull" HeaderText="Customer" ReadOnly="True" SortExpression="custFull" />
                <asp:BoundField DataField="empFull" HeaderText="Employee" SortExpression="empFull" ReadOnly="True" />
                <asp:HyperLinkField DataNavigateUrlFields="receiptID" DataNavigateUrlFormatString="/Forms/Sales/salesUpdate.aspx?receiptID={0}" Text="Edit" />
             </Columns>
                </asp:GridView>
                                </div>
                </div>
                        </div>
            
        </asp:GridView>



        <br />
        <asp:ObjectDataSource ID="dsSearchSales" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.searchSalesTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtDateStart" DefaultValue="01/01/0001" Name="dateStart" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtDateEnd" DefaultValue="01/01/3000" Name="dateEnd" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtCustName" ConvertEmptyStringToNull="False" Name="custName" PropertyName="Text" Type="String" DefaultValue="" />
                <asp:ControlParameter ControlID="txtEmpName" ConvertEmptyStringToNull="False" Name="empName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtOrderNum" DefaultValue="" Name="orderNum" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
