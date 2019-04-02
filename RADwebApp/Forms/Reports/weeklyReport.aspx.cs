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
    public partial class weeklyReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // total amount sale
            DataView totalSaleAmount = (DataView)dsTotalSaleAmount.Select();
            decimal saleAmount;
            Decimal.TryParse(totalSaleAmount[0][0].ToString(), out saleAmount);
            if (saleAmount > 0)
                this.txtTotalSaleAmount.Text = saleAmount.ToString("C2");
            else
                this.panelSale.Visible = false;

            gvWeeklySaleReport.DataBind();
            if(gvWeeklySaleReport.Rows.Count == 0)
            {
                lblSaleReports.Text = "No Sales Records in the past 7 days.";
            }

            // total amount repair
            DataView totalRepairAmount = (DataView)dsTotalRepairAmount.Select();
            decimal repairAmount;
            Decimal.TryParse(totalRepairAmount[0][0].ToString(), out repairAmount);
            if (repairAmount > 0)
                this.txtTotalRepairAmount.Text = repairAmount.ToString("C2");
            else
                this.panelRepair.Visible = false;

            GridView2.DataBind();
            if(GridView2.Rows.Count == 0)
            {
                lblRepairReports.Text = "No Sales Records in the past 7 days.";
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }

    }
}