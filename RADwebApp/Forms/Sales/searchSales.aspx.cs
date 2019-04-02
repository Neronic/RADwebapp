using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Luckas Couto Mello
// PROG1210
// Final Project
// 12/13/2018

namespace RADwebApp.Forms.Sales
{
    public partial class searchSales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCustName.Text = "";
            txtEmpName.Text = "";
            txtOrderNum.Text = "";
            txtDateEnd.Text = "";
            txtDateStart.Text = "";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }

        protected void gvSales_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}