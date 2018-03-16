using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_KampusRehberi_uKampusRehberi : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            Bind();
    }

    protected void Bind()
    {
        DataTable dt = BUS.Orientation.GetOrientationUniversities();
        LIB.DataBindHelper.BindRepeater(ref rpt, dt);
    }
}
