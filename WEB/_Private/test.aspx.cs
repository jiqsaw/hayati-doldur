using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strTime = "";
        DateTime inDate = DateTime.Now.AddMinutes(-2);

        TimeSpan ts = DateTime.Now - inDate;
        if (ts.Days >= 365)
            strTime = ((int)(ts.Days / 365)).ToString() + " yıl";

        else if (ts.Days >= 30)
            strTime = ((int)(ts.Days / 30)).ToString() + " ay";

        else if (ts.Days >= 7)
            strTime = ((int)(ts.Days / 7)).ToString() + " hafta";

        else if (ts.Days >= 1)
            strTime = ts.Days.ToString() + " gün";

        else if (ts.Hours >= 1)
            strTime = ts.Hours.ToString() + " saat";

        else if (ts.Minutes >= 1)
            strTime = ts.Minutes.ToString() + " dakika";

        else if (ts.Seconds >= 1)
            strTime = ts.Seconds.ToString() + " dakika";

        Response.Write(strTime);
    }
}
