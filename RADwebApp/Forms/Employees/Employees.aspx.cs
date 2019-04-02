/* Emma's Kyosk - Mac & Donald Corporation
 * Employees Main Page
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
    public partial class Employees : System.Web.UI.Page
    {
        public bool flagNew = false; //true: Add New / False: Normal
        public bool flagEdit = false; //true: Edit-Delete / False: Normal

        protected void Page_Init(object sender, EventArgs e)
        {
            dvEmployeeNew.EnableDynamicData(typeof(Employee));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Request.QueryString["mode"] == "edit") || (Request.QueryString["mode"] == "delete"))
            {
                this.btnNewEmployee.Visible = false;
                this.gvEmployees.Visible = false;
                flagEdit = true;
            }                
            else if (Request.QueryString["mode"] == "addNew")
            {
                this.gvEmployees.Visible = false;
                this.dvEmployeeNew.Visible = true;
                this.btnNewEmployee.Visible = false;
                this.panelFilters.Visible = false;
                flagNew = true;
            }            
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }


        protected void btnNewEmployee_Click(object sender, EventArgs e)
        {
            this.gvEmployees.Visible = false;
            this.dvEmployeeNew.Visible = true;
            this.btnNewEmployee.Visible = false;
            this.panelFilters.Visible = false;
            flagNew = true;
        }

        protected void gvEmployees_SelectedIndexChanged(object sender, EventArgs e) //button Edit click
        {
            int index = gvEmployees.SelectedRow.RowIndex;
            string id = gvEmployees.DataKeys[index][0].ToString();
            string edit = "edit";
            Response.Redirect("~/Forms/Employees/EmployeeDetails.aspx?mode=" + edit + "&id=" + id);
        }

        protected void dvEmployeeNew_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            this.gvEmployees.Visible = true;
            this.dvEmployeeNew.Visible = false;
            this.btnNewEmployee.Visible = true;
            this.panelFilters.Visible = true;
            this.Clear();
            flagNew = false;
            flagEdit = false;            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.gvEmployees.Visible = true;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            this.Clear();
        }

        protected void gvEmployees_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
                this.gvEmployees.DataSourceID = "dsEmployee";
        }

        protected void gvEmployees_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            this.gvEmployees.DataSourceID = "dsSearchEmployee";
        }

        private void Clear()
        {
            this.txtFirst.Text = "";
            this.txtLast.Text = "";
            this.ddlPosition.SelectedIndex = 0;
        }
    }
}