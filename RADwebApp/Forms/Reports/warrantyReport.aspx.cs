using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Luckas Couto Mello
// PROG1210
// Final Project
// 12/13/2018

namespace RADwebApp.Forms.Reports
{
    public partial class warrantyReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvWarrantyReport.DataBind();

            if (gvWarrantyReport.Rows.Count != 0)
            {
                lblMessage.Visible = false;
            }
            else
            {
                lblMessage.Text = "The Order/Customer you searched has no warranties.";
                lblMessage.Visible = true;
            }
        }
    }
}