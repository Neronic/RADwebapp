<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="RADwebApp.Forms.Employees.Employees" %>

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
        <% if (flagNew == false)
            { %>
        <div class="container mt-4">
            <div class="row">
                <div class="col-lg-4">
                    <h2>Employees</h2>
                </div>
            </div>
        </div>
        <% }
        else
        { %>
        <div class="container mt-3">
            <h2>Add New Employee</h2>
        </div>
        <% } %>
        <div>
            <div class="container mt-3">
                <div class="row">
                    <div class="col-lg-4">
                        <asp:Button CssClass="btn" ID="btnNewEmployee" runat="server" OnClick="btnNewEmployee_Click" Text="Add New" />
                        <br />
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="col-lg-5 text-center">
                    <asp:DetailsView CssClass="table table-striped table-bordered table-responsive-lg" ID="dvEmployeeNew" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="dsEmployee" DefaultMode="Insert" OnItemCommand="dvEmployeeNew_ItemCommand" Visible="False">
                        <Fields>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:DynamicField DataField="empFirst" HeaderText="First Name" />
                            <asp:DynamicField DataField="empLast" HeaderText="Last Name" />
                            <asp:TemplateField HeaderText="Position" SortExpression="posID">
                                <EditItemTemplate>
                                    <asp:TextBox CssClass="form-control rounded" ID="TextBox1" runat="server" Text='<%# Bind("posID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlPositionAdd" runat="server" DataSourceID="dsPosition" DataTextField="posName" DataValueField="id" SelectedValue='<%# Bind("posID") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("posID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <InsertItemTemplate>
                                    <asp:Button CssClass="btn btn-success" ID="btnIsert" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                    &nbsp;<asp:Button CssClass="btn btn-warning" ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="btnNew" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </div>
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please fix the following:" />
            <br />

            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <asp:Panel ID="panelFilters" runat="server">
                            <br />
                            <h3><span class="">Search For an Existing</span></h3>
                            <asp:Label CssClass="" ID="lblFirst" runat="server" Text="First Name:"></asp:Label>
                            <asp:TextBox CssClass="form-control" ID="txtFirst" runat="server"></asp:TextBox><br />
                            <asp:Label CssClass="" ID="lblLast" runat="server" Text="Last Name:"></asp:Label>
                            <asp:TextBox CssClass="form-control mb-3" ID="txtLast" runat="server"></asp:TextBox>
                            <asp:Label ID="lblPosition" runat="server" Text="Position:"></asp:Label>
                            <asp:DropDownList CssClass="form-control" ID="ddlPosition" runat="server" AppendDataBoundItems="True" DataSourceID="dsPosition" DataTextField="posName" DataValueField="id">
                                <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <div class="btn-group">
                                <asp:Button CssClass="btn " ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
                                <asp:Button CssClass="btn " ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />
                            </div>
                    </div>
                    </asp:Panel>
            <br />


                    <div class="col-lg-8">
                        <asp:GridView CssClass="table table-striped table-bordered table-responsive-lg" ID="gvEmployees" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dsSearchEmployee" OnSelectedIndexChanged="gvEmployees_SelectedIndexChanged" EnableViewState="False" OnRowCommand="gvEmployees_RowCommand" OnRowDeleted="gvEmployees_RowDeleted">
                            <Columns>
                                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="EmployeeDetails.aspx?id={0}" Text="Details" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <% if (flagEdit == true)
                                            { %>
                                        <asp:Button ID="btnEdit" runat="server" CausesValidation="False" CommandName="Select" Text="Edit" />
                                        <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick='return confirm("Are you sure you want to delete this employee?");' />
                                        <% } %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="empName" HeaderText="Name" ReadOnly="True" SortExpression="empName" />
                                <asp:BoundField DataField="posName" HeaderText="Position" SortExpression="posName" />
                                <asp:HyperLinkField DataNavigateUrlFields="id, empFirst, empLast, posID"
                                    DataNavigateUrlFormatString="EmployeeServices.aspx?id={0}&first={1}&last={2}&role={3}"
                                    Text="View Services" />
                            </Columns>
                            <EmptyDataTemplate>
                                No employee has matched your searching criteria.
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>

                </div>
            </div>
            <asp:ObjectDataSource ID="dsSearchEmployee" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.searchEmployeeTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlPosition" DefaultValue="0" Name="posID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="txtFirst" ConvertEmptyStringToNull="False" DefaultValue="" Name="empFirst" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtLast" ConvertEmptyStringToNull="False" Name="empLast" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsEmployee" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.employeeTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="empFirst" Type="String" />
                    <asp:Parameter Name="empLast" Type="String" />
                    <asp:Parameter Name="posID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="empFirst" Type="String" />
                    <asp:Parameter Name="empLast" Type="String" />
                    <asp:Parameter Name="posID" Type="Int32" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="dsPosition" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.employeePositionTableAdapter"></asp:ObjectDataSource>
            <br />
    </form>
</body>
</html>
