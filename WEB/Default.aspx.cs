using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Def : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();
    }

    private void BindData()
    {
        DataTable dtComments = BUS.Comments.GetLastComments();
        LIB.DataBindHelper.BindRepeater(ref rptComments, dtComments);
    }
}
