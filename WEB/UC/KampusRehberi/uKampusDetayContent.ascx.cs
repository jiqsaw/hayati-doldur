using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_KampusRehberi_uKampusDetayContent : System.Web.UI.UserControl
{
    public string Title { set { ltlTitle.Text = value; } }

    protected void Page_Load(object sender, EventArgs e)
    {        
    }

    public void Bind(DataTable dt)
    {
        LIB.DataBindHelper.BindRepeater(ref rptValues, dt);
    }

}