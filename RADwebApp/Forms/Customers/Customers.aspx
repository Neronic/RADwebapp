<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="RADwebApp.Forms.CustomerPages.Customers" %>

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
                                <a class="dropdown-item" href="Forms/Customers/Customers.aspx">Search</a>
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
         <%--nav ends--%>


        <% if(flagNew == false) { %>
               <div class="container mt-4">
            <div class="row">
                <div class="col-lg-4 text-center m-auto">
                    <h2>Customers</h2>
                </div>
            </div>
        </div>
        <% } else { %>
               <h2>Add New Customer</h2>
        <% } %>
        <div class="container mt-3">
            <div class="row">
                <div class="text-center m-auto">
            <asp:Button ID="btnNewCustomer" runat="server" OnClick="btnNewCustomer_Click" Text="Add New" CssClass="btn btn-outline-info mb-3"/>
            <br />
            <asp:DetailsView ID="dvCustomerNew" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="dsCustomer" DefaultMode="Insert" Height="50px" OnItemCommand="dvCustomerNew_ItemCommand" Visible="False" Width="718px" OnItemInserted="dvCustomerNew_ItemInserted">
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:DynamicField DataField="custFirst" HeaderText="First Name" SortExpression="custFirst" />
                    <asp:DynamicField DataField="custLast" HeaderText="Last Name" SortExpression="custLast" />
                    <asp:DynamicField DataField="custPhone" HeaderText="Phone" SortExpression="custPhone" />
                    <asp:DynamicField DataField="custAddress" HeaderText="Address" SortExpression="custAddress" />
                    <asp:DynamicField DataField="custCity" HeaderText="City" SortExpression="custCity" />
                    <asp:DynamicField DataField="custPostal" HeaderText="Postal Code" SortExpression="custPostal" />
                    <asp:DynamicField DataField="custEmail" HeaderText="E-mail" SortExpression="custEmail" />
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <asp:Button ID="btnIsert" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-outline-info mb-3" />
                            &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-info mb-3" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnNew" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please fix the following:" />


            <asp:Panel ID="panelFilters" runat="server">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 text-center m-auto">
                <h3><span class="">Search For a Customer</span></h3>
                <asp:Label ID="lblFirst" runat="server" Text="First Name:"></asp:Label>
                <asp:TextBox ID="txtFirst" runat="server" CssClass="form-control input-lg" ></asp:TextBox>
                <asp:Label ID="lblLast" runat="server" Text="Last Name:"></asp:Label>
                
                <asp:TextBox ID="txtLast" runat="server" CssClass="form-control input-lg" ></asp:TextBox>
                <asp:Label ID="lblEmail" runat="server" Text="E-mail:"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control input-lg" ></asp:TextBox>
                <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
                <asp:DropDownList ID="ddlCity" CssClass="form-control" runat="server" AppendDataBoundItems="True" DataSourceID="dsCity" DataTextField="custCity" DataValueField="custCity" EnableViewState="False">
                    <asp:ListItem Selected="True" Value="All">All</asp:ListItem>
                    
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="btn btn-outline-info mb-3" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click"  CssClass="btn btn-outline-info mb-3"/>
              </div>
                </div>
                  </div>
            </asp:Panel> 
            

            <br />
            <asp:GridView ID="gvCustomers" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dsSearchCustomer" OnSelectedIndexChanged="gvCustomers_SelectedIndexChanged" EnableViewState="False" CssClass="table table-striped table-bordered table-responsive-lg">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="CustomerDetails.aspx?id={0}" Text="Details" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>                           
                            <% if(flagEdit == true) { %>
                                   <asp:Button ID="btnEdit" runat="server" CausesValidation="False" CommandName="Select" Text="Edit" />
                                   <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick='return confirm("Are you sure you want to delete this customer?");' />
                            <% } %>                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="custName" HeaderText="Name" ReadOnly="True" SortExpression="custName" />
                    <asp:BoundField DataField="custEmail" HeaderText="E-mail" SortExpression="custEmail" />
                    <asp:BoundField DataField="custCity" HeaderText="City" ReadOnly="True" SortExpression="custCity" />                    
                    <asp:HyperLinkField DataNavigateUrlFields="id"
                    DataNavigateUrlFormatString="/Forms/Sales/SalesNew.aspx?id={0}"
                      Text="New Order" />
                    <asp:HyperLinkField DataNavigateUrlFields="id, custFirst, custLast"
                    DataNavigateUrlFormatString="CustomerOrders.aspx?id={0}&first={1}&last={2}"
                      Text="View Orders" />
                </Columns>
                <EmptyDataTemplate>
                    No customer has matched your searching criteria.
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
        <asp:ObjectDataSource ID="dsSearchCustomer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.searchCustomerTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="custFirst" Type="String" />
                <asp:Parameter Name="custLast" Type="String" />
                <asp:Parameter Name="custPhone" Type="String" />
                <asp:Parameter Name="custAddress" Type="String" />
                <asp:Parameter Name="custCity" Type="String" />
                <asp:Parameter Name="custPostal" Type="String" />
                <asp:Parameter Name="custEmail" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCity" DefaultValue="All" Name="custCity" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtFirst" ConvertEmptyStringToNull="False" DefaultValue="" Name="custFirst" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtLast" ConvertEmptyStringToNull="False" Name="custLast" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtEmail" ConvertEmptyStringToNull="False" Name="custEmail" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="custFirst" Type="String" />
                <asp:Parameter Name="custLast" Type="String" />
                <asp:Parameter Name="custPhone" Type="String" />
                <asp:Parameter Name="custAddress" Type="String" />
                <asp:Parameter Name="custCity" Type="String" />
                <asp:Parameter Name="custPostal" Type="String" />
                <asp:Parameter Name="custEmail" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsCity" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.customerCityTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsCustomer" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="aLibrary.EmmasDataSetTableAdapters.customerTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_custFirst" Type="String" />
                <asp:Parameter Name="Original_custLast" Type="String" />
                <asp:Parameter Name="Original_custPhone" Type="String" />
                <asp:Parameter Name="Original_custAddress" Type="String" />
                <asp:Parameter Name="Original_custCity" Type="String" />
                <asp:Parameter Name="Original_custPostal" Type="String" />
                <asp:Parameter Name="Original_custEmail" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="custFirst" Type="String" />
                <asp:Parameter Name="custLast" Type="String" />
                <asp:Parameter Name="custPhone" Type="String" />
                <asp:Parameter Name="custAddress" Type="String" />
                <asp:Parameter Name="custCity" Type="String" />
                <asp:Parameter Name="custPostal" Type="String" />
                <asp:Parameter Name="custEmail" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="custFirst" Type="String" />
                <asp:Parameter Name="custLast" Type="String" />
                <asp:Parameter Name="custPhone" Type="String" />
                <asp:Parameter Name="custAddress" Type="String" />
                <asp:Parameter Name="custCity" Type="String" />
                <asp:Parameter Name="custPostal" Type="String" />
                <asp:Parameter Name="custEmail" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_custFirst" Type="String" />
                <asp:Parameter Name="Original_custLast" Type="String" />
                <asp:Parameter Name="Original_custPhone" Type="String" />
                <asp:Parameter Name="Original_custAddress" Type="String" />
                <asp:Parameter Name="Original_custCity" Type="String" />
                <asp:Parameter Name="Original_custPostal" Type="String" />
                <asp:Parameter Name="Original_custEmail" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>