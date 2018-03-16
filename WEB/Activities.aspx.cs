using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Activities : System.Web.UI.Page
{
    private int CategoryID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (int.TryParse(Request.QueryString["c"], out CategoryID))
                BindCategory();
        }
    }

    protected void BindCategory()
    {
        uActivities1.BindCategory(this.CategoryID);
    }
}