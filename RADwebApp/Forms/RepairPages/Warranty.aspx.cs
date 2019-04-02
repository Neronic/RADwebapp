//coded by jacob fields

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using aLibrary.EmmasDataSetTableAdapters;

namespace RADwebApp.Forms.RepairPages
{
    public partial class Warranty : System.Web.UI.Page
    {

        WarrantyTableAdapter warrantyTableAdapter = new WarrantyTableAdapter();


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }

        protected void btnNewWarranty_Click(object sender, EventArgs e)
        {
            dvNewWarranty.Visible = true;
            gvWarranty.Visible = false;
            btnSubmit.Visible = true;


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            dvNewWarranty.Visible = false;
            gvWarranty.Visible = true;
            btnSubmit.Visible = false;



        }


    }
}