<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesRepairReport.aspx.cs" Inherits="RADwebApp.Forms.Sales.SalesReport" %>

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

        <%--END OF NAV BAR--%>

        <div class="container">
            <h2 class="mt-3">Reports</h2>
            <asp:Panel ID="panelFilters" runat="server">


                <div class="row">
                    <div class="col-lg-4">
                                        <p class="mt-2">Filter by:</p>

                        <asp:DropDownList CssClass="form-control mt-2" ID="ddlYears" runat="server">
                            <asp:ListItem Selected="True" Value="0">All Years</asp:ListItem>
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList CssClass="form-control mt-2" ID="ddlMonths" runat="server">
                            <asp:ListItem Selected="True" Value="0">All Months</asp:ListItem>
                            <asp:ListItem Value="1">January</asp:ListItem>
                            <asp:ListItem Value="2">February</asp:ListItem>
                            <asp:ListItem Value="3">March</asp:ListItem>
                            <asp:ListItem Value="4">April</asp:ListItem>
                            <asp:ListItem Value="5">May</asp:ListItem>
                            <asp:ListItem Value="6">June</asp:ListItem>
                            <asp:ListItem Value="7">July</asp:ListItem>
                            <asp:ListItem Value="8">August</asp:ListItem>
                            <asp:ListItem Value="9">September</asp:ListItem>
                            <asp:ListItem Value="10">October</asp:ListItem>
                            <asp:ListItem Value="11">November</asp:ListItem>
                            <asp:ListItem Value="12">December</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList CssClass="form-control mt-2" ID="ddlPayment" runat="server" AppendDataBoundItems="True" DataSourceID="dsPayment" DataTextField="payType" DataValueField="id">
                            <asp:ListItem Selected="True" Value="0">All Types</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button CssClass="btn mt-2" ID="btnSearch" runat="server" Text="Search" />
                    </div>

                    <div class="col-lg-4"></div>
                                    <div class="col-lg-4 ">

                    <asp:Panel CssClass="mb-4 rounded" ID="panel1" runat="server" BorderStyle="Groove">
                        <div class=" m-2">
                            <h3 class="mb-2">Total</h3>
                            <asp:Label ID="Label10" runat="server" Text="Total of services in the period:"></asp:Label>
                            <asp:TextBox CssClass="form-control mb-2" ID="txtTotalNum" runat="server" ReadOnly="True"></asp:TextBox>
                            <asp:Label ID="Label11" runat="server" Text="Total Amount in the period:"></asp:Label>
                            <asp:TextBox CssClass="form-control mb-2" ID="txtTotalAmount" runat="server" ReadOnly="True"></asp:TextBox>
                            <asp:Label ID="Label12" runat="server" Text="Emma's 0.02%:"></asp:Label>
                            <asp:TextBox CssClass="form-control mb-2" ID="txtEmma" runat="server" ReadOnly="True"></asp:TextBox>
                            <br />
                        </div>
                    </asp:Panel>
                </div>

                </div>



            </asp:Panel>
            <asp:Panel ID="panelSales" runat="server">
                <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                <a class="btn btn-outline-info mb-3" data-toggle="collapse" data-parent="#accordion" href="#collapse1" role="button" aria-expanded="false" aria-controls="collapseExample"> Sales Report
                </a>
                    </div>
                <div id="collapse1" class="collapse">
                    <asp:GridView CssClass="table table-striped table-bordered table-responsive-lg" ID="gvSalesReport" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsSalesReport">
                        <Columns>
                            <asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" />
                            <asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="ordDate" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="payType" HeaderText="Payment" SortExpression="payType" />
                            <asp:BoundField DataField="orlTotal" HeaderText="Total" ReadOnly="True" SortExpression="orlTotal" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="empFull" HeaderText="Employee" ReadOnly="True" SortExpression="empFull" />
                            <asp:BoundField DataField="custFull" HeaderText="Customer" ReadOnly="True" SortExpression="custFull" />
                        </Columns>
                        <EmptyDataTemplate>
                            No service has matched your criteria.
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <br />
                    <asp:Panel ID="panelSalesTotal" runat="server">
                        <div class="row">
                            <div class="col-lg-4">
                                <asp:Label ID="Label1" runat="server" Text="Total Orders:"></asp:Label>
                                <asp:TextBox CssClass="form-control mb-2" ID="txtSalesTotalNum" runat="server" ReadOnly="True"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" Text="Total Sales Amount:"></asp:Label>
                                <asp:TextBox CssClass="form-control" ID="txtSalesTotalAmount" runat="server" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                </div>
                    </div>
                </asp:Panel>
            </asp:Panel>



            <asp:Panel ID="panelRepairs" runat="server">
                <a class="btn btn-outline-info mb-3 mt-3" data-toggle="collapse" href="#collapse2" role="button" aria-expanded="false" aria-controls="collapseExample">Repairs Report
                </a>
                <div id="collapse2" class="collapse">
                <asp:GridView CssClass="table table-striped table-bordered table-responsive-lg" ID="gvRepairsReport" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsRepairsReport">
                    <Columns>
                        <asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" />
                        <asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="ordDate" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="payType" HeaderText="Payment" SortExpression="payType" />
                        <asp:BoundField DataField="serPrice" HeaderText="Total" SortExpression="serPrice" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="empFull" HeaderText="Employee" SortExpression="empFull" ReadOnly="True" />
                        <asp:BoundField DataField="custFull" HeaderText="Customer" SortExpression="custFull" ReadOnly="True" />
                    </Columns>
                    <EmptyDataTemplate>
                        No service has matched your criteria.
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:Panel ID="panelRepairsTotal" runat="server">
                    <div class="row">
                        <div class="col-lg-4">
                            <asp:Label ID="Label3" runat="server" Text="Total Repairs:"></asp:Label>
                            <asp:TextBox CssClass="form-control mb-2" ID="txtRepairsTotalNum" runat="server" ReadOnly="True"></asp:TextBox>
                            <asp:Label ID="Label4" runat="server" Text="Total Amount:"></asp:Label>
                            <asp:TextBox CssClass="form-control" ID="txtRepairsTotalAmount" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>
                    </div>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="panelOrders" runat="server">



                <a class="btn btn-outline-info mb-3 mt-3" data-toggle="collapse" href="#collapse3" role="button" aria-expanded="false" aria-controls="collapseExample">Orders Report
                </a>
                <div id="collapse3" class="collapse">
                <asp:GridView CssClass="table table-striped table-bordered table-responsive-lg" ID="gvOrders" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsOrders">
                    <Columns>
                        <asp:BoundField DataField="onordInvoiceNum" HeaderText="Invoice #" SortExpression="onordInvoiceNum" />
                        <asp:BoundField DataField="onordArriveDate" HeaderText="Arriving Date" SortExpression="onordArriveDate" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" ReadOnly="True" />
                        <asp:BoundField DataField="onordNumInOrder" HeaderText="Quantity ordered" SortExpression="onordNumInOrder" />
                    </Columns>
                    <EmptyDataTemplate>
                        No order has matched your criteria.
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:Panel ID="panelOrdersTotal" runat="server">
                    <div class="row">
                        <div class="col-lg-4">
                            <asp:Label ID="Label8" runat="server" Text="Total of Items Ordered:"></asp:Label>
                            <asp:TextBox CssClass="form-control mb-2" ID="txtItemsTotal" runat="server" ReadOnly="True"></asp:TextBox>
                            <asp:Label ID="Label9" runat="server" Visible="false" Text="Total Sales Amount:"></asp:Label>
                            <asp:TextBox CssClass="form-control" ID="txtTotalSpent" Visible="false" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>
                    </div>
                </asp:Panel>



            </asp:Panel>
            <br />
            <br />

        </div>



        <asp:ObjectDataSource ID="dsSalesReport" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.salesReportTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYears" DefaultValue="0" Name="year" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlMonths" DefaultValue="0" Name="month" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlPayment" DefaultValue="0" Name="payID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsSalesTotalNum" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.salesTotalNumTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYears" DefaultValue="0" Name="year" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlMonths" DefaultValue="0" Name="month" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlPayment" DefaultValue="0" Name="payID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsSalesTotalAmount" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.salesTotalAmountTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYears" DefaultValue="0" Name="year" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlMonths" DefaultValue="0" Name="month" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlPayment" DefaultValue="0" Name="payID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsRepairsReport" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.repReportTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYears" DefaultValue="0" Name="year" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlMonths" DefaultValue="0" Name="month" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlPayment" DefaultValue="0" Name="payID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsRepairsTotalAmount" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.repTotalTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYears" DefaultValue="0" Name="year" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlMonths" DefaultValue="0" Name="month" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlPayment" DefaultValue="0" Name="payID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsRepairsTotalNum" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.repTotalNumTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYears" DefaultValue="0" Name="year" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlMonths" DefaultValue="0" Name="month" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlPayment" DefaultValue="0" Name="payID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsOrders" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.orderingTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYears" DefaultValue="0" Name="year" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlMonths" DefaultValue="0" Name="month" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsOrdersNum" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.orderingTotalTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYears" DefaultValue="0" Name="year" PropertyName="SelectedValue" Type="Decimal" />
                <asp:ControlParameter ControlID="ddlMonths" DefaultValue="0" Name="month" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsPayment" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.paymentTableAdapter"></asp:ObjectDataSource>
    </form>
</body>
</html>
