using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Common_Banner : System.Web.UI.UserControl
{
    private string sRndBannerName;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sRndBannerName"] != null)
            if (Session["sRndBannerName"] == "1")
                Session["sRndBannerName"] = "2";
            else
                Session["sRndBannerName"] = "1";
        else      
            Session["sRndBannerName"] = "1";
    }
}