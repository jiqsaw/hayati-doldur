using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Common_ActivityNews : BaseUserControl
{
    private int _ActivityID = 0;
    public int ActivityID
    {
        get { return this._ActivityID; }
        set { this._ActivityID = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dtNews;
            if (this.ActivityID == 0)
                dtNews = BUS.News.GetLastNews();
            else
                dtNews = BUS.News.GetNewsByActivity(this.ActivityID);

            if (dtNews.Rows.Count == 0)
                dvNews.Visible = false;
            else
                LIB.DataBindHelper.BindRepeater(ref rptNews, dtNews);
        }
    }
}
