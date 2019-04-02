/* Emma's Kyosk - Mac & Donald Corporation
 * General Report Page
 * Done by: Fabio Ribas
 * Designed by: Filip Lyesovyy
 * Last modified: 2018-12-12
 * */

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADwebApp.Forms.Sales
{
    public partial class SalesReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView salesTotalNum = (DataView)dsSalesTotalNum.Select();
            DataView repairsTotalNum = (DataView)dsRepairsTotalNum.Select();
            DataView ordersTotalNum = (DataView)dsOrdersNum.Select();

            this.txtSalesTotalNum.Text = salesTotalNum[0][0].ToString();
            this.txtRepairsTotalNum.Text = repairsTotalNum[0][0].ToString();
            this.txtItemsTotal.Text = ordersTotalNum[0][0].ToString();

            DataView salesTotalAmount = (DataView)dsSalesTotalAmount.Select();
            DataView repairsTotalAmount = (DataView)dsRepairsTotalAmount.Select();

            int totalSalesNum, totalRepairsNum;

            int.TryParse(salesTotalNum[0][0].ToString(), out totalSalesNum);
            int.TryParse(repairsTotalNum[0][0].ToString(), out totalRepairsNum);

            decimal totalSalesAmt, totalRepairsAmt, totalEmma;

            Decimal.TryParse(salesTotalAmount[0][0].ToString(), out totalSalesAmt);
            Decimal.TryParse(repairsTotalAmount[0][0].ToString(), out totalRepairsAmt);

            this.txtSalesTotalAmount.Text = totalSalesAmt.ToString("C2");
            this.txtRepairsTotalAmount.Text = totalRepairsAmt.ToString("C2");

            int totalNum = totalSalesNum + totalRepairsNum;

            decimal totalAmount = totalSalesAmt + totalRepairsAmt;

            this.txtTotalNum.Text = totalNum.ToString();
            this.txtTotalAmount.Text = totalAmount.ToString("C2");

            totalEmma = totalAmount * 0.02m;

            this.txtEmma.Text = totalEmma.ToString("C2");

            //decimal amount;
            //Decimal.TryParse(totalAmount[0][0].ToString(), out amount);
            //if (amount > 0)
            //    this.txtTotalAmount.Text = amount.ToString("C2");            
            //else
            //    this.panelTotal.Visible = false;
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }

    }
}