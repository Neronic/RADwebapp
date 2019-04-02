/*Coded by Jacob Fields*/
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using aLibrary;
using aLibrary.EmmasDataSetTableAdapters;

namespace RADwebApp.Forms.RepairPages
{
    public partial class OrderTools : System.Web.UI.Page
    {

        private static EmmasDataSet dsOrderTools;

        public string custFirst;
        public string custLast;
        public string empFirst;
        public string empLast;
        public string eqpMod;
        public string sqlSrNo;
        public string eqpType;
        public string ordNo;
        public DateTime ordDate;
        GridView inputItem = new GridView();


        static OrderTools()
        {
            dsOrderTools = new EmmasDataSet();
            orderToolsSelectTableAdapter daOrderTools = new orderToolsSelectTableAdapter();
            OrderToolsNewAddTableAdapter daNewTools = new OrderToolsNewAddTableAdapter();
            try
            {
                daNewTools.Fill(dsOrderTools.OrderToolsNewAdd);

            }
            catch { }
        }

        public void Page_Init(object sender, EventArgs e)
        {
            gvToolOrders.EnableDynamicData(typeof(OrderTools));
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            ordDate = DateTime.Now;
            if (this.IsPostBack) return;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           

            try
            {
                DataRow rows = dsOrderTools.OrderToolsNewAdd.NewRow();
                rows[1] = this.txtCustFirst.Text;
                rows[2] = this.txtCustLast.Text;
                rows[3] = this.txtEmpLast.Text;
                rows[4] = this.txtEmpLast.Text;
                rows[5] = this.txtEqpMod.Text;
                rows[6] = this.txtEqpSerNo.Text;
                rows[7] = this.txtEqpType.Text;
                rows[8] = this.txtOrDate.Text;
                rows[9] = this.txtOrNo.Text;
                dsOrderTools.OrderToolsNewAdd.Rows.Add(rows);
                
            }
            catch
            {

            }
            /*
            string inpCustFirst = Convert.ToString(txtCustFirst.Text);
            string inpCustLast = Convert.ToString(txtCustLast.Text);
            string inpEmpFirst = Convert.ToString(txtEmpFirst.Text);
            string inpEmpLast = Convert.ToString(txtEmpLast.Text);
            string inpEqpMod = Convert.ToString(txtEqpMod.Text);
            string inpEqpSerial = Convert.ToString(txtEqpSerial.Text);
            string inpEqpType = Convert.ToString(txtEqpType.Text);
            string inpOrdDate = Convert.ToString(txtOrdDate.Text);
            string inpOrdNo = Convert.ToString(txtOrdNo.Text);
            bool inpPaid = Convert.ToBoolean(txtPaid.Text);


            try
            {
                this.Validate();
                DataRow drNew = dsEmmas.orderToolsSelect.NewRow();
                drNew.ItemArray[0] = inpCustFirst;
                drNew.ItemArray[1] = inpCustLast;
                drNew.ItemArray[2] = inpEmpFirst;
                drNew.ItemArray[3] = inpEmpLast;
                drNew.ItemArray[4] = inpEqpMod;
                drNew.ItemArray[5] = inpEqpSerial;
                drNew.ItemArray[6] = inpEqpType;
                drNew.ItemArray[7] = inpOrdDate;
                drNew.ItemArray[8] = inpOrdNo;
                dsEmmas.orderToolsSelect.Rows.Add(drNew);
            }
            catch { }
            */
            
            //btnNewOrder.Visible = true;
            gvToolOrders.Visible = true;

            lblCustFirst.Visible = false;
            lblCustLast.Visible = false;
            lblEmpFirst.Visible = false;
            lblEmpLast.Visible = false;
            lblEqpSerNo.Visible = false;
            lblEqpType.Visible = false;
            lblEquipMod.Visible = false;
            lblOrDate.Visible = false;
            lblOrNo.Visible = false;


            txtCustFirst.Visible = false;
            txtCustLast.Visible = false;
            txtEmpFirst.Visible = false;
            txtEmpLast.Visible = false;
            txtEqpSerNo.Visible = false;
            txtEqpType.Visible = false;
            txtEqpMod.Visible = false;
            txtOrDate.Visible = false;
            txtOrNo.Visible = false;
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }


        protected void btnNewOrder_Click(object sender, EventArgs e)
        {
            
            //btnNewOrder.Visible = false;
            gvToolOrders.Visible = false;
            lblCustFirst.Visible = true;
            lblCustLast.Visible = true;
            lblEmpFirst.Visible = true;
            lblEmpLast.Visible = true;
            lblEqpSerNo.Visible = true;
            lblEqpType.Visible = true;
            lblEquipMod.Visible = true;
            lblOrDate.Visible = true;
            lblOrNo.Visible = true;

 
            txtCustFirst.Visible = true;
            txtCustLast.Visible = true;
            txtEmpFirst.Visible = true;
            txtEmpLast.Visible = true;
            txtEqpSerNo.Visible = true;
            txtEqpType.Visible = true;
            txtEqpMod.Visible = true;
            txtOrDate.Visible = true;
            txtOrNo.Visible = true;

        }

   
    }
}