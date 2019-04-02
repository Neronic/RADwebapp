/* Emma's Kyosk - Mac & Donald Corporation
 * Welcome Page
 * Done by: Fabio Ribas
 * Designed by: Filip Lyesovyy
 * Last modified: 2018-12-12
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using aLibrary;

namespace RADwebApp
{
    public partial class Welcome : System.Web.UI.Page
    {
        public string type; //for querystring

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
                pnlContent.Visible = true;
            else
                Response.Redirect("~/Login.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }

    }
}