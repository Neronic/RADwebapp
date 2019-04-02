/* Emma's Kyosk - Mac & Donald Corporation
 * EmployeeDetails Page
 * Done by: Fabio Ribas
 * Designed by: Filip Lyesovyy
 * Last modified: 2018-12-12
 * */

using RADwebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADwebApp.Forms.Employees
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            dvEditEmployee.EnableDynamicData(typeof(Employee));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            int id = Convert.ToInt32(Request.QueryString["id"]);
            if (Request.QueryString["mode"] == "edit")
            {
                this.dvEditEmployee.DefaultMode = DetailsViewMode.Edit;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/Employees/Employees.aspx");
        }

        protected void dvEditEmployee_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            Response.Redirect("~/Forms/Employees/Employees.aspx");
        }

        protected void dvEditEmployee_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            dvEditEmployee.DefaultMode = DetailsViewMode.ReadOnly;
        }

        protected void dvEditEmployee_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
                dvEditEmployee.DefaultMode = DetailsViewMode.ReadOnly;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}