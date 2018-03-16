using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Common_Success : System.Web.UI.UserControl
{
    public string Desc
    {
        get { return ltlDesc.Text; }
        set { ltlDesc.Text = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
