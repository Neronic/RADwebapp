using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using aLibrary;
using aLibrary.EmmasDataSetTableAdapters;

// Luckas Couto Mello
// PROG1210
// Final Project
// 12/13/2018

namespace RADwebApp.Forms.Sales
{
    public partial class SalesNew : System.Web.UI.Page
    {
        private static EmmasDataSet dsAddSale;

        private static DataRow[] rows;

        public int orderNum;
        public int lastID;
        public DateTime date;
        public int payTypeID;
        public int custID;
        public int empID;
        public int prodID;
        public Boolean orderReq;
        ListItem item = new ListItem();

        static SalesNew()
        {
            dsAddSale = new EmmasDataSet();
            receiptTableAdapter daReceipt = new receiptTableAdapter();
            orderLineTableAdapter daOrderLine = new orderLineTableAdapter();
            salesInvenTableAdapter daInventory = new salesInvenTableAdapter();
            try
            {
                daReceipt.Fill(dsAddSale.receipt);
                daOrderLine.Fill(dsAddSale.orderLine);
                daInventory.Fill(dsAddSale.salesInven);
            }
            catch { }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            date = DateTime.Now; // Get Date Now.
            DataView nextOrder = (DataView)dsNextOrder.Select();
            orderNum = Convert.ToInt32(nextOrder[0][0]); //Get new Order #
            string passedID = (Request.QueryString["id"]);

            txtOrderNumber.Text = Convert.ToString(orderNum);
            txtOrderDate.Text = date.ToString("MM/dd/yyyy");

            if(passedID != null)
            {
                ddlCustomer.SelectedIndex = Convert.ToInt32(passedID);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }


        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            payTypeID = Convert.ToInt32(this.ddlPaymentType.SelectedValue);
            custID = Convert.ToInt32(this.ddlCustomer.SelectedValue);
            empID = Convert.ToInt32(this.ddlEmployee.SelectedValue);
            prodID = Convert.ToInt32(this.ddlProduct.SelectedValue);
            orderReq = Convert.ToBoolean(this.rblOrderReq.SelectedValue);


            try
            {
                // Receipt Table
                DataRow r = dsAddSale.receipt.NewRow();
                r[1] = this.txtOrderNumber.Text;
                r[2] = this.txtOrderDate.Text;
                r[4] = payTypeID;
                r[5] = custID;
                r[6] = empID;
                dsAddSale.receipt.Rows.Add(r);
                Save();

                DataView lastReceiptID = (DataView)dsLastReceiptID.Select();
                lastID = Convert.ToInt32(lastReceiptID[0][0]); //Get last ID added from receipt

                for (int i = 0; i <= lbCart.Items.Count - 1; i++)
                {
                    int value = Convert.ToInt32(lbCart.Items[i].Value);
                    DataRow a = dsAddSale.salesInven.FindByid(Convert.ToInt32(value));
                    // Order Line Table
                    DataRow o = dsAddSale.orderLine.NewRow();
                    o[1] = a[7];
                    o[2] = this.txtQuantity.Text;
                    o[3] = orderReq;
                    o[4] = this.txtOrderNote.Text;
                    o[5] = a[0];
                    o[6] = lastID;
                    dsAddSale.orderLine.Rows.Add(o);
                    Save();
                }

                Clear();
            }
            catch
            {
                this.lblSave.Text = "Unable to add sale - Invalid Input";
            }
        }

        private void Clear()
        {
            DataView nextOrder = (DataView)dsNextOrder.Select();
            orderNum = Convert.ToInt32(nextOrder[0][0]);

            this.txtOrderNumber.Text = Convert.ToString(orderNum);
            this.txtOrderDate.Text = date.ToString("MM/dd/yyyy");
            this.txtQuantity.Text = Convert.ToString(1);
            this.txtOrderNote.Text = "";
            this.ddlCustomer.SelectedIndex = -1;
            this.ddlEmployee.SelectedIndex = -1;
            this.ddlPaymentType.SelectedIndex = -1;
            this.ddlProduct.SelectedIndex = -1;
            this.lbCart.Items.Clear();
        }

        private void Save()
        {
            receiptTableAdapter daReceipt = new receiptTableAdapter();
            orderLineTableAdapter daOrderLine = new orderLineTableAdapter();
            try
            {
                daReceipt.Update(dsAddSale.receipt);
                daOrderLine.Update(dsAddSale.orderLine);
                dsAddSale.AcceptChanges();
                this.lblSave.Text = "Sale has been added successfully.";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Sale has been added successfully." + "');", true);
            }
            catch
            {
                dsAddSale.RejectChanges();
                this.lblSave.Text = "Unable to add sale - All changes have been rejected.";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Unable to add sale - All changes have been rejected." + "');", true);
            }
        }

        public void ScrollPageToTop()
        {
            string strScroll = null;
            strScroll = "<script language='javascript'>" + Environment.NewLine + "window.scrollTo(0,0);</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "ScrollToTop", strScroll.ToString());
        }

        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            int id = this.ddlProduct.SelectedIndex;
            string criteria = "id = " + id;

            rows = dsAddSale.salesInven.Select(criteria);
            foreach (DataRow row in rows)
            {
                item.Text = "Order Qt.: " + txtQuantity.Text + " - Product: " + row.ItemArray[2].ToString() + " - Price: " + (Convert.ToInt32(txtQuantity.Text) * Convert.ToDecimal(row.ItemArray[7].ToString())).ToString();
                item.Value = row.ItemArray[0].ToString();
                this.lbCart.Items.Add(item);
            }
        }
    }
}