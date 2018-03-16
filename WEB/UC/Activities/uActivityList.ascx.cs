using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_Activities_uActivityList : BaseUserControl
{
    private int ListType;    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (int.TryParse(Request.QueryString["lt"], out ListType))
            {
                if ((ListType < 1) || (ListType > 2))
                    this.qoDefaultPage();
                switch (ListType)
                {
                    case (int)COM.Enum.ListType.SearchResult:
                        ltlSearchResult.Visible = true;
                        BindSearchResult();
                        break;

                    case (int)COM.Enum.ListType.UpComingActivities:
                        ltlUpComing.Visible = true;
                        BindUpComing();
                        break;
                }
            }
            else
                this.qoDefaultPage();
        }
    }

    protected void BindSearchResult()
    {
        string SearchText = "";
        DateTime StartDate = DateTime.MinValue;
        DateTime EndDate = DateTime.MaxValue;
        int CategoryID = 0;
        int LocationID = 0;

        try
        {
            if (Request.QueryString["s"] != null)
                SearchText = Request.QueryString["s"].ToString();

            if (Request.QueryString["SD"] != null)
                StartDate = Convert.ToDateTime(Request.QueryString["SD"]);

            if (Request.QueryString["ED"] != null)
                EndDate = Convert.ToDateTime(Request.QueryString["ED"]);

            if (Request.QueryString["c"] != null)
                CategoryID = int.Parse(Request.QueryString["c"].ToString());

            if (Request.QueryString["l"] != null)
                LocationID = int.Parse(Request.QueryString["l"].ToString());
        }
        catch (Exception)
        {
            this.qoDefaultPage();
        }

        DataTable dt = BUS.Activities.ActivitySearch(CategoryID, LocationID, SearchText, StartDate, EndDate, 1);

        if (dt.Rows.Count > 0)
            Paging1.GeneratePager(ref dt, rptList);
        else
            ltlNoResult.Visible = false;
    }

    protected void BindUpComing()
    {
        if (!this.smIsLogin)
            this.qoDefaultPage();

        DataTable dt = BUS.Users.GetUpcomingActivitesByUser(this.smUserID);
        LIB.DataBindHelper.BindRepeater(ref rptList, dt);

        Paging1.Visible = false;

    }
    protected void rptList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            int CategoryID = int.Parse(((Literal)e.Item.FindControl("ltlCategoryID")).Text);
            Image imgCategory = ((Image)e.Item.FindControl("imgCategory"));
            imgCategory.ImageUrl = imgCategory.ImageUrl.Replace("||CategoryID||", CategoryID.ToString());

            Literal ltlCategory = ((Literal)e.Item.FindControl("ltlCategory"));
            
            HyperLink hlTitle = ((HyperLink)e.Item.FindControl("hlTitle"));
            hlTitle.NavigateUrl = this.strActivityDetailPage(Convert.ToInt32(hlTitle.NavigateUrl), ltlCategory.Text, hlTitle.Text);
        }
    }
}