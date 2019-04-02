/* Emma's Kyosk - Mac & Donald Corporation
 * CustomerDetails Page
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

namespace RADwebApp.Forms.Customers
{
    public partial class CustomerDetails : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            dvEditCustomer.EnableDynamicData(typeof(Customer));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            int id = Convert.ToInt32(Request.QueryString["id"]);
            if (Request.QueryString["mode"] == "edit")
            {
                this.dvEditCustomer.DefaultMode = DetailsViewMode.Edit;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/Customers/Customers.aspx");
        }

        protected void dvEditCustomer_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            Response.Redirect("~/Forms/Customers/Customers.aspx");
        }

        protected void dvEditCustomer_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            dvEditCustomer.DefaultMode = DetailsViewMode.ReadOnly;
        }

        protected void dvEditCustomer_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
                dvEditCustomer.DefaultMode = DetailsViewMode.ReadOnly;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}