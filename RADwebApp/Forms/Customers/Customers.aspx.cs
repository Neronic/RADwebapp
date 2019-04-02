/* Emma's Kyosk - Mac & Donald Corporation
 * Customers Main Page
 * Done by: Fabio Ribas
 * Designed by: Braeden Kacho
 * Last modified: 2018-12-13
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADwebApp.Forms.CustomerPages
{
    public partial class Customers : System.Web.UI.Page
    {
        public bool flagNew = false; //true: Add New / False: Normal
        public bool flagEdit = false; //true: Edit-Delete / False: Normal

        protected void Page_Init(object sender, EventArgs e)
        {
            dvCustomerNew.EnableDynamicData(typeof(Customer));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //this.ddlCity.SelectedValue = "Welland";
            if ((Request.QueryString["mode"] == "edit") || (Request.QueryString["mode"] == "delete"))
            {
                this.btnNewCustomer.Visible = false;
                this.gvCustomers.Visible = false;
                flagEdit = true;
            }                                                           
            else if (Request.QueryString["mode"] == "addNew")
            {
                this.gvCustomers.Visible = false;
                this.dvCustomerNew.Visible = true;
                this.btnNewCustomer.Visible = false;
                this.panelFilters.Visible = false;
                flagNew = true;
            }
        }

        protected void btnNewCustomer_Click(object sender, EventArgs e)
        {
            this.gvCustomers.Visible = false;
            this.dvCustomerNew.Visible = true;
            this.btnNewCustomer.Visible = false;
            this.panelFilters.Visible = false;
            flagNew = true;
        }

        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = gvCustomers.SelectedRow.RowIndex;
            string id = gvCustomers.DataKeys[index][0].ToString();
            string edit = "edit";
            Response.Redirect("~/Forms/Customers/CustomerDetails.aspx?mode=" + edit + "&id=" + id);
        }

        protected void lnkNewOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/Sales/SalesNew.aspx");
        }

        protected void dvCustomerNew_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            this.gvCustomers.Visible = true;
            this.dvCustomerNew.Visible = false;
            this.btnNewCustomer.Visible = true;
            this.panelFilters.Visible = true;
            this.Clear();
            flagNew = false;
            flagEdit = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.gvCustomers.Visible = true;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            this.Clear();
        }

        private void Clear()
        {
            this.txtFirst.Text = "";
            this.txtLast.Text = "";
            this.txtEmail.Text = "";
            this.ddlCity.SelectedIndex = 0;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }

        protected void dvCustomerNew_ItemInserted(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Customer successfully created.');</script>");
        }
    }
}