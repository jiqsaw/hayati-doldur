using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Common_Error : System.Web.UI.UserControl
{
    public string Title
    {
        get { return ltlTitle.Text; }
        set { ltlTitle.Text = value; }
    }

    public string Desc
    {
        get { return lblDesc.Text; }
        set { lblDesc.Text = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
