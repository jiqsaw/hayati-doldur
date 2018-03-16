using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class NewsDetail : System.Web.UI.Page
{
    private int NewsID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (int.TryParse(Request.QueryString["j"], out NewsID))
            {
                DataTable dtNews = BUS.News.GetNewsDetail(this.NewsID);
                lblTitle.Text = dtNews.Rows[0]["NewsTitle"].ToString();
                lblSubTitle.Text = Convert.ToDateTime(dtNews.Rows[0]["NewsDate"]).ToShortDateString() + " - " + dtNews.Rows[0]["CategoryName"].ToString();
                ltlDetail.Text = LIB.Util.Nl2Br(dtNews.Rows[0]["NewsDetail"].ToString());
            }
        }
    }
}
