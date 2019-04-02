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
    public partial class salesUpdate : System.Web.UI.Page
    {
        private static EmmasDataSet dsEmma;

        public static DataRow[] rows;

        static salesUpdate()
        {
            //load data at the beginning of the session
            dsEmma = new EmmasDataSet();
            receiptTableAdapter daReceipt = new receiptTableAdapter();
            orderLineTableAdapter daOrderLine = new orderLineTableAdapter();
            orderProductTableAdapter daInventory = new orderProductTableAdapter();

            try
            {
                daReceipt.Fill(dsEmma.receipt);
                daOrderLine.Fill(dsEmma.orderLine);
                daInventory.Fill(dsEmma.orderProduct);
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //doNothing.
            }
            else
            {
                load();
            }

        }

        private void load()
        {
            int id = Convert.ToInt32(Request.QueryString["receiptID"]);
            DataRow receipt = dsEmma.receipt.FindByid(id);
            DataRow orderLine = dsEmma.orderLine.FindByid(id);

            if (receipt != null)
            {
                txtOrderNum.Text = receipt.ItemArray[1].ToString();
                ddlCust.SelectedValue = receipt.ItemArray[5].ToString();
                ddlEmp.SelectedValue = receipt.ItemArray[6].ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["receiptID"]);
            try
            {
                //Receipt Table
                dsEmma.receipt.FindByid(id).ordNumber = this.txtOrderNum.Text;
                dsEmma.receipt.FindByid(id).paymentID = Convert.ToInt32(this.ddlPayType.SelectedValue);
                dsEmma.receipt.FindByid(id).custID = Convert.ToInt32(this.ddlCust.SelectedValue);
                dsEmma.receipt.FindByid(id).empID = Convert.ToInt32(this.ddlEmp.SelectedValue);
                Save();

                //OrderLine Table
                if(lbCart.SelectedIndex != -1)
                {
                    int value = Convert.ToInt32(rows[this.lbCart.SelectedIndex].ItemArray[5]);
                    dsEmma.orderLine.FindByid(value).orlNote = txtNotes.Text;
                    dsEmma.orderLine.FindByid(value).orlQuantity = Convert.ToInt32(txtQuantity.Text);
                    Save();
                }
            }
            catch
            {
                this.lblSave.Text = "Unable to update - Invalid Input";
            }
        }

        private string GetCartCriteria()
        {
            int id = Convert.ToInt32(Request.QueryString["receiptID"]);
            string criteria = "";
            criteria = (Request.QueryString != null) ? "receiptID = " + id : "";
            return criteria;
        }

        private void DisplayCart()
        {
            this.lbCart.Items.Clear();
            foreach (DataRow row in rows)
            {
                this.lbCart.Items.Add("Order Qt.: " + row.ItemArray[2].ToString() + " - Product: " + row.ItemArray[3].ToString() + " - Price: " + row.ItemArray[1].ToString());
            }
        }

        protected void btnViewCart_Click(object sender, EventArgs e)
        {
            // Detail View visibility
            if(lbCart.Visible == false)
            {
                lbCart.Visible = true;
            }
            else
            {
                lbCart.Visible = false;
            }

            // Get and Show Cart Products
            if (dsEmma.orderProduct.Count > 0)
            {
                string criteria = GetCartCriteria();
                rows = (criteria.Length > 0) ? dsEmma.orderProduct.Select(criteria) : dsEmma.orderProduct.Select();
                DisplayCart();
            }
            else
            {
                this.lblSave.Text = "No Product Records";
            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            int prodSelected = Convert.ToInt32(rows[this.lbCart.SelectedIndex].ItemArray[5]);
            DataRow Product = dsEmma.orderProduct.FindByid(prodSelected);
            txtNotes.Text = Product.ItemArray[8].ToString();
            txtQuantity.Text = Product.ItemArray[2].ToString();
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }

        private void Save()
        {
            receiptTableAdapter daReceipt = new receiptTableAdapter();
            orderLineTableAdapter daOrderLine = new orderLineTableAdapter();
            try
            {
                daReceipt.Update(dsEmma.receipt);
                daOrderLine.Update(dsEmma.orderLine);
                dsEmma.AcceptChanges();
                this.lblSave.Text = "Sale has been updated successfully.";
            }
            catch
            {
                dsEmma.RejectChanges();
                this.lblSave.Text = "Unable to add sale - All changes have been rejected.";
            }
        }
    }
}