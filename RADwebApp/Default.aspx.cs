/* Emma's Kyosk - Mac & Donald Corporation
 * Welcome Page
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

namespace MovieWeb
{
    public partial class Landing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}