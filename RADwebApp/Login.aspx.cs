/* Emma's Kyosk - Mac & Donald Corporation
 * Login Page
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
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace RADwebApp
{
    public partial class LOG : System.Web.UI.Page
    {


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);
            IdentityUser user = manager.Find(txtUser.Text, txtPass.Text);
            if (user == null)
            {
                lblMessage.Text = "Username or password is incorrect.";
            }
            else
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                authenticationManager.SignIn(userIdentity);
                Response.Redirect("~/Welcome.aspx?User=" + txtUser.Text);
            }

        }

        protected void txtPass_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtUser_TextChanged(object sender, EventArgs e)
        {

        }
    }
}