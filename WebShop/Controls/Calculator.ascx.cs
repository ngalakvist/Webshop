using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_Calculator : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        if (txtValueOne.Text.Length > 0 && txtValueTwo.Text.Length > 0)
        {
            double result = 0;
            double value1 = Convert.ToDouble(txtValueOne.Text);
            double value2 = Convert.ToDouble(txtValueTwo.Text);

            Calculator myCalculator = new Calculator();

            Trace.Write(string.Format("Performing the calculation with the {0} operator",
                        lstOperator.SelectedValue));

            switch (lstOperator.SelectedValue)
            {
                case "+":
                    result = myCalculator.Add(value1, value2);
                    break;
                case "-":
                    result = myCalculator.Subtract(value1, value2);
                    break;
                case "*":
                    result = myCalculator.Multiply(value1, value2);
                    break;
                case "/":
                    result = myCalculator.Divide(value1, value2);
                    break;
            }
            lblResult.Text = result.ToString();
        }
        else
        {
            lblResult.Text = string.Empty;
            Trace.Warn("Custom Category",
                            "TextBox controls are empty; time to add Validation controls?");
        }
    }
}
