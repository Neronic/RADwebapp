/*Coded by Jacob Fields*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADwebApp.Forms.RepairPages
{
    public partial class AllRepairs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            gvAllRepairs.EnableDynamicData(typeof(AllRepairs));
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.gvAllRepairs.DataSourceID = "dsAllRepairsSearch";
        }

        protected void txtClear_Click(object sender, EventArgs e)
        {
            this.gvAllRepairs.DataSourceID = "dsAllRepairs";
            txtSearch.Text = "";
        }
    }
}